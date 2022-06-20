import 'package:flutter/material.dart';
import 'package:hiperprof/app/components/hp_elevated_button.dart';
import 'package:hiperprof/app/components/hp_text_form_field.dart';
import 'package:hiperprof/app/components/ht_text_title.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              const HPTextTitle(
                text: 'Consultar minhas aulas ',
                size: HPSizeTitle.normal,
              ),
              Container(
                margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Form(
                  child: Column(
                    children: [
                      HPTextFormField(
                        controller: TextEditingController(),
                        label: 'Email',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      HPTextFormField(
                        controller: TextEditingController(),
                        label: 'Senha',
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      Visibility(
                        visible: false,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'ERRO',
                            style: TextStyle(
                              color: Theme.of(context).errorColor,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text('Cadastrar'),
                        ),
                      ),
                      HPElevatedButton(
                        child: const Visibility(
                          visible: true,
                          replacement: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                          child: Text('Acessar'),
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
