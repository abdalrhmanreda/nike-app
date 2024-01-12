import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../home/models/ProductModel.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  static SearchCubit get(context) => BlocProvider.of(context);

  List<ProductModel> searchList = [];
  void search(String query) {
    searchList = [];
    emit(LoadingSearchState());
    FirebaseFirestore.instance
        .collection('products')
        .where('name', isGreaterThanOrEqualTo: query)
        .get()
        .then((value) {
      for (var element in value.docs) {
        searchList.add(ProductModel.fromJson(element.data()));
      }
      emit(SuccessSearchState());
    }).catchError((error) {
      emit(FailureSearchState());
    });
  }
}
