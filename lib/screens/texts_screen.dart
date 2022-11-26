import 'package:flutter/material.dart';

class TextScreen extends StatelessWidget {
  TextScreen({super.key});

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _controller,
              style: const TextStyle(),
              decoration: InputDecoration(
                //ICONOS
                icon: const Icon(Icons.email_rounded),
                //prefixIcon: Icon(Icons.access_time_sharp),
                //suffixIcon: Icon(Icons.account_box_outlined),

                //BORDERS
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),

                // disabledBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(20),
                // ),
                // filled: true,
                // fillColor: Colors.indigo,
                // focusColor: Colors.amber,
                // focusedBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(50),
                // ),
                //Textos
                //errorText: "Error Text",
                labelText: "email",
                hintText: "example@gmail.com",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _controller,
              style: const TextStyle(),
              decoration: InputDecoration(
                icon: Icon(Icons.ac_unit_sharp),
                //errorText: "Error Text",
                labelText: "password",
                hintText: "",

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
