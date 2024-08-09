import 'package:mobx/mobx.dart';

part 'base_view_model.g.dart';

class BaseViewModel = _BaseViewModel with _$BaseViewModel;

abstract class _BaseViewModel with Store {
  @observable
  ObservableFuture? dataFuture;

  @action
  Future<T> runWithLoading<T>(Future<T> Function() task) async {
    dataFuture = ObservableFuture(task());
    return await dataFuture as T;
  }
}
