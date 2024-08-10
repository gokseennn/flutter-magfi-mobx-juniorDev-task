// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseViewModel on _BaseViewModel, Store {
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

  late final _$runWithLoadingAsyncAction =
      AsyncAction('_BaseViewModel.runWithLoading', context: context);

  @override
  Future<T?> runWithLoading<T>(Future<T> Function() task) {
    return _$runWithLoadingAsyncAction.run(() => super.runWithLoading<T>(task));
  }

  @override
  String toString() {
    return '''
dataFuture: ${dataFuture}
    ''';
  }
}
