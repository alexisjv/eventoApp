import 'package:flutter/material.dart';
import 'package:flutter_evento/screens/evento_detail.dart';

class CustomCardImage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Icon icon;
  final String? name;

  const CustomCardImage(
      {super.key,
      required this.imageUrl,
      required this.icon,
      this.name,
      required this.title});

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
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [icon],
                ),
                Column(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(color: Colors.indigo),
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EventoDetail(
                                            imageUrl: imageUrl,
                                            title: title,
                                          )));
                            },
                            child: const Text('Detalles')),
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
