import 'package:flutter/material.dart';
import 'package:hiperprof/app/modules/inicial/views/inicial_view.dart';
import 'package:hiperprof/theme/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: CustomThemeData.ligth(),
      darkTheme: CustomThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const InicialView(),
    );
  }
}
