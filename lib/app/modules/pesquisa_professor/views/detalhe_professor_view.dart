import 'package:flutter/material.dart';
import 'package:hiperprof/app/components/hp_elevated_button.dart';
import 'package:hiperprof/app/components/hp_text_form_field.dart';
import 'package:hiperprof/app/components/ht_text_title.dart';
import 'package:hiperprof/app/modules/pesquisa_professor/components/card_lista_professor.dart';
import 'package:hiperprof/app/modules/pesquisa_professor/controller/detalhe_professor_controller.dart';
import 'package:hiperprof/data/models/professor_model.dart';

class DetalheProfessorView extends StatelessWidget {
  const DetalheProfessorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final professor = ModalRoute.of(context)!.settings.arguments as Professor;
    final controller = DetalheProfessorController(
      onOpenModalForm: (controller) {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              child: Container(
                height: 400,
                alignment: Alignment.center,
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
                child: SingleChildScrollView(
                  child: Form(
                    child: Column(
                      children: [
                        const HPTextTitle(
                            text: 'Preencha suas informações',
                            size: HPSizeTitle.small),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Em breve o professor entratá em contato',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        HPTextFormField(
                          controller: TextEditingController(),
                          label: 'Seu nome',
                          padding: const EdgeInsets.symmetric(vertical: 10),
                        ),
                        HPTextFormField(
                          controller: TextEditingController(),
                          label: 'Seu Email',
                          padding: const EdgeInsets.symmetric(vertical: 10),
                        ),
                        HPTextFormField(
                          controller: TextEditingController(),
                          label: 'Hora e data da aula',
                          padding: const EdgeInsets.symmetric(vertical: 10),
                        ),
                        AnimatedBuilder(
                          animation: controller,
                          builder: (context, child) {
                            return Visibility(
                              visible: false,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Text(
                                  'ERRO',
                                  style: TextStyle(
                                    color: Theme.of(context).errorColor,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        AnimatedBuilder(
                          animation: controller,
                          builder: (context, child) {
                            return HPElevatedButton(
                              onPressed: () {},
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: const Visibility(
                                visible: true,
                                replacement: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                                child: Text('Contratar'),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );

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
                onPressed: controller.contratarProfessor,
                child: Text('Contratar ${professor.nome}'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
