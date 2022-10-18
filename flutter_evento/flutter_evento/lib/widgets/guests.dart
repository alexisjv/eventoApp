import 'package:flutter/material.dart';

class Guests extends StatelessWidget {
  const Guests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Asistentes')),
      body: ListView(
        children: const [
          CircleAvatar(
            maxRadius: 70,
            backgroundImage: NetworkImage(
                'https://www.dzoom.org.es/wp-content/uploads/2020/02/portada-foto-perfil-redes-sociales-consejos.jpg'),
          ),
          CircleAvatar(
            maxRadius: 30,
            backgroundImage: NetworkImage(
                'https://www.dzoom.org.es/wp-content/uploads/2020/02/portada-foto-perfil-redes-sociales-consejos.jpg'),
          ),
          CircleAvatar(
            maxRadius: 30,
            backgroundImage: NetworkImage(
                'https://www.dzoom.org.es/wp-content/uploads/2020/02/portada-foto-perfil-redes-sociales-consejos.jpg'),
          ),
        ],
      ),
    );
  }
}
