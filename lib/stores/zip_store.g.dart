// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zip_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ZipStore on _ZipStore, Store {
  Computed<String> _$clearZipComputed;

  @override
  String get clearZip => (_$clearZipComputed ??=
          Computed<String>(() => super.clearZip, name: '_ZipStore.clearZip'))
      .value;

  final _$zipAtom = Atom(name: '_ZipStore.zip');

  @override
  String get zip {
    _$zipAtom.reportRead();
    return super.zip;
  }

  @override
  set zip(String value) {
    _$zipAtom.reportWrite(value, super.zip, () {
      super.zip = value;
    });
  }

  final _$addressAtom = Atom(name: '_ZipStore.address');

  @override
  Address get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(Address value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  final _$errorAtom = Atom(name: '_ZipStore.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$loadingAtom = Atom(name: '_ZipStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$_searchZipAsyncAction = AsyncAction('_ZipStore._searchZip');

  @override
  Future<void> _searchZip() {
    return _$_searchZipAsyncAction.run(() => super._searchZip());
  }

  final _$_ZipStoreActionController = ActionController(name: '_ZipStore');

  @override
  void setZip(String value) {
    final _$actionInfo =
        _$_ZipStoreActionController.startAction(name: '_ZipStore.setZip');
    try {
      return super.setZip(value);
    } finally {
      _$_ZipStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _reset() {
    final _$actionInfo =
        _$_ZipStoreActionController.startAction(name: '_ZipStore._reset');
    try {
      return super._reset();
    } finally {
      _$_ZipStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
zip: ${zip},
address: ${address},
error: ${error},
loading: ${loading},
clearZip: ${clearZip}
    ''';
  }
}
