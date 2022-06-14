import 'package:flutter/cupertino.dart';

class DetalheProfessorController extends ChangeNotifier {
  final Function(DetalheProfessorController) onOpenModalForm;

  DetalheProfessorController({required this.onOpenModalForm});

  void contratarProfessor() {
    onOpenModalForm(this);
  }
}
