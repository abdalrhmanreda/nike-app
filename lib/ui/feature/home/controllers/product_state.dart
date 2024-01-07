part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class LoadingState extends ProductState {}

class SuccessState extends ProductState {}

class FailureState extends ProductState {
  final String error;
  FailureState({required this.error});
}
