import 'package:fluttertest/features/DisplayUsers/data/models/Model.dart';

abstract class UserCubitstate {}

class InitialUserState extends UserCubitstate {}

class UserStateloading extends UserCubitstate {}

class UserStateloaded extends UserCubitstate {
  final DataModel usersData;
  final List<Data> filteredUsers;

  UserStateloaded(this.usersData, {List<Data>? filtered})
      : filteredUsers = filtered ?? usersData.data ?? [];
}

class UserErrorState extends UserCubitstate {}
