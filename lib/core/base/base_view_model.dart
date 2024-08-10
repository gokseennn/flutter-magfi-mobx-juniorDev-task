import 'package:mobx/mobx.dart';

part 'base_view_model.g.dart';

class BaseViewModel = _BaseViewModel with _$BaseViewModel;

abstract class _BaseViewModel with Store {
  @observable
  String errorMessage = '';

  @observable
  ObservableFuture? dataFuture;

  _BaseViewModel() {
    init();
  }

  @action
  Future<void> init() async {
    await runWithLoading(() async {
      await onInit();
    });
  }

  @action
  Future<T?> runWithLoading<T>(Future<T> Function() task) async {
    try {
      dataFuture = ObservableFuture(task());
      return await dataFuture as T;
    } catch (e) {
      handleError(e);
      return null;
    } finally {
      dataFuture = null;
    }
  }

  @action
  void handleError(dynamic error) {
    errorMessage = error.toString();
    print("Hata oluştu: $errorMessage");
  }

  // Alt sınıflar tarafından implement edilecek
  Future<void> onInit() async {}
}
