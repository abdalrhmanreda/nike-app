part of 'product_details_cubit.dart';

@immutable
abstract class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}

class LoadingState extends ProductDetailsState {}

class SuccessState extends ProductDetailsState {}

class FailureState extends ProductDetailsState {
  final String error;

  FailureState({required this.error});
}
