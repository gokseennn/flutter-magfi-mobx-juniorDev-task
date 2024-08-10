// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseViewModel on _BaseViewModel, Store {
  late final _$errorMessageAtom =
      Atom(name: '_BaseViewModel.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$dataFutureAtom =
      Atom(name: '_BaseViewModel.dataFuture', context: context);

  @override
  ObservableFuture<dynamic>? get dataFuture {
    _$dataFutureAtom.reportRead();
    return super.dataFuture;
  }

  @override
  set dataFuture(ObservableFuture<dynamic>? value) {
    _$dataFutureAtom.reportWrite(value, super.dataFuture, () {
      super.dataFuture = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_BaseViewModel.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$runWithLoadingAsyncAction =
      AsyncAction('_BaseViewModel.runWithLoading', context: context);

  @override
  Future<T?> runWithLoading<T>(Future<T> Function() task) {
    return _$runWithLoadingAsyncAction.run(() => super.runWithLoading<T>(task));
  }

  late final _$_BaseViewModelActionController =
      ActionController(name: '_BaseViewModel', context: context);

  @override
  void handleError(dynamic error) {
    final _$actionInfo = _$_BaseViewModelActionController.startAction(
        name: '_BaseViewModel.handleError');
    try {
      return super.handleError(error);
    } finally {
      _$_BaseViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
dataFuture: ${dataFuture}
    ''';
  }
}
