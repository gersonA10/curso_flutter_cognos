import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({super.key});

  void alertDialogAndroid(BuildContext context) {
    // const AlertDialog(
    //   title: Text("Titulo"),
    // );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: ((context) {
        return AlertDialog(
          //backgroundColor: AppTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 20.0,
          title: Text("Titulo"),
          icon: FlutterLogo(),
          content: Text("Este es el contenido"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Ok"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancelar"),
            ),
          ],
        );
      }),
    );
  }

  void alertDialogIOS(BuildContext context) {
    showCupertinoDialog(
      barrierDismissible: true,
      context: context,
      builder: ((context) {
        return CupertinoAlertDialog(
          title: const Text("Titulo IOS"),
          content: const Text("Contenido de IOS"),
          //icon: FlutterLogo(),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Ok"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "Cancelar",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alert Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Platform.isAndroid
              ? alertDialogAndroid(context)
              : alertDialogIOS(context),
          //onPressed: () => alertDialogAndroid(context),
          child: const Text("Alerta"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.add_circle_rounded),
      ),
    );
  }
}
