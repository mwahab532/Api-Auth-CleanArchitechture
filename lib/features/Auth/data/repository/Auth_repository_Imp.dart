import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fluttertest/features/Auth/data/model/SignIn_Model.dart';
import 'package:fluttertest/features/Auth/data/model/SignUp_Model.dart';
import 'package:fluttertest/features/Auth/data/model/userModel.dart';
import 'package:fluttertest/features/Auth/data/source/Auth_ApiServices.dart';
import 'package:fluttertest/features/Auth/domain/repository/Auth_repository.dart';
import 'package:fluttertest/indpendecy_injection.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImp implements AuthRepository {
  @override
  Future<Either<String, dynamic>> SignUpRequest(SignUpReq signUp) async {
    Either result = await sl<AuthApiservices>().SignUpRequest(signUp);
    return result.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        Response response = data;
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString('token', response.data['token']);
        return Right(response);
      },
    );
  }

  @override
  Future<Either> SignInRequest(SignInReq signIn) async {
    Either result = await sl<AuthApiservices>().SignInRequest(signIn);
    return result.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        Response response = data;
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString('token', response.data['token']);
        return Right(response);
      },
    );
  }
  
  @override
  Future<Either> getUser() async{
     Either result = await sl<AuthApiservices>().getUser();
    return result.fold(
      (error){
        return Left(error);
      },
      (data) {
        Response response = data;
        var userModel = UserModel.fromMap(response.data);
        var userEntity = userModel.toEntity();
        return Right(userEntity);
      }
    );
  }
}
