import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class Perfil extends StatelessWidget {
  final estiloTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubTitulo = TextStyle(fontSize: 18.0, color: Colors.grey);

  Widget _creaUserAccountDrawerHeader() {
    return UserAccountsDrawerHeader(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://wallpapershome.com/images/pages/pic_h/11925.jpg'),
              fit: BoxFit.cover),
        ),
        accountName: Text('EQUIPO', style: estiloTitulo),
        accountEmail: Text('t@t.com', style: estiloSubTitulo),
        currentAccountPicture: CircleAvatar(
          backgroundColor: Colors.red,
          radius: 40,
          //child: Icon(Icons.account_circle, size: 60,color: Colors.orangeAccent),
          child: Text(
            'G',
            style: TextStyle(fontSize: 40.0),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        // padin and colum
        value: SystemUiOverlayStyle.light, // estilo
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    //Gradiente
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF478DE0),
                      Color(0xFF398AE2),
                      Color(0xFF293670),
                      Color(0xFF293652),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      //aquí los metodos
                      _creaUserAccountDrawerHeader(),
                      ListTile(
                        title: Text('Nombre: ',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        leading: Icon(Icons.account_circle),
                        //selected: (0 == _selectDrawerItem),
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      ListTile(
                        title: Text('apellido: ',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        leading: Icon(Icons.assignment),
                        //selected: (0 == _selectDrawerItem),
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      ListTile(
                        title: Text('Correo: ',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        leading: Icon(Icons.alternate_email),
                        //selected: (0 == _selectDrawerItem),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF398AE2),
        body: Column(children: <Widget>[
          _creaUserAccountDrawerHeader()
          /*Row(
              children: <Widget>[
                
                SizedBox(
                  width: 20.0,
                ),
                Column(
                  children: [
                    Text('Nombre: Christian negro garcé', style: TextStyle(fontSize: 20)),
                    Text('Usuario: t@t.com', style: TextStyle(fontSize: 20))
                  ],
                ),
                SizedBox(
                  width: 40.0,
                ),
                Icon(Icons.star,color: Colors.orangeAccent, size: 30),
                Text('41', style: TextStyle(fontSize: 20))
              ],
            )

            UserAccountsDrawerHeader(
              decoration: BoxDecoration( 
                image: DecorationImage(
                  image: NetworkImage('https://wallpapershome.com/images/pages/pic_h/11925.jpg'),
                  fit: BoxFit.cover
                  ),
              ),
              accountName: Text('GARCES', style: estiloTitulo),
              accountEmail: Text('GARCES.OR', style: estiloSubTitulo),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.red,
                child: Text(
                  'G',
                  style: TextStyle(fontSize: 40.0),
                ),
              )
            )*/
        ]));
  }*/
}
