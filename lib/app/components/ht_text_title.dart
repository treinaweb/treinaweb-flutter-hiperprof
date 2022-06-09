import 'package:flutter/material.dart';

enum HPSizeTitle {
  small(size: 15.0),
  normal(size: 25.0),
  large(size: 30.0);

  final double size;

  const HPSizeTitle({required this.size});
}

class HPTextTitle extends StatelessWidget {
  final String text;
  final HPSizeTitle size;
  const HPTextTitle({Key? key, required this.text, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: size.size),
    );
  }
}
