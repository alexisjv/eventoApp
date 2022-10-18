import 'package:flutter/material.dart';
import 'package:flutter_evento/screens/inputs_screen.dart';
import 'package:flutter_evento/widgets/widgets.dart';

import '../themes/app_theme.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eventos'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: const [
          CustomCard(),
          SizedBox(
            height: 10,
          ),
          CustomCardImage(
            title: 'Fiesta en la playa',
            imageUrl:
                'https://media.istockphoto.com/photos/friends-dancing-at-a-summer-sunset-beachparty-picture-id475284976?k=20&m=475284976&s=612x612&w=0&h=HU8URHP5PV6Mk9d2Vwb0RRpmdreHd3JJ9VfQwqiKo4E=',
            icon: Icon(Icons.beach_access, color: AppTheme.primary),
          ),
          SizedBox(
            height: 10,
          ),
          CustomCardImage(
              title: 'Tour por la ciudad',
              imageUrl:
                  'https://enviajes.cl/wp-content/uploads/2021/07/Buenos-Aires-Caminito-Enviajes.jpg',
              icon: Icon(Icons.location_city, color: AppTheme.primary)),
          SizedBox(
            height: 10,
          ),
          CustomCardImage(
              title: '2x1 en Pentos',
              imageUrl:
                  'https://s3.amazonaws.com/arc-wordpress-client-uploads/infobae-wp/wp-content/uploads/2016/07/13160107/Millennials10-1024x576.jpg',
              icon: Icon(Icons.dining, color: AppTheme.primary)),
          SizedBox(
            height: 10,
          ),
          CustomCardImage(
            title: 'Jodita en casa',
            imageUrl:
                'https://media.istockphoto.com/photos/close-up-photo-of-many-party-people-dancing-purple-lights-confetti-picture-id1170931062?k=20&m=1170931062&s=612x612&w=0&h=qe3ru5wlGFWYNSZEz3nMj-ayBIGMfJWGHOFuykkL3GY=',
            icon: Icon(Icons.music_note, color: AppTheme.primary),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
