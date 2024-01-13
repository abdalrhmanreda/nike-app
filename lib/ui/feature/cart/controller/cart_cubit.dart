import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/strings.dart';
import '../../home/models/ProductModel.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  static CartCubit get(context) => BlocProvider.of(context);

  Map<String, dynamic> cartIds = {};
  double totalPrice = 0.0;

  void addToCart({required ProductModel productModel}) async {
    if ((!await isProductInCart(userId!, productModel.id!))) {
      emit(CartLoadingState());
      FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('cart')
          .doc(productModel.id!)
          .set(productModel.toJson(true))
          .then((value) {
        getCart();
        emit(AddToCartState());
      }).catchError((e) {
        emit(CartFailureState());
      });
    }
  }

  List<ProductModel> cartProducts = [];

  void getCart() {
    emit(CartLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('cart')
        .get()
        .then((value) {
      cartProducts = [];

      for (var element in value.docs) {
        cartProducts.add(ProductModel.fromJson(element.data()));
        cartIds[element.id] = true;
        totalPrice += element.data()['initialPrice'];
      }
      print(cartIds);
      emit(GetCartState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(CartFailureState());
    });
  }

  Future<bool> isProductInCart(String userId, String productId) async {
    Completer<bool> completer = Completer<bool>();

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('cart')
        .doc(productId)
        .get()
        .then((value) {
      debugPrint(value.data().toString());
      completer.complete(value.exists);
    }).catchError((error) {
      debugPrint(error.toString());
      completer.completeError(error);
    });

    return completer.future;
  }

  void removeFromCart({required String productId}) {
    emit(CartLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('cart')
        .doc(productId)
        .delete()
        .then((value) {
      getCart();
      cartIds.remove(productId);
      totalPrice -= cartIds[productId].initialPrice!;
      emit(RemoveFromCartState());
    }).catchError((e) {
      emit(CartFailureState());
    });
  }

  void clearCart() {
    emit(CartLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('cart')
        .get()
        .then((value) {
      for (var element in value.docs) {
        element.reference.delete();
      }
      cartProducts.clear();
      totalPrice = 0.0;
      cartIds.clear();
      emit(ClearCartState());
    }).catchError((e) {
      debugPrint(e.toString());
      emit(CartFailureState());
    });
  }
}
