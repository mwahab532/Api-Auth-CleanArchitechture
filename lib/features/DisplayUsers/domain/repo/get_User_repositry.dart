import 'package:fluttertest/features/DisplayUsers/data/models/Model.dart';

abstract class GetUserRepositry {
  Future<DataModel> getuser();
}
