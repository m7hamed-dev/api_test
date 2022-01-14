import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget({Key? key, required this.msgError}) : super(key: key);
  final String msgError;
  @override
  Widget build(BuildContext context) {
    return Text(
      msgError,
      style: const TextStyle(
        fontSize: 60.0,
        color: Colors.red,
      ),
    );
  }
}
