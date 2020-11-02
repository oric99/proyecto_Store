import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store/providers/prefe.dart';
import 'package:store/screens/login_screen.dart';
import 'package:store/screens/Registro.dart';
import 'package:store/screens/perfil.dart';
import 'package:store/screens/favoritos.dart';
import 'package:store/screens/carrito.dart';
import 'package:store/screens/garage.dart';
import 'package:store/screens/historial.dart';
import 'package:store/screens/envio.dart';
import 'package:store/screens/tienda.dart';
import 'package:store/screens/compra.dart';
import 'package:store/screens/onBoard.dart';
import 'package:store/screens/reclamaciones.dart';
import 'package:store/screens/vehiculo.dart';
import 'package:store/screens/recupera.dart';
import 'package:store/providers/prefe.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final prefs = new PreferenciasUsuario();
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/registro': (context) => Registro(),
        '/tienda': (context) => Tienda(),
        '/vehiculo': (context) => Vehiculo(),
        '/recupera': (context) => Recupera(),
        '/perfil': (context) => Perfil(),
        '/favoritos':(context)=> Favoritos(),
        '/carrito':(context)=>Carrito(),
        '/garage': (context) => Garage(),
        '/historial':(context) => Historial(),
        '/envio':(context) => Envio(),
        '/compra':(context) => Compra(),
        '/onBoard':(context)=>onBoard(),
        '/reclamaciones':(context) => Reclamaciones(),
      },
    );
  }
}
