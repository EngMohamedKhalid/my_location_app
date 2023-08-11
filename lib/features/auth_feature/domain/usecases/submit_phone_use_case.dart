import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:my_location_app/app/error/failures.dart';
import 'package:my_location_app/app/usecase/usecase.dart';

import '../repo/auth_repo.dart';

class SubmitPhoneUseCase implements UseCase<void , String >{
  final AuthRepo repository;

  SubmitPhoneUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call(String phoneNumber) async{
   return await repository.phoneLogin(phoneNumber);
  }

}
