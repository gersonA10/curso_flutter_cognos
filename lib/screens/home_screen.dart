import 'package:components_app/routes/app_routes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
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
      body: ListView.separated(
        itemCount: AppRoutes.menuOptions.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(AppRoutes.menuOptions[index].title),
          leading: Icon(AppRoutes.menuOptions[index].icon),
          trailing: const Icon(Icons.arrow_forward_ios_outlined),
          onTap: () =>
              Navigator.pushNamed(context, AppRoutes.menuOptions[index].route),
        ),
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}
