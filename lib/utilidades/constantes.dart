
import 'package:flutter/material.dart';
import 'package:store/providers/usuarioProviders.dart';
import 'package:store/providers/getLogin.dart';
import 'package:store/providers/validators.dart';
//texto en casillas
final ktextoin = TextStyle(
  color: Colors.white38,
  fontFamily: 'OpenSans',
);

// label
final kLabel= TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);


// decoracion de la caja 
final kdecoracion = BoxDecoration(
  color: Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0), //BorderRadius.circular(30.0) mod
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0,2),
    ),
  ]
);
// Alerta para problemar registro y login
void alerta(BuildContext context, String mensaje ) {

  showDialog(
    context: context,
    builder: ( context ) {
      return AlertDialog(
        
        title: Text('Información incorrecta'),
        content: Text(mensaje),
       
        
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: ()=> Navigator.of(context).pop(),
          )
        ],
      );
    }
  );
  }
