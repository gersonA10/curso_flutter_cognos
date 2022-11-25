import 'package:flutter/material.dart';

class ListView2Screen extends StatelessWidget {

  final cursos = const['home', 'list', 'about'];

  const ListView2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView 2'),
      ),
      body: ListView.builder(
        itemCount: cursos.length,
        itemBuilder: (context, index) => ListTile(
          title: Text('${cursos[index]}'),
          leading: const Icon(Icons.code),
          trailing: const Icon(Icons.arrow_forward_ios_outlined),
          onTap: () => Navigator.pushNamed(context, cursos[index]),
        ),
      ),
    );
  }
}