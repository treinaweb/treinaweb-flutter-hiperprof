import 'package:flutter/material.dart';
import 'package:hiperprof/app/components/hp_text_form_search.dart';
import 'package:hiperprof/app/modules/pesquisa_professor/components/card_lista_professor.dart';
import 'package:hiperprof/app/modules/pesquisa_professor/controller/pesquisa_professor_controller.dart';
import 'package:hiperprof/data/models/professor_model.dart';
import 'package:hiperprof/routes.dart';

class PesquisaProfessorView extends StatefulWidget {
  final String searchProfessor;
  const PesquisaProfessorView({Key? key, required this.searchProfessor})
      : super(key: key);

  @override
  State<PesquisaProfessorView> createState() => _PesquisaProfessorViewState();
}

class _PesquisaProfessorViewState extends State<PesquisaProfessorView> {
  late final controller = PesquisaProfessorController(
    onNavigatorProfessor: (route, professor) =>
        Navigator.pushNamed(context, route, arguments: professor),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HPTextFormSearch(
                initialValue: widget.searchProfessor,
                label: 'Pesquisa professor',
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                onChanged: (value) {
                  controller.onSearchDebounce(value);
                },
              ),
              FutureBuilder<List<Professor>>(
                future: controller.getAllProfessor(widget.searchProfessor),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return AnimatedBuilder(
                      animation: controller,
                      builder: (context, child) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.72,
                          child: ListView.builder(
                            itemCount: controller.professores.length,
                            itemBuilder: (context, i) {
                              final professor = controller.professores[i];
                              return CardProfessor(
                                professor: professor,
                                maxLines: 2,
                                onTap: () =>
                                    controller.selectProfessor(professor),
                              );
                            },
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('ERRO INESPERADO: ${snapshot.error}'),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
