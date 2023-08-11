import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../app/error/failures.dart';

abstract class AuthRepo{
  Future<Either<Failure, void>> phoneLogin( String phoneNumber);
  Future<Either<Failure, void>> verificationComplete(PhoneAuthCredential phoneAuthCredential);
  Future<Either<Failure, String>> verificationFailed(FirebaseAuthException exception);
  Future<Either<Failure, void>> codeSent(String vId , int? resToken);
  Future<Either<Failure, void>> codeAuto(String vId);
  Future<Either<Failure, void>> submitOtp(String code);
  Future<Either<Failure, void>> signIn(PhoneAuthCredential phoneAuthCredential);
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, User>> getUser();
}