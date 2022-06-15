import 'package:flutter/cupertino.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:hiperprof/app/modules/formulario_professor/model/cadastro_professor.dart';
import 'package:hiperprof/app/modules/formulario_professor/service/formulario_service.dart';

class FormularioController {
  final FormularioService _service = FormularioService();

  final senhaController = TextEditingController();
  final confirmarSenhaController = TextEditingController();
  final nomeController = TextEditingController();
  final descricaoController = TextEditingController();
  final emailController = TextEditingController();
  final idadeController = TextEditingController();

  final valorAulaController = MoneyMaskedTextController(
      leftSymbol: 'R\$', decimalSeparator: '.', thousandSeparator: ',');

  final bool Function() isValidForm;

  FormularioController({required this.isValidForm});

  Future<void> cadastrarConta() async {
    final isValid = isValidForm();
    if (isValid) {
      try {
        final professor = CadastroProfessor(
          nome: nomeController.text,
          descricao: descricaoController.text,
          email: emailController.text,
          valorAula: valorAulaController.numberValue,
          idade: int.parse(idadeController.text),
          password: senhaController.text,
          passwordConfirm: confirmarSenhaController.text,
        );

        _service.cadastrarProfessor(professor);
      } catch (e) {}
    }
  }

  String? validSenha(String? value) {
    if (value?.isEmpty ?? false) {
      return 'Campos obrigatórios';
    }

    if (senhaController.text != confirmarSenhaController.text) {
      return 'Valores diferentes';
    }

    if (senhaController.text.length <= 5) {
      return 'minimo de 6 caracteres';
    }

    return null;
  }
}
