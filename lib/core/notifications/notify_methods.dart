import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationMethods {
  static void onMessage() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(message.data.toString());
    });
  }

  static void onMessageOpenedApp() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print(message.data.toString());
    });
  }

  static Future<void> firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    print(message.data.toString());
  }

  static void onBackgroundMessage() {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }
}
