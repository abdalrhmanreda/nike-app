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

  final _favController = StreamController<List<ProductModel>>();
  Stream<List<ProductModel>> get favStream => _favController.stream;

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
        getFav(userId!);
        emit(FavAdded());
      }).catchError((e) {
        emit(FavError());
      });
    }
  }

  List<ProductModel> favProducts = [];

  void getFav(String userId) {
    favProducts = [];

    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('fav')
        .snapshots()
        .listen((querySnapshot) {
      favProducts = querySnapshot.docs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList();
      for (var element in favProducts) {
        favId[element.id!] = true;
      }

      _favController.add(favProducts);
    }, onError: (error) {
      debugPrint(error.toString());
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
      getFav(userId!);
      favId.remove(productId);
      emit(FavRemoved());
    }).catchError((e) {
      emit(FavError());
    });
  }

  void dispose() {
    _favController.close();
  }
}
