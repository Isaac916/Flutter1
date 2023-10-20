import 'package:flutter/material.dart';
import '../../screens/alert_page.dart';
import '../../utils/icono_string_util.dart';
import '../../providers/menu_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _nombreController = TextEditingController();
  TextEditingController _apellidosController = TextEditingController();
  TextEditingController _correoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Aplicacion Rediseñada')),
      body: Container(
        color: Color.fromARGB(255, 228, 183, 183), // Color de fondo gris
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildForm(context),
              SizedBox(height: 15),
              _lista(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        // Crearemos el ListView
        return ListView(
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          children: _listaItems(snapshot.data!, context),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];
    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {
          Navigator.pushNamed(context, opt['ruta']);
        },
      );
      opciones
        ..add(widgetTemp)
        ..add(Divider());
    });
    return opciones;
  }

  Widget _buildForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 10),
          TextField(
            controller: _nombreController,
            decoration: InputDecoration(labelText: 'Nombre'),
          ),
          TextField(
            controller: _apellidosController,
            decoration: InputDecoration(labelText: 'Apellidos'),
          ),
          TextField(
            controller: _correoController,
            decoration: InputDecoration(labelText: 'Correo'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              if (_nombreController.text.isEmpty ||
                  _apellidosController.text.isEmpty ||
                  _correoController.text.isEmpty) {
                _mostrarErrorDialog(context);
              } else {
                _mostrarExitoDialog(context);
                _nombreController.clear();
                _apellidosController.clear();
                _correoController.clear();
              }
            },
            child: Text('Enviar'),
          ),
        ],
      ),
    );
  }

  void _mostrarExitoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Datos enviados'),
          content: Text('Los datos se han enviado con éxito.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el cuadro de diálogo
              },
            ),
          ],
        );
      },
    );
  }

  void _mostrarErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text('Por favor, complete todos los campos.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el cuadro de diálogo
              },
            ),
          ],
        );
      },
    );
  }
}
