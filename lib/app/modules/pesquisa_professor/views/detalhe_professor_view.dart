import 'package:flutter/material.dart';
import 'package:hiperprof/app/components/hp_elevated_button.dart';
import 'package:hiperprof/app/components/hp_text_form_field.dart';
import 'package:hiperprof/app/components/ht_text_title.dart';
import 'package:hiperprof/app/mixins/form_validate_mixins.dart';
import 'package:hiperprof/app/modules/pesquisa_professor/components/card_lista_professor.dart';
import 'package:hiperprof/app/modules/pesquisa_professor/controller/detalhe_professor_controller.dart';
import 'package:hiperprof/data/models/professor_model.dart';

class DetalheProfessorView extends StatelessWidget with FormValidateMixin {
  DetalheProfessorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
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
                    key: key,
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
                          controller: controller.nomeController,
                          validator: validateFormRequered,
                          label: 'Seu nome',
                          padding: const EdgeInsets.symmetric(vertical: 10),
                        ),
                        HPTextFormField(
                          controller: controller.emailController,
                          validator: validateFormEmail,
                          label: 'Seu Email',
                          padding: const EdgeInsets.symmetric(vertical: 10),
                        ),
                        HPTextFormField(
                          controller: controller.dataController,
                          validator: validateFormRequered,
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
                                  controller.messageErro,
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
                              onPressed: () => controller.contratar(
                                  professorId: professor.id!),
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
      onValidForm: () => key.currentState?.validate() ?? false,
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
