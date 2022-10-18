import 'package:flutter/material.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Evento'),
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
                hintText: 'Nombre del evento',
                labelText: 'Nombre',
                suffixIcon: Icon(
                  Icons.post_add_rounded,
                )),
            onChanged: (value) {
              print('value: $value');
            },
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
                hintText: 'Tipo de evento',
                labelText: 'Tipo',
                suffixIcon: Icon(
                  Icons.style,
                )),
            onChanged: (value) {
              print('value: $value');
            },
            validator: (value) {
              if (value == null) return 'Este campo es requerido';
              return value.length < 3 ? 'Mínimo de 3 letras' : null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          )
        ]),
      )),
    );
  }
}
