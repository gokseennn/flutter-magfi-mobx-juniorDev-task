import 'package:magfi_dev_task/core/base/base_view_model.dart';
import 'package:magfi_dev_task/feature/users/model/user.dart';
import 'package:magfi_dev_task/feature/users/services/user_service.dart';
import 'package:mobx/mobx.dart';
part 'users_view_model.g.dart';

class UsersViewModel = _UsersViewModel with _$UsersViewModel;

abstract class _UsersViewModel extends BaseViewModel with Store {
  final UserService _userService;

  _UsersViewModel({UserService? userService})
      : _userService = userService ?? UserService();

  @observable
  ObservableList<User> userList = ObservableList<User>();

  @override
  Future<void> onInit() async {
    await getAllUsers();
  }

  @action
  Future<void> getAllUsers() async {
    final users = await _userService.fetchAllUser();
    runInAction(() {
      userList.clear();
      userList.addAll(users);
      if (userList.isEmpty) {
        handleError('Kullanıcı listesi boş');
      }
    });
  }
}
