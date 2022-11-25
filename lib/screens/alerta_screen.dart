import 'package:flutter/material.dart';

class AlertaScreen extends StatelessWidget {
  const AlertaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
        Center(
          child: Text('No se encuentra la ruta'),
        )
      ]),
    );
  }
}
