import 'package:flutter/material.dart';
import 'package:flutter_evento/themes/app_theme.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: const [
        ListTile(
          leading: Icon(
            Icons.event_rounded,
            color: AppTheme.primary,
          ),
          title: Padding(
              padding: EdgeInsets.only(bottom: 5.0),
              child: Text('Eventos cercanos')),
          subtitle: Text(
              'Descubre eventos por la zona, desde juntadas hasta fiestas'),
        )
      ]),
    );
  }
}
