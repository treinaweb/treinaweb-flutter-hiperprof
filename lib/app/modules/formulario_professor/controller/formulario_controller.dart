import 'package:flutter/cupertino.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:hiperprof/app/modules/formulario_professor/model/cadastro_professor.dart';
import 'package:hiperprof/app/modules/formulario_professor/service/formulario_service.dart';
import 'package:hiperprof/data/models/professor_model.dart';
import 'package:hiperprof/routes.dart';

class FormularioController extends ChangeNotifier {
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
  final Function(String) onOpenSnackbar;
  final Function(String, Professor) onNavigator;
  final void Function(FormularioController) openDialog;

  var load = false;

  FormularioController({
    required this.isValidForm,
    required this.onOpenSnackbar,
    required this.onNavigator,
    required this.openDialog,
  });

  Future<void> cadastrarConta() async {
    final isValid = isValidForm();
    if (isValid && !load) {
      load = true;
      notifyListeners();
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

        final novoProfessor = await _service.cadastrarProfessor(professor);
        onNavigator(Routes.HOME_PROFESSOR, novoProfessor);
      } catch (erro) {
        onOpenSnackbar(erro.toString());
      } finally {
        load = false;
        notifyListeners();
      }
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

  void inicialProfessor(Professor? professor) {
    if (professor != null) {
      nomeController.text = professor.nome;
      idadeController.text = professor.idade.toString();
      valorAulaController.updateValue(professor.valorAula);
      emailController.text = professor.email;
      descricaoController.text = professor.descricao;
    }
  }

  void openModal() {
    openDialog(this);
  }
}
