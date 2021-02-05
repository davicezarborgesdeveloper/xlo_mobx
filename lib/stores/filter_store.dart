import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'home_store.dart';

part 'filter_store.g.dart';

enum OrderBy { DATE, PRICE }

const VENDOR_TYPE_PARTICULAR = 1 << 0;
const VENDOR_TYPE_PROFESSIONAL = 1 << 1;

class FilterStore = _FilterStore with _$FilterStore;

abstract class _FilterStore with Store {
  _FilterStore(
      {this.orderBy = OrderBy.DATE,
      this.vendoType = VENDOR_TYPE_PARTICULAR,
      this.minPrice,
      this.maxPrice});

  @observable
  OrderBy orderBy;

  @action
  void setOrderBy(OrderBy value) => orderBy = value;

  @observable
  int minPrice;

  @observable
  int maxPrice;

  @action
  void setMinPrice(int value) => minPrice = value;

  @action
  void setMaxPrice(int value) => maxPrice = value;

  @computed
  String get priceError =>
      maxPrice != null && minPrice != null && maxPrice < minPrice
          ? 'Faixa de preço inválida'
          : null;

  @observable
  int vendoType;

  @action
  void selectVendorType(int value) => vendoType = value;
  void setVendorType(int type) => vendoType = vendoType | type;
  void resetVendorType(int type) => vendoType = vendoType & ~type;
  @computed
  bool get isTypeParticular => (vendoType & VENDOR_TYPE_PARTICULAR) != 0;
  bool get isTypeProfessional => (vendoType & VENDOR_TYPE_PROFESSIONAL) != 0;

  @computed
  bool get isFormValid => priceError == null;

  void save() {
    GetIt.I<HomeStore>().setFilter(this);
  }

  FilterStore clone() {
    return FilterStore(
      orderBy: orderBy,
      vendoType: vendoType,
      minPrice: minPrice,
      maxPrice: maxPrice,
    );
  }
}
