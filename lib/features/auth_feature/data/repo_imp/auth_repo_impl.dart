import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_platform_interface/src/firebase_auth_exception.dart';
import 'package:firebase_auth_platform_interface/src/providers/phone_auth.dart';
import 'package:my_location_app/app/error/failures.dart';
import 'package:my_location_app/features/auth_feature/domain/repo/auth_repo.dart';

import '../../../../app/network/network_info.dart';
import '../../../../app/utils/hanlders/repo_impl_callhandler.dart';
import '../data_source/auth_remote_data_source.dart';

class AuthRepoImpl extends AuthRepo{
  final AuthRemoteDataSource authRemoteDataSource;
  final NetworkInfo networkInfo;
  AuthRepoImpl({required this.authRemoteDataSource,required this.networkInfo});
  @override
  Future<Either<Failure, void>> codeAuto(String vId) async {
    return await RepoImplCallHandler<void>(networkInfo)(() async {
      final result= await authRemoteDataSource.codeAuto(vId);
      return  result;
    });;
  }

  @override
  Future<Either<Failure, void>> codeSent(String vId, int? resToken)async {
    return await RepoImplCallHandler<void>(networkInfo)(() async {
      final result= await authRemoteDataSource.codeSent(vId, resToken);
      return  result;
    });
  }

  @override
  Future<Either<Failure, User>> getUser() async {
    return await RepoImplCallHandler<User>(networkInfo)(() async{
      final res = await authRemoteDataSource.getUser();
      return res;
    });
  }

  @override
  Future<Either<Failure, void>> logout()async {
    return await RepoImplCallHandler<void>(networkInfo)(() async{
      final res = await authRemoteDataSource.logout();
      return res;
    });
  }

  @override
  Future<Either<Failure, void>> phoneLogin(String phoneNumber)async {
    return await RepoImplCallHandler<void>(networkInfo)(() async{
      final res = await authRemoteDataSource.phoneLogin(phoneNumber);
      return res;
    });
  }

  @override
  Future<Either<Failure, void>> signIn(PhoneAuthCredential phoneAuthCredential)async {
    return await RepoImplCallHandler<void>(networkInfo)(() async{
      final res = await authRemoteDataSource.signIn(phoneAuthCredential);
      return res;
    });
  }

  @override
  Future<Either<Failure, void>> submitOtp(String code)async {
    return await RepoImplCallHandler<void>(networkInfo)(() async{
      final res = await authRemoteDataSource.submitOtp(code);
      return res;
    });
  }

  @override
  Future<Either<Failure, void>> verificationComplete(PhoneAuthCredential phoneAuthCredential)async {
    return await RepoImplCallHandler<void>(networkInfo)(() async{
      final res = await authRemoteDataSource.verificationComplete(phoneAuthCredential);
      return res;
    });
  }
  
  @override
  Future<Either<Failure, String>> verificationFailed(FirebaseAuthException exception)async {
    return await RepoImplCallHandler<String>(networkInfo)(() async{
      final res = await authRemoteDataSource.verificationFailed(exception);
      return res;
    });
  }

}