import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/stores/create_store.dart';
import 'package:xlo_mobx/stores/zip_store.dart';

class ZipField extends StatelessWidget {
  ZipField(this.createStore) : zipStore = createStore.zipStore;

  final CreateStore createStore;
  final ZipStore zipStore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Observer(
          builder: (_) {
            return TextFormField(
              onChanged: zipStore.setZip,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter()
              ],
              decoration: InputDecoration(
                errorText: createStore.addressError,
                labelText: 'CEP *',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.grey,
                  fontSize: 18,
                ),
                contentPadding: const EdgeInsets.fromLTRB(16, 10, 12, 10),
              ),
            );
          },
        ),
        Observer(
          builder: (_) {
            if (zipStore.address == null &&
                zipStore.error == null &&
                !zipStore.loading)
              return Container();
            else if (zipStore.address == null && zipStore.error == null)
              return LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.purple),
                backgroundColor: Colors.transparent,
              );
            if (zipStore.error != null)
              return Container(
                color: Colors.red.withAlpha(100),
                height: 50,
                padding: const EdgeInsets.all(8),
                child: Text(zipStore.error,
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.red)),
              );
            else {
              final a = zipStore.address;
              return Container(
                color: Colors.purple.withAlpha(150),
                height: 50,
                padding: const EdgeInsets.all(8),
                alignment: Alignment.center,
                child: Text(
                  'Localização: ${a.district}, ${a.city.name}, ${a.uf.initials}',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            }
          },
        )
      ],
    );
  }
}
