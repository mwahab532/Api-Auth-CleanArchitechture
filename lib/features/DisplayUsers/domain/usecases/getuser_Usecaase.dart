// UseCase Implementation
import 'package:fluttertest/core/usecase/UseCase.dart';
import 'package:fluttertest/features/DisplayUsers/data/models/Model.dart';
import 'package:fluttertest/features/DisplayUsers/domain/repo/get_User_repositry.dart';

class GetUserUseCase implements UseCase<DataModel, void> {
  final GetUserRepositry _getUserRepositry;

  GetUserUseCase({required GetUserRepositry getUserRepositry})
      : _getUserRepositry = getUserRepositry;

  @override
  Future<DataModel> call({void params})async {
    return await _getUserRepositry.getuser();
  }
}
