
import 'package:fluttertest/features/DisplayUsers/data/models/Model.dart';
import 'package:fluttertest/features/DisplayUsers/data/sources/remote/datasourse.dart';
import 'package:fluttertest/features/DisplayUsers/domain/repo/get_User_repositry.dart';

class GetUserRepoimp implements GetUserRepositry {
  @override
  Future<DataModel> getuser()async {
 return await RemoteUserDataSource().fetchusers(); 
  }
 
}
