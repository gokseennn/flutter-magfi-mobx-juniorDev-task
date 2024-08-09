import 'package:magfi_dev_task/feature/users/model/user.dart';

abstract class IUserService {
  IUserService();

  Future<List<User>> fetchAllUser();
}
