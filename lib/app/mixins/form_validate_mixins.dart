import 'package:validatorless/validatorless.dart';

mixin FormValidateMixin {
  final validateFormRequered = Validatorless.required('Campo é obrigatório');

  final validateFormEmail = Validatorless.multiple([
    Validatorless.required('Campo é obrigatório'),
    Validatorless.email('Email inválido')
  ]);

  final validateFormNumber = Validatorless.multiple([
    Validatorless.required('Campo é obrigatório'),
    Validatorless.number('Somente números')
  ]);
}
