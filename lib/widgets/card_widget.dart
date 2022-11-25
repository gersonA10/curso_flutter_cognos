import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String nameCard;
  final String description;
  final String? url;

  final Function() onTap;

  const CardWidget({
    Key? key,
    required this.nameCard,
    required this.description,
    this.url,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 40),
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      surfaceTintColor: Colors.amber,
      elevation: 5,
      child: SingleChildScrollView(
        //physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            //https://upload.wikimedia.org/wikipedia/commons/2/27/Illimani_La_Paz.jpg
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: FadeInImage(
                placeholder: const AssetImage("assets/gif.gif"),
                image: NetworkImage(url ??
                    "https://artsmidnorthcoast.com/wp-content/uploads/2014/05/no-image-available-icon-6.png"),
                width: double.infinity,
                height: 230,
                fit: BoxFit.cover,
                placeholderFit: BoxFit.cover,
              ),
            ),
            ListTile(
                title: Text(
                  nameCard,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(description),
                onTap: onTap)
          ],
        ),
      ),
    );
  }
}
