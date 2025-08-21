import 'package:dartz/dartz.dart';
import 'package:fluttertest/core/usecase/UseCase.dart';
import 'package:fluttertest/features/Auth/data/model/SignUp_Model.dart';
import 'package:fluttertest/features/Auth/domain/repository/Auth_repository.dart';
import 'package:fluttertest/indpendecy_injection.dart';



class SignupUseCase implements UseCase<Either, SignUpReq> {
  @override
  Future<Either> call({SignUpReq? params})async {
    return sl<AuthRepository>().SignUpRequest(params!);
  }

  
}