import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_location_app/app/widgets/otp_widget.dart';
import 'package:my_location_app/features/auth_feature/presentation/presentation_logic_holder/auth_cubit.dart';
import 'package:my_location_app/features/auth_feature/presentation/screens/home_screen.dart';

import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/loading.dart';

class OptScreen extends StatefulWidget {
  const OptScreen({super.key});

  @override
  State<OptScreen> createState() => _OptScreenState();
}

class _OptScreenState extends State<OptScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OtpWidget(
                  controller: controller,
                  length: 6,
                  onCompleted: (String code) {
                  },
                ),
                state is AuthLoading ? const Loading() :
                ElevatedButton(
                  child: const Text('Submit'),
                  onPressed: () {
                    print(controller.text);
                    cubit.submitOTP(controller.text).then((value) {
                      Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const HomeScreen(),),
                      );
                    },
                    );
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
