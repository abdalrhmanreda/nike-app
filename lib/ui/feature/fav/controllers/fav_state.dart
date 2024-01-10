part of 'fav_cubit.dart';

@immutable
abstract class FavState {}

class FavInitial extends FavState {}

class LoadingState extends FavState {}

class SuccessState extends FavState {}

class FailureState extends FavState {
  final String error;
  FailureState({required this.error});
}

class FavAdded extends FavState {}

class FavRemoved extends FavState {}

class FavError extends FavState {}

class FavLoading extends FavState {}

class GetFavSuccess extends FavState {}
