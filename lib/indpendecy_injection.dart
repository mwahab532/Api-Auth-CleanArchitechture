import 'package:dio/dio.dart';
import 'package:fluttertest/Commans/shared/bloc/Cubit_themeMode.dart';
import 'package:fluttertest/core/Network/dio_client.dart';
import 'package:fluttertest/features/Auth/data/repository/Auth_repository_Imp.dart';
import 'package:fluttertest/features/Auth/data/source/Auth_ApiServices.dart';
import 'package:fluttertest/features/Auth/domain/repository/Auth_repository.dart';
import 'package:fluttertest/features/Auth/domain/usecases/signIn_useCase.dart';
import 'package:fluttertest/features/Auth/domain/usecases/signUp_Usecase.dart';
import 'package:fluttertest/features/DisplayUsers/data/sources/remote/datasourse.dart';
import 'package:fluttertest/features/DisplayUsers/domain/repo/get_User_repositry.dart';
import 'package:fluttertest/features/DisplayUsers/domain/usecases/getuser_Usecaase.dart';
import 'package:fluttertest/features/DisplayUsers/presentation/bloc/Users_Cubit.dart';
import 'package:get_it/get_it.dart';

import 'features/DisplayUsers/data/repository/get_user_repo_ imp.dart';

final sl = GetIt.asNewInstance();

Future<void> intializeDependency() async {
  sl.registerSingleton<Dio>(Dio());
   sl.registerSingleton<DioClient>(DioClient());
  sl.registerLazySingleton<RemoteUserDataSource>(() => RemoteUserDataSource());
  sl.registerLazySingleton<GetUserRepositry>(() => GetUserRepoimp());
  sl.registerLazySingleton<GetUserUseCase>(
    () => GetUserUseCase(getUserRepositry: sl<GetUserRepositry>()),
  );
  sl.registerFactory(() => UsersCubit(getUserUseCase: sl<GetUserUseCase>()));
  sl.registerLazySingleton<ThemeCubit>(() => ThemeCubit());

  sl.registerSingleton<AuthApiservices>(AuthserviceImp());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImp());

  sl.registerLazySingleton<SignupUseCase>(() => SignupUseCase());
   sl.registerLazySingleton<SignInUseCase>(() => SignInUseCase());
}
