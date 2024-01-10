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
          .add(productModel.toJson())
          .then((value) {
        favId[productModel.id!] = value.id;
        print(value.id);
        getFav();
        emit(FavAdded());
      }).catchError((e) {
        emit(FavError());
      });
    }
  }

  List<ProductModel> favProducts = [];
  void getFav() {
    favProducts = [];
    emit(FavLoading());
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('fav')
        .get()
        .then((value) {
      for (var element in value.docs) {
        favProducts.add(ProductModel.fromJson(element.data()));
        favId[element.id] = element.id;
      }
      emit(GetFavSuccess());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(FailureState(error: error.toString()));
    });
  }

  bool isFav = false;
  Future<bool> isProductInFavorites(String userId, String productId) async {
    Completer<bool> completer = Completer<bool>();

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('fav')
        .doc('lKBeOkBWDUUjatCZfYoR')
        .get()
        .then((value) {
      print(value.data());
      completer.complete(value.exists);
    }).catchError((error) {
      print(error.toString());
      completer.completeError(error);
    });

    return completer.future;
  }
}