
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_location_app/app/widgets/loading.dart';
import 'package:my_location_app/features/stripe_feature/stripe_manager.dart';

import '../presentation_logic_holder/auth_cubit.dart';

class PhoneLoginScreen extends StatefulWidget {
  const PhoneLoginScreen({super.key});

  @override
  State<PhoneLoginScreen> createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Phone Login'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: controller,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                  ),
                ),
                const SizedBox(height: 16.0),
                state is AuthLoading ? const Loading():
                ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    PaymentClass.makePayment(50000, "USD");
                    // print("+2${controller.text}");
                    // cubit.submitPhoneNumber("+2${controller.text}").then((value){
                    //   Navigator.pushReplacement(context,
                    //   MaterialPageRoute(builder: (context) => const OptScreen(),),
                    //   );
                    //   //navigateTo(const OptScreen());
                    // });


                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}