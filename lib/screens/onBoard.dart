import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class onBoard extends StatefulWidget {
  onBoard({Key key}) : super(key: key);

  @override
  _onBoardState createState() => _onBoardState();
}

class _onBoardState extends State<onBoard> {
  @override

  Widget _EntiendoBtn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          print('Entiendo presionado');
          Navigator.pushNamed(context, '/vehiculo');
         
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.orangeAccent[200],
        child: Text(
          'Entiendo',
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

  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                ),
              ),
              Container(
                //TODO
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage('https://library.kissclipart.com/20181230/ege/kissclipart-front-car-silhouette-clipart-car-acura-98c4488e2072588f.png'),
                          ),
                        ),
                      ),

                      Text('Para el uso correcto de la aplicacion es importante ralizar un VIM ',
                       style: TextStyle(
                         color: Colors.white,
                         fontWeight: FontWeight.bold,
                         fontSize: 20,
                       ), 
                       ),

                      _EntiendoBtn(context),
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
