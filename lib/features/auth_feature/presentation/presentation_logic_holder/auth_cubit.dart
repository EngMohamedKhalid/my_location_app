import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_location_app/app/utils/get_it_injection.dart';
import 'package:my_location_app/app/widgets/loading.dart';
import 'package:my_location_app/features/auth_feature/domain/usecases/submit_phone_use_case.dart';

import '../../../../app/utils/hanlders/error_state_handler.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
 static AuthCubit get(context)=>BlocProvider.of(context);
 String ? verificationId;


  Future<void> submitPhoneNumber(String phoneNumber) async {
    emit(AuthLoading());
  await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 15),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
  );
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    print('verificationCompleted');
    await signIn(credential);
  }

  void verificationFailed(FirebaseAuthException error) {
    print('verificationFailed : ${error.toString()}');
    //emit(ErrorOccurred(errorMsg: error.toString()));
    emit(AuthInitial());
  }

  void codeSent(String verificationId, int? resendToken) {
    print('codeSent');
    verificationId = verificationId;
    emit(AuthInitial());
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    print('codeAutoRetrievalTimeout');
  }

  Future<void> submitOTP(String otpCode) async {
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(
            verificationId: verificationId??"", smsCode: otpCode
            );

    await signIn(credential);
  }

  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(AuthInitial());
    } catch (error) {
      print(error.toString());
      emit(AuthInitial());
    }
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  User getLoggedInUser() {
    User firebaseUser = FirebaseAuth.instance.currentUser!;
    return firebaseUser;
  }
}
