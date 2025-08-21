import 'package:dartz/dartz.dart';
import 'package:fluttertest/core/usecase/UseCase.dart';
import 'package:fluttertest/features/Auth/data/model/SignIn_Model.dart';
import 'package:fluttertest/features/Auth/domain/repository/Auth_repository.dart';
import 'package:fluttertest/indpendecy_injection.dart';


class SignInUseCase implements UseCase<Either, SignInReq> {
  @override
  Future<Either> call({SignInReq? params}) async {
    return await sl<AuthRepository>().SignInRequest(params!);
  }
}
