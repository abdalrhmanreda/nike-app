import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nike/core/api/api_constant.dart';
import 'package:nike/core/api/dio_helper.dart';
import 'package:nike/core/cache/hive_cache.dart';
import 'package:nike/ui/feature/authentication/models/ResponeModel.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) {
    emit(LoadingState());
    DioHelper.postData(
      url: ApiConstant.signUp,
      data: {
        "name": name,
        "email": email,
        "password": password,
        "rePassword": password,
        "phone": phone,
      },
    ).then((value) {
      ResponeModel responeModel = ResponeModel.fromJson(value.data);
      ApiConstant.token = responeModel.token!;
      HiveCache.saveData(key: 'token', value: responeModel.token!);
      print(responeModel.token!);
      emit(RegisterSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(FailureState(error: error.toString()));
    });
  }

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoadingState());
    DioHelper.postData(
      url: ApiConstant.signIn,
      data: {
        "email": email,
        "password": password,
      },
    ).then((value) {
      ResponeModel responeModel = ResponeModel.fromJson(value.data);
      ApiConstant.token = responeModel.token!;
      HiveCache.saveData(key: 'token', value: responeModel.token!);
      print(responeModel.token!);
      emit(LoginSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(FailureState(error: error.toString()));
    });
  }
  //
  // void logout() {
  //   emit(LoadingState());
  //   FirebaseAuth.instance.signOut().then((value) {
  //     emit(LogoutSuccessState());
  //   }).catchError((error) {
  //     emit(FailureState(error: error.toString()));
  //   });
  // }
  //
  // void userRegister(
  //     {required String email, required String password, required String name}) {
  //   emit(LoadingState());
  //   FirebaseAuth.instance
  //       .createUserWithEmailAndPassword(email: email, password: password)
  //       .then((value) {
  //     createUser(email: email, name: name, uId: value.user!.uid);
  //     userId = value.user!.uid;
  //   }).catchError((error) {
  //     emit(FailureState(error: error.toString()));
  //   });
  // }
  //
  // void createUser({
  //   required String email,
  //   required String name,
  //   required String uId,
  // }) {
  //   UserModel userModel = UserModel(
  //     name: name,
  //     email: email,
  //     profileImage:
  //         'https://cdn1.iconfinder.com/data/icons/user-pictures/100/unknown-512.png',
  //     phone: '',
  //     address: '',
  //   );
  //   emit(LoadingState());
  //
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(uId)
  //       .set(userModel.toJson())
  //       .then((value) {
  //     getUserData(userId: uId);
  //     emit(CreateUserSuccessState());
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(FailureState(error: error.toString()));
  //   });
  // }
  //
  // UserModel? userModel;
  // void getUserData({required String userId}) {
  //   emit(LoadingState());
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(userId)
  //       .get()
  //       .then((value) {
  //     userModel = UserModel.fromJson(value.data()!);
  //
  //     print(userModel!.email);
  //
  //     emit(GetUserDataSuccessState());
  //   }).catchError((error) {
  //     emit(FailureState(error: error.toString()));
  //   });
  // }
  //
  // File? profilePhoto;
  // final picker = ImagePicker();
  //
  // Future<void> getProfileImage() async {
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     profilePhoto = File(pickedFile.path);
  //     emit(PickProfileImageSuccessState());
  //   } else {
  //     print('No Image Selected');
  //     emit(FailureState(error: 'error'));
  //   }
  // }
  //
  // void uploadImage({
  //   String? name,
  //   String? email,
  //   String? phone,
  //   String? address,
  // }) {
  //   firebase_storage.FirebaseStorage.instance
  //       .ref()
  //       .child('users/${Uri.file(profilePhoto!.path).pathSegments.last}')
  //       .putFile(profilePhoto!)
  //       .then((p0) {
  //     p0.ref.getDownloadURL().then((value) {
  //       updateUserData(
  //           name: name,
  //           profileImage: value,
  //           address: address,
  //           phone: phone,
  //           email: email);
  //       emit(UploadProfileImageSuccessState());
  //     });
  //   }).catchError((error) {
  //     emit(FailureState(error: error.toString()));
  //   });
  // }
  //
  // void updateUserData({
  //   String? name,
  //   String? email,
  //   String? phone,
  //   String? address,
  //   String? profileImage,
  // }) {
  //   UserModel model = UserModel(
  //     name: name,
  //     email: email,
  //     phone: phone,
  //     address: address,
  //     profileImage: profileImage ?? userModel!.profileImage,
  //   );
  //   emit(LoadingState());
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(userId)
  //       .update(model.toJson())
  //       .then((value) {
  //     getUserData(userId: userId!);
  //     emit(UpdateUserDataSuccessState());
  //   }).catchError((error) {
  //     emit(FailureState(error: error.toString()));
  //   });
  // }
}
