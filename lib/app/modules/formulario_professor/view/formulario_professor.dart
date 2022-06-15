import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hiperprof/app/components/hp_elevated_button.dart';
import 'package:hiperprof/app/components/hp_text_form_field.dart';
import 'package:hiperprof/app/components/ht_text_title.dart';
import 'package:hiperprof/app/mixins/form_validate_mixins.dart';

class FormularioProfessorView extends StatefulWidget {
  const FormularioProfessorView({Key? key}) : super(key: key);

  @override
  State<FormularioProfessorView> createState() =>
      _FormularioProfessorViewState();
}

class _FormularioProfessorViewState extends State<FormularioProfessorView>
    with FormValidateMixin {
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
                    validator: validateFormRequered,
                    controller: TextEditingController(),
                    label: 'Idade',
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  HPTextFormField(
                    validator: validateFormNumber,
                    controller: TextEditingController(),
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
                    validator: validateFormRequered,
                    controller: TextEditingController(),
                    label: 'Senha',
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  HPTextFormField(
                    validator: validateFormRequered,
                    controller: TextEditingController(),
                    label: 'Confirmar Senha',
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  HPTextFormField(
                    validator: validateFormRequered,
                    controller: TextEditingController(),
                    label: 'Descrição',
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  HPElevatedButton(
                    padding: const EdgeInsets.only(top: 50, bottom: 20),
                    onPressed: () {},
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
