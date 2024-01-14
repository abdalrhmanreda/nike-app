import 'package:dio/dio.dart';
import 'package:nike/core/paymob/paymob_api.dart';

// class PaymobManager {
//   Future<String> getPaymentKey({
//     required int amount,
//     required String currency,
//     required bool deliveryNeeded,
//     required List items,
//   }) async {
//     try {
//       String authenticationToken = await _getAuthenticationToken();
//       int orderId = await _orderRegistration(
//           amount: (amount * 100).toString(),
//           currency: currency,
//           authToken: authenticationToken,
//           deliveryNeeded: deliveryNeeded,
//           items: items);
//       String paymentKey = await _getPaymentKey(
//           authToken: authenticationToken,
//           orderId: orderId.toString(),
//           amount: (amount * 100).toString(),
//           currency: currency,
//           integrationId: 4366762);
//       return paymentKey;
//     } catch (e) {
//       print(e.toString());
//       rethrow;
//     }
//   }
//
//   Future<String> _getAuthenticationToken() async {
//     var response =
//         await DioHelper.postData(url: PaymobApi.authenticationToken, data: {
//       'api_key': ApiConstant.paymobApiKey,
//     });
//
//     return response.data['token'];
//   }
//
//   Future<int> _orderRegistration({
//     required String amount,
//     required String currency,
//     required String authToken,
//     required bool deliveryNeeded,
//     required List items,
//   }) async {
//     var response =
//         await DioHelper.postData(url: PaymobApi.orderRegistration, data: {
//       'auth_token': authToken,
//       'delivery_needed': "$deliveryNeeded",
//       'amount_cents': amount,
//       'currency': currency,
//       'items': items,
//     });
//
//     return response.data['id'];
//   }
//
//   Future<String> _getPaymentKey({
//     required String authToken,
//     required String orderId,
//     required String amount,
//     required String currency,
//     required int integrationId,
//   }) async {
//     var response = await DioHelper.postData(url: PaymobApi.paymentKey, data: {
//       "auth_token": authToken,
//       "amount_cents": amount,
//       "expiration": 3600,
//       "order_id": orderId,
//       "billing_data": {
//         {
//           "apartment": "803",
//           "email": "claudette09@exa.com",
//           "floor": "42",
//           "first_name": "Clifford",
//           "street": "Ethan Land",
//           "building": "8028",
//           "phone_number": "+86(8)9135210487",
//           "shipping_method": "PKG",
//           "postal_code": "01898",
//           "city": "Jaskolskiburgh",
//           "country": "CR",
//           "last_name": "Nicolas",
//           "state": "Utah"
//         }
//       },
//       "currency": currency,
//       "integration_id": integrationId,
//     });
//
//     return response.data['token'];
//   }
// }

class PaymobManager {
  // process 1 => get token
  Future<String> _authenticationToken() async {
    try {
      var response = await Dio().post(PaymobApi.authenticationToken, data: {
        'api_key': PaymobApi.paymobApiKey,
      });
      return response.data['token'];
    } catch (e) {
      return e.toString();
    }
  }

  // process 2 => order registration
  Future<int> _orderRegistration({
    required String authToken,
    required String amount,
    required String currency,
    required bool deliveryNeeded,
    required List items,
  }) async {
    try {
      var response = await Dio().post(PaymobApi.orderRegistration, data: {
        'auth_token': authToken,
        'delivery_needed': "$deliveryNeeded",
        'amount_cents': amount,
        'currency': currency,
        'items': items,
      });
      print(response.data['id']);
      return response.data['id'];
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  // process 3 => get payment key
  Future<String> _paymentKey({
    required String authToken,
    required String orderId,
    required String amount,
    required String currency,
    required int integrationId,
  }) async {
    try {
      var response = await Dio().post(PaymobApi.paymentKey, data: {
        "auth_token": authToken,
        "amount_cents": amount,
        "expiration": 5000,
        "order_id": orderId,
        "billing_data": {
          "apartment": "803",
          "email": "claudette09@exa.com",
          "floor": "42",
          "first_name": "Clifford",
          "street": "Ethan Land",
          "building": "8028",
          "phone_number": "+86(8)9135210487",
          "shipping_method": "PKG",
          "postal_code": "01898",
          "city": "Jaskolskiburgh",
          "country": "CR",
          "last_name": "Nicolas",
          "state": "Utah"
        },
        "currency": currency,
        "integration_id": integrationId,
      });
      print('-------------------------${response.data['token']}');
      return response.data['token'];
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> getPaymentKey({
    required int amount,
    required String currency,
  }) async {
    String authToken = await _authenticationToken();
    int orderId = await _orderRegistration(
      authToken: authToken,
      currency: currency,
      amount: (amount * 100).toString(),
      deliveryNeeded: false,
      items: [],
    );
    String paymentKey = await _paymentKey(
      currency: currency,
      amount: (amount * 100).toString(),
      authToken: authToken,
      integrationId: PaymobApi.paymobIntegrationId,
      orderId: orderId.toString(),
    );
    return paymentKey;
  }
}

// https://accept.paymob.com/api/acceptance/iframe/804386?token
