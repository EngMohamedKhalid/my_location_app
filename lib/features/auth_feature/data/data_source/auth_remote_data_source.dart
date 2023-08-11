import 'package:firebase_auth/firebase_auth.dart';

import '../../../../app/network/network_manager.dart';
import '../../../../app/utils/consts.dart';

abstract class AuthRemoteDataSource{
  Future<void> phoneLogin(String phoneNumber);
  Future<void> verificationComplete(PhoneAuthCredential phoneAuthCredential);
  Future<String> verificationFailed(FirebaseAuthException exception);
  Future<void> codeSent(String vId , int? resToken);
  Future<void> codeAuto(String vId);
  Future<void> submitOtp(String code);
  Future<void> signIn(PhoneAuthCredential phoneAuthCredential);
  Future<void> logout();
  Future<User> getUser();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  final NetworkManager networkManager;

  AuthRemoteDataSourceImpl({required this.networkManager});
  @override
  Future<void> codeAuto(String vId) async {
    print("codeAuto ");
  }

  @override
  Future<void> codeSent(String vId, int? resToken)async {
    userVID = vId;
  }

  @override
  Future<User> getUser()async {
    return FirebaseAuth.instance.currentUser!;
  }

  @override
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<void> phoneLogin(String phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+2$phoneNumber",
      timeout: const Duration(seconds: 15),
      verificationCompleted: verificationComplete,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAuto,
    );
  }

  @override
  Future<void> signIn(PhoneAuthCredential phoneAuthCredential) async {
   await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
  }

  @override
  Future<void> submitOtp(String code) async {
    PhoneAuthCredential credential =
    PhoneAuthProvider.credential(
        verificationId: userVID, smsCode: code
    );
    signIn(credential);
  }

  @override
  Future<void> verificationComplete(PhoneAuthCredential phoneAuthCredential)async {
    signIn(phoneAuthCredential);
  }

  @override
  Future<String> verificationFailed(FirebaseAuthException exception) async {
   return exception.toString();
  }

}