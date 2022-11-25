import 'package:components_app/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card Screen"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        children: [
          CardWidget(
            description: 'Card 1 Description',
            nameCard: 'Illimani',
            onTap: (() => print("CARD 1")),
          ),
          CardWidget(
            description: 'Card 2 Description',
            nameCard: 'Card 2',
            url:
                "https://www.xtrafondos.com/descargar.php?id=5846&resolucion=2560x1440",
            onTap: (() => print("CARD 2")),
          ),
          CardWidget(
            description: 'Card 3 Description',
            nameCard: 'Card 3',
            url:
                "https://encolombia.com/wp-content/uploads/2021/12/Que-es-paisaje.jpg",
            onTap: (() => print("CARD 3")),
          ),
        ],
      ),
    );
  }
}
