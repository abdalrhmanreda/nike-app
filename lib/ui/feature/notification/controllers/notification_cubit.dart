import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nike/core/api/api_constant.dart';
import 'package:nike/core/api/dio_helper.dart';
import 'package:nike/core/constant/strings.dart';

import '../../home/models/ProductModel.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());
  static NotificationCubit get(context) => BlocProvider.of(context);

  List<ProductModel> notificationList = [];
  void sendNotification({required ProductModel productModel}) async {
    String? deviceToken = await FirebaseMessaging.instance.getToken();

    emit(NotificationLoading());
    DioHelper.postData(
      url: ApiConstant.notificationBaseUrl,
      data: {
        "to": deviceToken,
        "notification": {
          "title": "You have new order",
          "body": "Your order has been in cart successfully",
          "sound": "default"
        },
        "android": {
          "priority": "high",
          "notification": {
            "notification_priority": "PRIORITY_MAX",
            "default_light_settings": true,
            "default_sound": true,
            "default_vibrate_timings": true
          }
        },
        "data": {
          "click_action": "FLUTTER_NOTIFICATION_CLICK",
          "id": "87",
          "type": "order",
          "product": productModel.toJson()
        }
      },
    ).then((value) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('notification')
          .add(productModel.toJson())
          .then((value) {
        getNotification();
      });
      emit(NotificationSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(NotificationError());
    });
  }

  void getNotification() {
    emit(NotificationLoading());
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('notification')
        .get()
        .then((value) {
      notificationList = [];
      for (var element in value.docs) {
        notificationList.add(ProductModel.fromJson(element.data()));
      }
      emit(GetNotification());
    }).catchError((error) {
      print(error.toString());
      emit(NotificationError());
    });
  }
}
