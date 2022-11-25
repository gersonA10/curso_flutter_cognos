import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: CircleAvatar(
              backgroundColor: Colors.indigo[900],
              child: const Text('CM'),
            ),
          )
        ],
      ),
      body: const Center(
          child: CircleAvatar(
          maxRadius: 110,
          backgroundImage: NetworkImage('https://images.unsplash.com/photo-1591871937631-2f64059d234f'),
        ),
      )
    );
  }
}