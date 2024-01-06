part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class ChangePasswordIconState extends AuthState {}

class AuthInitial extends AuthState {}

class LoadingState extends AuthState {}

class FailureState extends AuthState {
  final String error;

  FailureState({required this.error});
}

class LoginSuccessState extends AuthState {}

class RegisterSuccessState extends AuthState {}

class CreateUserSuccessState extends AuthState {}

class GetUserDataSuccessState extends AuthState {}

class UpdateUserDataSuccessState extends AuthState {}

class PickProfileImageSuccessState extends AuthState {}

class UploadProfileImageSuccessState extends AuthState {}

class LogoutSuccessState extends AuthState {}
