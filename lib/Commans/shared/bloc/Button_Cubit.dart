import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/Commans/shared/bloc/Button_state_Cubit.dart';
import 'package:fluttertest/core/usecase/UseCase.dart';


class ButtonStateCubit extends Cubit<ButtonState> {
  ButtonStateCubit() : super(ButtonInitialState());

 Future<void> excute({dynamic params, required UseCase usecase,}) async {
    emit(ButtonLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    try {
      Either result = await usecase.call(params: params);

      result.fold(
        (error) {
          emit(ButtonFailureState(errorMessage: error));
        },
        (data) {
          emit(ButtonSuccessState());
        },
      );
    } catch (e) {
      emit(ButtonFailureState(errorMessage: e.toString()));
    }
  }
}
