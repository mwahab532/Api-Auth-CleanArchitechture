import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/Commans/shared/bloc/Cubit_themeMode.dart';
import 'package:fluttertest/features/Auth/presentation/Auth_screens/SignUp.dart';
import 'package:fluttertest/features/DisplayUsers/presentation/bloc/Users_Cubit.dart';
import 'package:fluttertest/indpendecy_injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await intializeDependency();
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UsersCubit>(create: (context) => sl<UsersCubit>()),
        BlocProvider<ThemeCubit>(create: (context) => sl<ThemeCubit>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter_test',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: themeMode,
            home: SignupPage(),
          );
        },
      ),
    );
  }
}
// eve.holt@reqres.in
// pistol
// cityslicka