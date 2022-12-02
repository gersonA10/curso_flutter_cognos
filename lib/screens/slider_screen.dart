import 'package:components_app/theme/theme_data.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _value = 100;
  bool _checkBoxOn = true;
  bool _switch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slider Screen"),
      ),
      body: Column(
        children: [
          //El slider se adaptara de acuerdo al sistemaOperativo
          Slider.adaptive(
            min: 50,
            max: 400,
            activeColor: AppTheme.primary,
            value: _value,
            onChanged: _checkBoxOn
                ? (value) {
                    //print(value);
                    _value = value;
                    setState(() {});
                  }
                : null,
          ),
          Checkbox(
            value: _checkBoxOn,
            onChanged: ((value) {
              _checkBoxOn = value ?? true;
              setState(() {});
            }),
          ),
          Switch(
            value: _switch,
            onChanged: ((value) {
              _switch = value;
              setState(() {});
            }),
          ),
          Image(
            image: const NetworkImage(
              "https://b.fssta.com/uploads/application/soccer/headshots/711.png",
            ),
            fit: BoxFit.contain,
            width: _value,
          )
        ],
      ),
    );
  }
}
