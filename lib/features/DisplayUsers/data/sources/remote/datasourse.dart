import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertest/core/constants/constants.dart';
import 'package:fluttertest/features/DisplayUsers/data/models/Model.dart';

class RemoteUserDataSource {
  Future<DataModel> fetchusers() async {
    final _dio = Dio();
    try {
      final response = await _dio.get("${Apiurls.users}");

      if (kDebugMode) {
        print("Raw response: ${response.data}");
      }
      final DataModel users = DataModel.fromJson(response.data);

      return users;
    } catch (e) {
      print("Error in fetching users: $e");
      throw Exception("Failed to fetch users");
    }
  }
}
