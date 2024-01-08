import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/assets.dart';
import '../models/ProductModel.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  static ProductCubit get(context) => BlocProvider.of(context);
  List<String> options = [
    'Best Selling',
    'Nike',
    'Yeezy',
    'Converse',
    'Jordan',
    'Puma',
    'Vans',
    'Cross',
    'Adidas',
    'Supreme',
  ];

  List<ProductModel> products = [];
  List<ProductModel> specificProducts = [];
  void getAllData() {
    products = [];
    emit(LoadingState());
    rootBundle.loadString(Assets.dataProducts).then((value) {
      jsonDecode(value)['data'].forEach((element) {
        products.add(ProductModel.fromJson(element));
      });
      emit(SuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(FailureState(error: error.toString()));
    });
  }

  void getSpecificProducts({required String brand}) {
    specificProducts = [];
    emit(LoadingState());
    rootBundle.loadString(Assets.dataBrands).then((value) {
      jsonDecode(value)[brand].forEach((element) {
        specificProducts.add(ProductModel.fromJson(element));
      });

      emit(SuccessState());
    }).catchError((error) {
      emit(FailureState(error: error.toString()));
    });
  }
}
