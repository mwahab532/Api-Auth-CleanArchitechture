import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/Commans/shared/bloc/Button_Cubit.dart';
import 'package:fluttertest/Commans/shared/bloc/Button_state_Cubit.dart';
import 'package:fluttertest/Commans/widget/Button.dart';
import 'package:fluttertest/features/Auth/data/model/SignUp_Model.dart';
import 'package:fluttertest/features/Auth/domain/usecases/signUp_Usecase.dart';
import 'package:fluttertest/features/Auth/presentation/Auth_screens/SignIn.dart';
import 'package:fluttertest/features/DisplayUsers/presentation/screens/ResponsivePage.dart';
import 'package:fluttertest/indpendecy_injection.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ButtonStateCubit(),
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonSuccessState) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ResponsivePage()),
              );
            }
            if (state is ButtonFailureState) {
              var snackBar = SnackBar(content: Text(state.errorMessage));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          child: SafeArea(
            minimum: const EdgeInsets.only(top: 100, right: 16, left: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _signup(),
                  const SizedBox(height: 20),
                  _emailField(),
                  const SizedBox(height: 20),
                  _password(),
                  const SizedBox(height: 60),
                  _createAccountButton(context),
                  const SizedBox(height: 20),
                  _signinText(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _signup() {
    return const Text(
      'Sign Up',
      style: TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
    );
  }

  Widget _emailField() {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 300),
        child: TextField(
          controller: _emailCon,
          decoration: const InputDecoration(
            hintText: 'Email',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
        ),
      ),
    );
  }

  Widget _password() {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 300),
        child: TextField(
          controller: _passwordCon,
          decoration: const InputDecoration(
            hintText: 'Password',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
        ),
      ),
    );
  }

  Widget _createAccountButton(BuildContext context) {
    return Builder(
      builder: (context) {
        return BasicAppButton(
          title: 'Create Account',
          onPressed: () {
            context.read<ButtonStateCubit>().excute(
              usecase: sl<SignupUseCase>(),
              params: SignUpReq(
                email: _emailCon.text,
                password: _passwordCon.text,
              ),
            );
          },
        );
      },
    );
  }

  Widget _signinText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(
            text: 'Do you have account?',
            style: TextStyle(
              color: Color(0xff3B4054),
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: ' Sign In',
            style: const TextStyle(
              color: Colors.purple,
              fontWeight: FontWeight.w500,
            ),
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SigninPage()),
                    );
                  },
          ),
        ],
      ),
    );
  }
}
