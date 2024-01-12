part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartLoadingState extends CartState {}

class CartFailureState extends CartState {}

class ClearCartState extends CartState {}

class AddToCartState extends CartState {}

class RemoveFromCartState extends CartState {}

class GetCartState extends CartState {}
