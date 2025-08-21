import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fluttertest/core/Network/dio_client.dart';
import 'package:fluttertest/core/constants/constants.dart';
import 'package:fluttertest/features/Auth/data/model/SignIn_Model.dart';
import 'package:fluttertest/features/Auth/data/model/SignUp_Model.dart';
import 'package:fluttertest/indpendecy_injection.dart';
import 'package:shared_preferences/shared_preferences.dart';


abstract class AuthApiservices {
  Future<Either> SignUpRequest(SignUpReq signUp);
  Future<Either>SignInRequest(SignInReq signIn);
    Future<Either> getUser();
}
class AuthserviceImp extends AuthApiservices{
  @override
  Future<Either> SignUpRequest(SignUpReq signUp) async {
     try {
     var response = await sl<DioClient>().post(
      Apiurls.register,
        data: signUp.toMap(),
      );

      return Right(response);

    } on DioException catch(e) {
      return Left(e.response!.data['message']);
    }
  }
  
  @override
  Future<Either> SignInRequest(SignInReq signIn) async{
    try {

     var response = await sl<DioClient>().post(
     Apiurls.login,
        data: signIn.toMap()
      );

      return Right(response);

    } on DioException catch(e) {
      return Left(e.response!.data['message']);
    }
  }
  
  @override
  Future<Either> getUser() async{
   try {
       SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
       var token = sharedPreferences.getString('token');
       var response = await sl<DioClient>().get(
        Apiurls.baseurl,
        options: Options(
          headers: {
            'Authorization' : 'Bearer $token'
          }
        )
      );

      return Right(response);

    } on DioException catch(e) {
      return Left(e.response!.data['message']);
    } 
  }
}    