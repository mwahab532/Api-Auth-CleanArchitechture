import 'package:dartz/dartz.dart';
import 'package:fluttertest/features/Auth/data/model/SignIn_Model.dart';
import 'package:fluttertest/features/Auth/data/model/SignUp_Model.dart';

 abstract class AuthRepository {
  Future<Either>SignUpRequest(SignUpReq signUp);
  Future<Either>SignInRequest(SignInReq signIn);
  Future<Either> getUser();
}
