import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:my_location_app/app/utils/consts.dart';
import 'package:my_location_app/app/utils/get_it_injection.dart';
import 'package:my_location_app/bnb_screen.dart';
import 'package:my_location_app/features/ad_mob_module/ad_mob_screen.dart';
import 'package:my_location_app/features/auth_feature/presentation/login_feature/user_login_screen.dart';
import 'package:my_location_app/features/auth_feature/presentation/presentation_logic_holder/auth_cubit.dart';
import 'package:my_location_app/features/auth_feature/presentation/screens/login_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  MobileAds.instance.initialize();
  Stripe.publishableKey = publishKey;
  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider (
          create: (BuildContext context) => AuthCubit()
          ),
        ],
          child: const MyApp()
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home:  BNBScreen(),
    );
  }
}
