import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(6.5),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://th.bing.com/th/id/OIP.0siT9Vkwx8tb_kFTi-KV1wHaHa?pid=ImgDet&rs=1'),
                    radius: 50,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    'User',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          _buildAccountOptions(),
        ],
      ),
    );
  }

  Widget _buildAccountOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListTile(
          leading: Icon(Icons.edit),
          title: Text('Editar Foto de Perfil'),
          onTap: () {
            _mostrarDialogoEditarFoto();
          },
        ),
        ListTile(
          leading: Icon(Icons.lock),
          title: Text('Cambiar Contraseña'),
          onTap: () {
            _mostrarDialogoCambiarContrasena();
          },
        ),
      ],
    );
  }

  void _mostrarDialogoEditarFoto() {}

  void _mostrarDialogoCambiarContrasena() {}
}
