import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store/providers/getLogin.dart';
import 'package:store/utilidades/constantes.dart';
import 'package:store/screens/registro.dart';
import 'package:store/screens/tienda.dart';
import 'package:store/providers/usuarioProviders.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usuarioP = new UsuarioProvider();
  bool _recuerdame = false;
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final bloc = new LoginBloc();

  Widget _creaEmailTF() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          textAlign: TextAlign.left,
          style: kLabel,
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kdecoracion,
          height: 60.0,
          child: TextFormField(
            //Detecta datos
            validator: (input) {
              if (input.isEmpty) {
                return 'No email';
              }
            },
            onSaved: (input) => _email = input,
            //obscureText: true,
            keyboardType: TextInputType.emailAddress,
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
            onChanged: bloc.changeEmail,
          ),
        ),
      ],
    );
  }

  Widget _creaPasswordTF() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Contraseña',
          style: kLabel,
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kdecoracion,
          height: 60.0,
          child: TextFormField(
            //Detecta datos
            validator: (input) {
              if (input.length < 6) {
                return 'Muy corto';
              }
            },
            onSaved: (input) => _password = input,
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock_outline,
                color: Colors.white,
              ),
              hintText: 'Ingresa tu password',
              hintStyle: ktextoin,
            ),
            onChanged: bloc.changePassword,
          ),
        ),
      ],
    );
  }

  Widget _creaRecuerdameCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _recuerdame,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _recuerdame = value; //define si esta activo o inacctivo
                });
              },
            ),
          ),
          Text(
            'Recuerdame',
            style: kLabel,
          ),
        ],
      ),
    );
  }

  Widget _creaLoginBtn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          _login(context, bloc);
          //Funcion
          // filtraYGuarda();
          print('Login presionado');
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.orangeAccent[200],
        child: Text(
          'LOGIN',
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

  Widget _creaRegistratetxt() {
    return Column(
      children: <Widget>[
        Text(
          '- - Registrate si no tienes cuenta - -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          '  ',
          style: kLabel,
        ),
      ],
    );
  }

  //Lo mas posible es que cambie
  Widget _creaRegistateBtn(BuildContext contex) {
    return GestureDetector(
      onTap: () {
        //Funcion
        print(" Boton registro presionado");
        Navigator.pushNamed(contex, '/registro'); // Navega con nombre
      },
      child: RichText(
        // Widget de txt Btn
        text: TextSpan(children: [
          TextSpan(
            text: '   ¿No tienes cuenta?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: '   Registrate',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
      ),
    );
  }

  Widget _creaOlvideBtn(BuildContext contex) {
    return GestureDetector(
      onTap: () {
        //Funcion
        print(" Boton Olvido su contraseña presionado");
        Navigator.pushNamed(contex, '/recupera'); // Navega con nombre
      },
      child: RichText(
        // Widget de txt Btn
        text: TextSpan(children: [
          TextSpan(
            text: '   Si olvidaste tú contraseña presiona',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: '   Aquí',
            style: TextStyle(
              color: Colors.white,
              fontSize: 13.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
      ),
    );
  }

  _login(BuildContext context, LoginBloc bloc) async {
    WidgetBuilder builder;

    Map info = await usuarioP.login(bloc.email, bloc.password);
    if (info['ok']) {
      Navigator.pushNamed(context, '/tienda');
    } else {
      try {
       alerta(context,info['mensage']);

        print('Error de tokens');
      } catch (e) {
        print(e);
      }
    }
  }

  bool filtro() {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        if (formState.validate()) {
          return true;
          // print('Es valido. Email: $_email, Password: $_password');
        } else {
          // print('No valido');
          return false;
        }
      } catch (e) {
        print(e.message);
      }
    }
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
                key: _formKey, // key
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
                        'Bienvenido',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 50.0),
                      _creaEmailTF(),
                      SizedBox(height: 30.0),

                      _creaPasswordTF(),
                      SizedBox(height: 10.0),
                      _creaOlvideBtn(context),
                      SizedBox(height: 20.0),

                      _creaRecuerdameCheckbox(),
                      SizedBox(height: 40.0),
                      _creaLoginBtn(context),
                      _creaRegistratetxt(),
                      SizedBox(height: 50.0),
                      _creaRegistateBtn(context),
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
