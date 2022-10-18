import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_evento/widgets/custom_card_detail.dart';

class EventoDetail extends StatelessWidget {
  final String imageUrl;
  final String title;

  const EventoDetail({Key? key, required this.imageUrl, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detalles del evento'),
        ),
        body: Container(
          child: Column(children: [
            FadeInImage(
              image: NetworkImage(imageUrl),
              placeholder: const AssetImage('assets/images/Loading_icon.gif'),
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
              fadeInDuration: const Duration(milliseconds: 300),
            ),
            CustomCardDetail(
              imageUrl: imageUrl,
              title: title,
            ),
          ]),
        ));
  }
}
