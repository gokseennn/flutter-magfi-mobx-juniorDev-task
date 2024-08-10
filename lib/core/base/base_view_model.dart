import 'package:mobx/mobx.dart';

part 'base_view_model.g.dart';

class BaseViewModel = _BaseViewModel with _$BaseViewModel;

abstract class _BaseViewModel with Store {
  @observable
  ObservableFuture? dataFuture;

  @action
  Future<T?> runWithLoading<T>(Future<T> Function() task) async {
    try {
      // ObservableFuture oluştur ve çalıştır
      dataFuture = ObservableFuture(task());

      // Future'ı bekle ve sonucu döndür
      return await dataFuture as T;
    } catch (e) {
      // Hata durumunda yapılacak işlemler

      // Hata oluştuğunda null veya uygun bir değeri döndür
      return null;
    }
  }
}
