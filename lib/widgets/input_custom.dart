import 'package:components_app/theme/theme_data.dart';
import 'package:flutter/material.dart';

class InputCustom extends StatelessWidget {
  final String hinText;
  final IconData icon;
  final TextInputType? textInputType;
  final bool obscureText;

  final String formProperty;
  final Map<String, dynamic> formValues;

  const InputCustom({
    Key? key,
    required this.hinText,
    required this.icon,
    this.textInputType,
    this.obscureText = false,
    required this.formProperty,
    required this.formValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: TextFormField(
        obscureText: obscureText,
        keyboardType: textInputType,
        cursorColor: AppTheme.primary,
        initialValue: "",
        onChanged: (value) => formValues[formProperty] = value,
        validator: (value) {
          return value!.length < 3 ? "Minimo de 3 letras" : null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        //controller: _controller,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
          ),
          hintText: hinText,
          //helperText: "Email",
        ),
      ),
    );
  }
}
