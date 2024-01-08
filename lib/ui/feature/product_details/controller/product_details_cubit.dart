import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nike/generated/assets.dart';

import '../../home/models/ProductModel.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());
  static ProductDetailsCubit get(context) => BlocProvider.of(context);

  List<ProductModel> moreLikeThis = [];
  void getMoreLikeThis({required String brand}) {
    moreLikeThis.isEmpty;
    emit(LoadingState());
    rootBundle.loadString(Assets.dataBrands).then((value) {
      (jsonDecode(value)[brand]).forEach((element) {
        moreLikeThis.add(ProductModel.fromJson(element));
      });

      emit(SuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(FailureState(error: error.toString()));
    });
  }
}
