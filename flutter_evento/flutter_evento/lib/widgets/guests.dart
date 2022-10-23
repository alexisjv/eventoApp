import 'package:flutter/material.dart';

class Guests extends StatelessWidget {
  const Guests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final guestImage = [
      "https://www.minutoar.com.ar/u/fotografias/m/2022/5/28/f500x333-132049_155852_0.jpg",
      "https://societyofrock.com/wp-content/uploads/2016/03/axl.jpg",
      "https://mnews.com.ar/fotos/archivo/prandi.jpg",
      "https://media.ambito.com/p/fa02077a75256f92036786bea42ad093/adjuntos/239/imagenes/039/765/0039765942/ricardo-fortjpg.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfJ2hcy7VVVRvELFheHVRXoEyR1mCgyCNPa4mFt8HmTrMK4axyeeTXuM1K2RUNAap8SSY&usqp=CAU",
    ];
    final guestName = [
      "Pampita",
      "Axl Rose",
      "Julieta Prandi",
      "Ricky Fort",
      "Juan"
    ];
    return Scaffold(
      appBar: AppBar(title: Text('Asistentes')),
      body: ListView.separated(
        padding: EdgeInsets.all(5),
        itemCount: guestName.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            guestName[index],
            style: TextStyle(
              color: Colors.indigo,
            ),
          ),
          trailing: CircleAvatar(
            maxRadius: 70,
            backgroundImage: NetworkImage(guestImage[index]),
          ),
          onTap: () {
            /* final route = MaterialPageRoute(
                builder: (context) => const Listview2Screen());

            Navigator.push(context, route); */
          },
        ),
        separatorBuilder: (_, __) => const Divider(),
      ),
    );
  }
}
