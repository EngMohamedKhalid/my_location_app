import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../app/utils/consts.dart';

abstract class PaymentClass{

  static Future<void>makePayment(int amount,String currency)async{
    try{
      String secret= await getClientSecret((amount*100).toString(), currency);
      await initSheet(secret);
      await Stripe.instance.presentPaymentSheet();
    }catch(error){
      throw Exception(error.toString());
    }

    // try {
    //   String clientSecret=await _getClientSecret((amount*100).toString(), currency);
    //   await _initializePaymentSheet(clientSecret);
    //   await Stripe.instance.presentPaymentSheet();
    // } catch (error) {
    //   throw Exception(error.toString());
    // }
  }

  static Future<void> initSheet(String clientSecret)async{
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: "mohamed"
        ),
    );
  }
  // static Future<void>_initializePaymentSheet(String clientSecret)async{
  //   await Stripe.instance.initPaymentSheet(
  //     paymentSheetParameters: SetupPaymentSheetParameters(
  //       paymentIntentClientSecret: clientSecret,
  //       merchantDisplayName: "Basel",
  //     ),
  //   );
  // }

  // static Future<String> _getClientSecret(String amount,String currency)async{
  //   Dio dio=Dio();
  //   var response= await dio.post(
  //     'https://api.stripe.com/v1/payment_intents',
  //     options: Options(
  //       headers: {
  //         'Authorization': 'Bearer $secretKey',
  //         'Content-Type': 'application/x-www-form-urlencoded'
  //       },
  //     ),
  //     data: {
  //       'amount': amount,
  //       'currency': currency,
  //     },
  //   );
  //   return response.data["client_secret"];
  // }


static Future<String> getClientSecret(String amount,String currencyCode)async {
    Dio dio =Dio();
   final res= await dio.post(
       'https://api.stripe.com/v1/payment_intents',
     options: Options(
       headers: {
         'Authorization': 'Bearer $secretKey',
         'Content-Type': 'application/x-www-form-urlencoded'
       },
     ),
     data: {
       'amount': amount,
       'currency': currencyCode,
     }
   );
    return res.data["client_secret"];
}

}