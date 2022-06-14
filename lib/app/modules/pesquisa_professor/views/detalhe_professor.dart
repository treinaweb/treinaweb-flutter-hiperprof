import 'package:flutter/material.dart';
import 'package:hiperprof/app/components/hp_elevated_button.dart';
import 'package:hiperprof/app/modules/pesquisa_professor/components/card_lista_professor.dart';
import 'package:hiperprof/data/models/professor_model.dart';

class DetalheProfessorView extends StatelessWidget {
  const DetalheProfessorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final professor = ModalRoute.of(context)!.settings.arguments as Professor;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
          child: Column(
            children: [
              CardProfessor(
                professor: professor,
                maxLines: 30,
              ),
              HPElevatedButton(
                onPressed: () {},
                child: Text('Contratar ${professor.nome}'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
