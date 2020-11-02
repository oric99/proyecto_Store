import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store/utilidades/constantes.dart';
import 'package:store/screens/login_screen.dart';

class Recupera extends StatefulWidget {
  Recupera({Key key}) : super(key: key);

  @override
  _RecuperaState createState() => _RecuperaState();
}

class _RecuperaState extends State<Recupera> {
  Widget _creaEmailTF() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabel,
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kdecoracion,
          height: 60.0,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Ingresa tu Email',
              hintStyle: ktextoin,
            ),
          ),
        ),
      ],
    );
  }

  Widget _creaLogeateBtn(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(" Boton registro presionado");
        Navigator.pushNamed(context, '/login'); // Navega con nombre
      },
      child: RichText(
        // Widget de txt Btn
        text: TextSpan(
          children: [
            TextSpan(
              text: '   ¿Ya tienes cuenta?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: '  Logeate',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _creaRecuperarBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          //Funcion
          print('Enviar presionado');
          // Navigator.pushNamed(context, '/tienda');
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.orangeAccent[200],
        child: Text(
          'Enviar',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
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
                      //Orden de la pantalla
                      Text(
                        'Olvidé mi contraseña',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 100.0),
                      SizedBox(height: 50.0),
                      _creaEmailTF(),

                      SizedBox(height: 70.0),
                      _creaRecuperarBtn(),

                      SizedBox(height: 100.0),
                      SizedBox(height: 70.0),

                      _creaLogeateBtn(context),
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
}
