import 'package:flutter/material.dart';
import 'package:xlo_mobx/components/custom_drawer/custom_drawer.dart';

import 'components/search_dialog.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    openSearch(BuildContext context) async {
      final search = await showDialog(
          context: context,
          builder: (_) => SearchDialog(
                currentSearch: 'Davi Borges',
              ));
      print(search);
    }

    return SafeArea(
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                openSearch(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
