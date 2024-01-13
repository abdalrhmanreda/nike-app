import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/strings.dart';
import '../../home/models/ProductModel.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(FavInitial());

  static FavCubit get(context) => BlocProvider.of(context);
  Map<String, dynamic> favId = {};

  void addToFav({required ProductModel productModel}) async {
    if ((!await isProductInFavorites(userId!, productModel.id!))) {
      emit(FavLoading());
      FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('fav')
          .doc(productModel.id!)
          .set(productModel.toJson(true))
          .then((value) {
        getFav();
        emit(FavAdded());
      }).catchError((e) {
        emit(FavError());
      });
    }
  }

  List<ProductModel> favProducts = [];

  void getFav() {
    emit(FavLoading());
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('fav')
        .get()
        .then((value) {
      favProducts = [];

      for (var element in value.docs) {
        favProducts.add(ProductModel.fromJson(element.data()));
        favId[element.id] = true;
      }
      print(favId);
      emit(GetFavSuccess());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(FailureState(error: error.toString()));
    });
  }

  Future<bool> isProductInFavorites(String userId, String productId) async {
    Completer<bool> completer = Completer<bool>();

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('fav')
        .doc(productId)
        .get()
        .then((value) {
      completer.complete(value.exists);
    }).catchError((error) {
      debugPrint(error.toString());
      completer.completeError(error);
    });

    return completer.future;
  }

  void removeFromFav({required String productId}) {
    emit(FavLoading());
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('fav')
        .doc(productId)
        .delete()
        .then((value) {
      getFav();
      favId.remove(productId);
      emit(FavRemoved());
    }).catchError((e) {
      emit(FavError());
    });
  }

  void clearFav() {
    emit(FavLoading());
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('fav')
        .get()
        .then((value) {
      for (var element in value.docs) {
        element.reference.delete();
      }
      favId.clear();
      favProducts.clear();
      getFav();
      emit(FavRemoved());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(FailureState(error: error.toString()));
    });
  }
}
