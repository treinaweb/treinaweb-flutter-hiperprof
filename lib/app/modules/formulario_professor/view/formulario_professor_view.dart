import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hiperprof/app/components/hp_elevated_button.dart';
import 'package:hiperprof/app/components/hp_text_area.dart';
import 'package:hiperprof/app/components/hp_text_form_field.dart';
import 'package:hiperprof/app/components/ht_text_title.dart';
import 'package:hiperprof/app/mixins/form_validate_mixins.dart';
import 'package:hiperprof/app/modules/formulario_professor/controller/formulario_controller.dart';

class FormularioProfessorView extends StatefulWidget {
  const FormularioProfessorView({Key? key}) : super(key: key);

  @override
  State<FormularioProfessorView> createState() =>
      _FormularioProfessorViewState();
}

class _FormularioProfessorViewState extends State<FormularioProfessorView>
    with FormValidateMixin {
  final key = GlobalKey<FormState>();

  late final controller = FormularioController(
    isValidForm: () => key.currentState?.validate() ?? false,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 60, right: 60),
            child: Form(
              key: key,
              child: Column(
                children: [
                  const HPTextTitle(
                    text: 'Dados de cadastro',
                    size: HPSizeTitle.normal,
                  ),
                  HPTextFormField(
                    validator: validateFormRequered,
                    controller: TextEditingController(),
                    label: 'Nome',
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  HPTextFormField(
                    validator: validateFormNumber,
                    controller: TextEditingController(),
                    label: 'Idade',
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  HPTextFormField(
                    validator: validateFormRequered,
                    controller: controller.valorAulaController,
                    label: 'Valor da aula',
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  HPTextFormField(
                    validator: validateFormEmail,
                    controller: TextEditingController(),
                    label: 'Email',
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  HPTextFormField(
                    validator: controller.validSenha,
                    controller: controller.senhaController,
                    label: 'Senha',
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  HPTextFormField(
                    validator: controller.validSenha,
                    controller: controller.confirmarSenhaController,
                    label: 'Confirmar Senha',
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  HPTextArea(
                    label: 'Descrição',
                    controller: TextEditingController(),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    validator: validateFormRequered,
                  ),
                  HPElevatedButton(
                    padding: const EdgeInsets.only(
                        top: 50, bottom: 20, right: 60, left: 60),
                    onPressed: controller.cadastrarConta,
                    child: const Visibility(
                      replacement: Text('Editar Conta'),
                      child: Text('Cadastrar conta'),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
