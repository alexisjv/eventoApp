import 'package:flutter/material.dart';
import 'package:flutter_evento/widgets/guests.dart';

class CustomCardDetail extends StatelessWidget {
  final String imageUrl;
  final String title;

  const CustomCardDetail({
    Key? key,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 5, left: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.indigo, fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Guests(),
                        ));
                  },
                  child: const Text('Asistentes'))
            ],
          )
        ],
      ),
    );
  }
}
