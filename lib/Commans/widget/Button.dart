import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/Commans/shared/bloc/Button_Cubit.dart';
import 'package:fluttertest/Commans/shared/bloc/Button_state_Cubit.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;
  final double? width;
  const BasicAppButton({
    required this.onPressed,
    this.title = '',
    this.height,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonStateCubit, ButtonState>(
      builder: (context, state) {
        if (state is ButtonLoadingState) {
          return _loading(context);
        }
        return _initial(context);
      },
    );
  }

  Widget _loading(BuildContext context) {
    return Container(
      width: width ?? 300, // Use provided width or default to 300
      height: height ?? 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          minimumSize: Size(
            width ?? 300,
            height ?? 60,
          ),
        ),
        child: const CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 5,
        ),
      ),
    );
  }

  Widget _initial(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff3461F),
            offset: const Offset(0, 5),
            blurRadius: 17,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          minimumSize: Size(
            width ?? 300, 
            height ?? 60,
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}