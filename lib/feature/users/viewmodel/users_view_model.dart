import 'package:magfi_dev_task/core/base/base_view_model.dart';
import 'package:magfi_dev_task/feature/users/model/user.dart';
import 'package:magfi_dev_task/feature/users/services/user_service.dart';
import 'package:mobx/mobx.dart';
part 'users_view_model.g.dart';

class UsersViewModel = _UsersViewModel with _$UsersViewModel;

abstract class _UsersViewModel extends BaseViewModel with Store {
  UserService userService = UserService();
  _UsersViewModel() {
    runWithLoading(() => init());
  }

  @observable
  List<User> userList = [];

  @action
  Future<void> getAllUsers() async {
    userList = await userService.fetchAllUser();
    if (userList.isEmpty) {
      print("");
    }
  }

  Future<void> init() async {
    await getAllUsers();
  }
}
