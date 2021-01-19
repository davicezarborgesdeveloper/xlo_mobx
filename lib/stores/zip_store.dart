import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/models/address.dart';
import 'package:xlo_mobx/repositories/zip_repository.dart';

part 'zip_store.g.dart';

class ZipStore = _ZipStore with _$ZipStore;

abstract class _ZipStore with Store {
  _ZipStore() {
    autorun((_) {
      if (clearZip.length != 8) {
        _reset();
      } else {
        _searchZip();
      }
    });
  }

  @observable
  String zip = '';

  @action
  void setZip(String value) => zip = value;

  @computed
  String get clearZip => zip.replaceAll(RegExp('[^0-9]'), '');

  @observable
  Address address;

  @observable
  String error;

  @observable
  bool loading = false;

  @action
  Future<void> _searchZip() async {
    loading = true;
    try {
      address = await ZipRepository().getAddresFromApi(clearZip);
      error = null;
    } catch (e) {
      error = e;
      address = null;
    }
    loading = false;
  }

  @action
  void _reset(){
    address = null;
    error = null;
  }
}
