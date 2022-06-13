import 'package:flutter/material.dart';
import 'package:hiperprof/app/components/hp_text_form_search.dart';
import 'package:hiperprof/app/modules/pesquisa_professor/components/card_lista_professor.dart';

class PesquisaProfessorView extends StatelessWidget {
  const PesquisaProfessorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final professoresCard = [
      CardProfessor(),
      CardProfessor(),
    ];

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HPTextFormSearch(
                controller: TextEditingController(),
                label: 'Pesquisa professor',
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                onChanged: (value) {},
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.72,
                child: ListView.builder(
                  itemCount: professoresCard.length,
                  itemBuilder: (context, i) {
                    final card = professoresCard[i];
                    return card;
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
