import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtrar'),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(children: [
          TextFormField(
            autofocus: true,
            initialValue: '',
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
                hintText: 'Tipo de evento',
                labelText: 'Tipo',
                suffixIcon: Icon(
                  Icons.style,
                )),
            onChanged: (value) {},
            validator: (value) {
              if (value == null) return 'Este campo es requerido';
              return value.length < 3 ? 'Mínimo de 3 letras' : null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          TextFormField(
            autofocus: true,
            initialValue: '',
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
                hintText: 'Tipo de música',
                labelText: 'Música',
                suffixIcon: Icon(
                  Icons.music_note,
                )),
            onChanged: (value) {},
            validator: (value) {
              if (value == null) return 'Este campo es requerido';
              return value.length < 3 ? 'Mínimo de 3 letras' : null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          TextFormField(
            autofocus: true,
            initialValue: '',
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
                hintText: 'Tipo de lugar',
                labelText: 'Lugar',
                suffixIcon: Icon(
                  Icons.location_city,
                )),
            onChanged: (value) {},
            validator: (value) {
              if (value == null) return 'Este campo es requerido';
              return value.length < 3 ? 'Mínimo de 3 letras' : null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          TextFormField(
            autofocus: true,
            initialValue: '',
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
                hintText: 'Indicar ubicación',
                labelText: 'Ubicación',
                suffixIcon: Icon(
                  Icons.location_on,
                )),
            onChanged: (value) {},
            validator: (value) {
              if (value == null) return 'Este campo es requerido';
              return value.length < 3 ? 'Mínimo de 3 letras' : null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          TextFormField(
            autofocus: true,
            initialValue: '',
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
                hintText: 'Fecha y horario',
                labelText: 'Fecha y horario',
                suffixIcon: Icon(
                  Icons.access_time_filled_outlined,
                )),
            onChanged: (value) {},
            validator: (value) {
              if (value == null) return 'Este campo es requerido';
              return value.length < 3 ? 'Mínimo de 3 letras' : null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
        ]),
      )),
    );
  }
}
