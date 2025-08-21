import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/features/DisplayUsers/data/models/Model.dart';
import 'package:fluttertest/features/DisplayUsers/domain/usecases/getuser_Usecaase.dart';
import 'package:fluttertest/features/DisplayUsers/presentation/bloc/User_CubitState.dart';

class UsersCubit extends Cubit<UserCubitstate> {
  final GetUserUseCase getUserUseCase;
  late DataModel _allUserData;
  UsersCubit({required this.getUserUseCase}) : super(InitialUserState());

  Future<void> fetchUsers() async {
    try {
      emit(UserStateloading());
      _allUserData = await getUserUseCase();
      emit(UserStateloaded(_allUserData));
    } catch (e) {
      emit(UserErrorState());
    }
  }

  void searchUsers(String query) {
    if (state is UserStateloaded) {
      final allUsers = _allUserData.data ?? [];
      final filtered =
          allUsers.where((user) {
            final name = (user.firstName ?? '').toLowerCase();
            final email = (user.email ?? '').toLowerCase();
            return name.contains(query.toLowerCase()) ||
                email.contains(query.toLowerCase());
          }).toList();

      emit(UserStateloaded(_allUserData, filtered: filtered));
    }
  }
}
