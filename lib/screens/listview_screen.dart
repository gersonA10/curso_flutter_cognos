import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {

  final cursos = const['Flutter', 'Angular', 'Python', 'Java'];
  
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView'),
      ),
      body: ListView(
          children: [
            ...cursos.map((e) => ListTile(
              title: Text(e),
              leading: const Icon(Icons.code),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
              onTap: () => print('Tap!'),
            ))
          ]
      ),
    );
  }
}