import 'package:dio/dio.dart';
import 'package:xlo_mobx/models/address.dart';
import 'package:xlo_mobx/models/city.dart';
import 'package:xlo_mobx/repositories/ibge_repository.dart';

class ZipRepository {
  Future<Address> getAddresFromApi(String zip) async {
    if (zip == null || zip.isEmpty) {
      return Future.error("CEP Inválido");
    }

    final clearZip = zip.replaceAll(RegExp('[^0-9]'), '');
    if (clearZip.length != 8) return Future.error('CEP Inválido');

    final endpoint = 'http://viacep.com.br/ws/$clearZip/json';

    try {
      final response = await Dio().get<Map>(endpoint);

      if (response.data.containsKey('erro') && response.data['erro'])
        return Future.error('Cep Inválido');

      final ufList = await IBGERepository().getUFList();

      return Address(
          cep: response.data['cep'],
          district: response.data['bairro'],
          city: City(name: response.data['localidade']),
          uf: ufList.firstWhere((uf) => uf.initials == response.data['uf']));
    } catch (e) {
      Future.error('Falha ao buscar cep');
    }
  }
}
