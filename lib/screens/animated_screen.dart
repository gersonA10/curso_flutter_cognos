import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.indigo;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(20);

  void changeShape() {
    setState(() {
      //Paquete dart math nos permite
      //cambiar los valores de nuestras variables de manera dinamica
      final random = Random();
      _width = random.nextInt(300).toDouble() + 70;
      _height = random.nextInt(300).toDouble() + 70;

      //Cambiar los colores de forma aleatoria
      _color = Color.fromRGBO(
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
        1,
      );

      // Poner el borde de forma aleatoria,  El "+ 10" decimos que el borde minimo sera de 10
      _borderRadius =
          BorderRadius.circular(random.nextInt(100).toDouble() + 10);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Container"),
      ),
      body: Center(
        //Colocamos las variables creadas en su lugar
        child: AnimatedContainer(
          /*
          Agregamos un Nuevo Widget en este caso el Animated Container
          donde le agregamos la duracion de nuestra animacion
          */
          duration: const Duration(milliseconds: 400),

          //La mayoria de Widgets de Animacion tienen la propiedad llamada Curve
          //https://api.flutter.dev/flutter/animation/Curves-class.html

          curve: Curves.easeOutCubic,
          height: _width,
          width: _height,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color,
          ),
        ),
      ),

      //Creamos un boton donde mandamos nuestro metodo creado para cambiar la forma de nuestro container
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_circle_outline_outlined),
        onPressed: () => changeShape(),
      ),
    );
  }
}
