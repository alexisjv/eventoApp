import 'package:flutter/material.dart';

class Listview2Screen extends StatelessWidget {
  const Listview2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final options = ["Favoritos", "Próximos", "Anteriores"];
    return Scaffold(
        appBar: AppBar(
          title: const Text("ListView 2"),
          elevation: 0,
          backgroundColor: Colors.amber.shade500,
        ),
        body: ListView.separated(
          itemCount: options.length,
          itemBuilder: (context, index) => ListTile(
              title: Text(options[index]),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.amber,
              ),
              onTap: () {
                final option = options[index];
                print(option);
              }),
          separatorBuilder: (_, __) => const Divider(),
        ));
  }
}
