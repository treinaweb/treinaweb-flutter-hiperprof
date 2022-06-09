import 'package:flutter/material.dart';
import 'package:hiperprof/app/components/hp_elevated_button.dart';
import 'package:hiperprof/app/components/hp_outlined_button.dart';
import 'package:hiperprof/app/components/hp_text_form_search.dart';
import 'package:hiperprof/app/components/ht_text_title.dart';

class InicialView extends StatelessWidget {
  const InicialView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: _mediaQuery.size.height - _mediaQuery.padding.top,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  child: Column(
                    children: [
                      const HPTextTitle(
                        text: 'ENCONTRE O PROFESSOR IDEAL PARA VOCÊ !',
                        size: HPSizeTitle.large,
                      ),
                      HPTextFormSearch(
                        controller: TextEditingController(),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                      ),
                      HPElevatedButton(
                        child: const Text('Buscar o professor perfeito'),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60, right: 60, bottom: 20),
                child: Column(
                  children: [
                    HPElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColorLight,
                      ),
                      child: const Text('Seja um professor'),
                    ),
                    HPOutlinedButton(
                      child: const Text('Consultar minhas aulas'),
                      onPressed: () {},
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
