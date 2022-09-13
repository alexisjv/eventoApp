import 'package:flutter/material.dart';

class CustomCardImage extends StatelessWidget {
  final String imageUrl;
  final Icon icon;
  final String? name;

  const CustomCardImage(
      {super.key, required this.imageUrl, required this.icon, this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 5,
      child: Column(
        children: [
          if (name != null) Text(name!),
          FadeInImage(
            image: NetworkImage(imageUrl),
            placeholder: const AssetImage('assets/images/Loading_icon.gif'),
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
            fadeInDuration: const Duration(milliseconds: 300),
          ),
          Container(
            padding: const EdgeInsets.only(right: 5, left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [icon],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {}, child: const Text('Detalles')),
                        TextButton(
                            onPressed: () {}, child: const Text('Asistir'))
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
