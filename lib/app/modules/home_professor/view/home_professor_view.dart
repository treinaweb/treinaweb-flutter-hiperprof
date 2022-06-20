import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hiperprof/app/components/ht_text_title.dart';

class HomeProfessorView extends StatelessWidget {
  const HomeProfessorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      endDrawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              onTap: () {},
              title: const Text('Editar'),
              leading: const Icon(Icons.edit),
            ),
            ListTile(
              onTap: () {},
              title: const Text('Logout'),
              leading: const Icon(Icons.logout),
            ),
            ListTile(
              onTap: () {},
              title: const Text('Página principal'),
              leading: const Icon(Icons.home),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const HPTextTitle(
                text: 'Lista de aulas',
                size: HPSizeTitle.normal,
              ),
              FutureBuilder(
                future: null,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return AnimatedBuilder(
                      animation: ValueNotifier(''),
                      builder: (context, child) {
                        return const ExpansionPanelList(
                          children: [],
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('ERRO: ${snapshot.error}'),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
