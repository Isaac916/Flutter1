import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cards')),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[_cardTipo1(), SizedBox(width: 10), _cardTipo2()],
      ),
    );
  }
}

Widget _cardTipo1() {
  return Card(
    child: Column(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.photo_album, color: Colors.blue),
          title: Text('Soy el título de esta tarjeta'),
          subtitle: Text(
              'Esta es una prueba para ver lo que ocurre con una tarjeta que tiene un subtitle bastante largo y que no sabemos como responderá'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextButton(child: Text('Cancelar'), onPressed: () {}),
            TextButton(child: Text('Ok'), onPressed: () {})
          ],
        )
      ],
    ),
  );
}

Widget _cardTipo2() {
  final card = Card(
    elevation: 10,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: Column(
      children: [
        FadeInImage(
          image: NetworkImage(
              'https://th.bing.com/th/id/OIP.8L5ZumyJPZGHSb7AyPab-gHaFe?pid=ImgDet&rs=1'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 10),
          height: 250,
          fit: BoxFit.cover,
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Text('Esta es la prueba de que funciona la imagen'),
        )
      ],
    ),
  );
  return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: <BoxShadow>[
            BoxShadow(
                //Color negro con índice de opacidad 26%
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(2, 10))
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: card,
      ));
}
