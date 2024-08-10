import 'package:magfi_dev_task/core/base/base_view_model.dart';
import 'package:magfi_dev_task/feature/users/model/user.dart';
import 'package:magfi_dev_task/feature/users/services/user_service.dart';
import 'package:mobx/mobx.dart';
part 'users_view_model.g.dart';

class UsersViewModel = _UsersViewModel with _$UsersViewModel;

abstract class _UsersViewModel extends BaseViewModel with Store {
  final UserService _userService;

  _UsersViewModel({UserService? userService})
      : _userService = userService ??
            UserService(); //[UserService]'in yalnızca 1 kere oluşturulmasını sağlıyor

  @observable
  List<User> userList = ObservableList<User>();

  @action
  @override
  Future<void> onInit() async {
    await getAllUsers();
    // Diğer fonksiyonların da kullanılabilir olması için, temel bir onInit fonksiyonu oluşturdum.
    // Bu fonksiyon, sayfa her açıldığında otomatik olarak çalışacak.
    // Detaylar için [BaseViewModel] sınıfındaki ilgili fonksiyonu inceleyebilirsiniz.
  }

  @action
  Future<void> getAllUsers() async {
    final users = await _userService.fetchAllUser();
    runInAction(() {
      if (userList.isNotEmpty) {
        userList.clear();
      }
      userList.addAll(users);
    });
  }
}
