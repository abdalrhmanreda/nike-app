import 'package:flutter/material.dart';
import 'package:nike/core/paymob/paymob_api.dart';
import 'package:paymob_payment/paymob_payment.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: OutlinedButton(
              child: const Text('Pay 10 EGP'), onPressed: () => pay(context))),
    );
  }

  void pay(context) async {
    // // String paymentKey = await PaymobManager().getPaymentKey(
    // //     amount: 10, currency: 'EGP', deliveryNeeded: false, items: []);
    // // Uri url = Uri.parse(
    // //     'https://accept.paymob.com/api/acceptance/iframes/804386?payment_token=$paymentKey');
    // // await launchUrl(url);
    // PaymentManager().getPaymentKey(amount: 10, currency: 'EGP').then((value) {
    //   Uri url = Uri.parse(
    //       'https://accept.paymob.com/api/acceptance/iframes/804386?payment_token=$value');
    //   launchUrl(url);
    // });
    PaymobPayment.instance
        .initialize(
      apiKey: PaymobApi
          .paymobApiKey, // from dashboard Select Settings -> Account Info -> API Key
      integrationID: PaymobApi
          .paymobIntegrationId, // from dashboard Select Developers -> Payment Integrations -> Online Card ID
      iFrameID: 804387, // from paymob Select Developers -> iframes
    )
        .then((value) async {
      final PaymobResponse? response = await PaymobPayment.instance.pay(
        currency: "EGP",
        amountInCents: "20000", // 200 EGP
        onPayment: (response) => print(response), context: context, // Optional
      );
      final PaymobResponse? response2 = await PaymobPayment.instance.pay(
        currency: "EGP",
        amountInCents: "20000", // 200 EGP
        onPayment: (response) => print(response), context: context, // Optional
      );
    });
  }
}
