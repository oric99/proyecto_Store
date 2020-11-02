import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store/utilidades/constantes.dart';
import 'package:store/screens/login_screen.dart';
import 'package:store/providers/usuarioProviders.dart';
import 'package:store/providers/getLogin.dart';

class Registro extends StatefulWidget {
  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {

 final bloc= new LoginBloc();
 final usuarioP= new UsuarioProvider();
  Widget _creaNombreTF() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Nombre',
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
            keyboardType: TextInputType.name,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.perm_identity,
                color: Colors.white,
              ),
              hintText: 'Ingresa tu Nombre',
              hintStyle: ktextoin,
            ),
          ),
        ),
      ],
    );
  }

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

  Widget _creaRegistroBtn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          print('Siguiente presionado');
          Navigator.pushNamed(context, '/onboard');
         //_regi(context, bloc);
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.orangeAccent[200],
        child: Text(
          'Siguiente',
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
          '- - Si ya tienes cuenta Logeate - -',
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
  Widget _creaLogeateBtn(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(" Boton voy al loging");
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
_regi(BuildContext context,LoginBloc bloc)async{
 
          Map info= await usuarioP.nuevoUsuario(bloc.email, bloc.password);
          if(info ['ok']){
            Navigator.pushNamed(context, '/vehiculo');

          }else{
            try{ 
              alerta(context,info['mensage']);
              print('Error de tokens');

            }catch(e){
              print(e);
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
                        'Registro',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 30.0),
                      _creaEmailTF(),
                      SizedBox(height: 30.0),
                      _creaNombreTF(),
                      SizedBox(height: 30.0),
                      _creaPasswordTF(),
                      SizedBox(height: 30.0),
                      _creaRegistroBtn(context),
                      _creaRegistratetxt(),
                      SizedBox(height: 30.0),
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
