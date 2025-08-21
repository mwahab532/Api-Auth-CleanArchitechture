// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fluttertest/features/Auth/domain/entities/enitities.dart';

class UserModel {
  final String email;
  final String username;

  UserModel({
    required this.email,
    required this.username
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] as String,
      username: map['username'] as String,
    );
  }

}

extension UserXModel on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      email: email,
      username: username
    );
  }
}