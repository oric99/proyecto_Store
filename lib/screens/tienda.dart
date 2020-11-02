import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:store/providers/prefe.dart';
import 'package:store/screens/registro.dart';

import 'package:store/model/producModel.dart';
import 'package:store/providers/provider.dart';



class Tienda extends StatefulWidget {
  Tienda({Key key}) : super(key: key);

  @override
  _TiendaState createState() => _TiendaState();
}

class _TiendaState extends State<Tienda> with SingleTickerProviderStateMixin {
  bool colapsoM = true;
  double pantallaAncho, pantallaAlto;
  final Duration duration = const Duration(milliseconds: 300);
 

  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slateAnimation;
  AnimationController _controler;

  @override
  void initState() {
    super.initState();
    _controler = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controler);
    _menuScaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(_controler);
    _slateAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controler);
  }

  @override
  void dispose() {
    _controler.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    pantallaAlto = size.height;
    pantallaAncho = size.width;

     final productosBlock = ProviderR.productosBlock(context);
     productosBlock.cargarProductos();
     

    return Scaffold(
      backgroundColor: Color(0xFF293670),
      body: Stack(
        children: <Widget>[
          _menu(context),
          _dashboar(context),

         // _crearListado(productosBlock),
        ],
      ),
    );
  }

  Widget _menu(context) {
    return SlideTransition(
      position: _slateAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
//.----------------------------------------
                UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://wallpapershome.com/images/pages/pic_h/11925.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    accountName: Text('Equipo',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                    accountEmail: Text('t@t.com',
                        style: TextStyle(fontSize: 18.0, color: Colors.grey)),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.orangeAccent,
                      child: Text(
                        'E',
                        style: TextStyle(fontSize: 40.0),
                      ),
                    )),

                ListTile(
                  title: Text('Perfil',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  leading: Icon(Icons.people),
                  //selected: (0 == _selectDrawerItem),
                  onTap: () {
                    //Navigator.pop(context);
                    Navigator.pushNamed(context, '/perfil');
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),

                ListTile(
                  title: Text('Carrito',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  leading: Icon(Icons.shopping_cart),
                  //selected: (1 == _selectDrawerItem),
                  onTap: () {
                    Navigator.pushNamed(context, '/carrito');
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),

                ListTile(
                  title: Text('Favoritos',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  leading: Icon(Icons.favorite),
                  //selected: (2 == _selectDrawerItem),
                  onTap: () {
                    Navigator.pushNamed(context, '/favoritos');
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),

                ListTile(
                  title: Text('Garage',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  leading: Icon(Icons.autorenew),
                  //selected: (3 == _selectDrawerItem),
                  onTap: () {
                    Navigator.pushNamed(context, '/garage');
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),

                ListTile(
                  title: Text('Envio',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  leading: Icon(Icons.local_shipping),
                  //selected: (4 == _selectDrawerItem),
                  onTap: () {
                    Navigator.pushNamed(context, '/envio');
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),

                ListTile(
                  title: Text('Reclamaciones',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  leading: Icon(Icons.history),
                  //selected: (5 == _selectDrawerItem),
                  onTap: () {
                    Navigator.pushNamed(context, '/reclamaciones');
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),

                ListTile(
                  title: Text('Historial de compras',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  leading: Icon(Icons.book),
                  //selected: (6 == _selectDrawerItem),
                  onTap: () {
                    Navigator.pushNamed(context, '/historial');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

 
 Widget _crearItemVisible( context, ProductosBlock productosB,
      ProductoModel producto) {
    return Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.greenAccent,
        ),
        onDismissed: (direccion) => productosB.borrarProducto(producto.id),
        child: Card(
          child: Column(
            children: <Widget>[
              (producto.fotoUrl == null)
                  ? Image(image: AssetImage('assets/noimage.png'))
                  : FadeInImage(
                      image: NetworkImage(producto.fotoUrl),
                      placeholder: AssetImage('assets/carro.gif'),
                      height: 200.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
              ListTile(
                title: Text('${producto.titulo} - ${producto.valor}'),
                subtitle: Text(producto.descripcion),
                // ingreso producto 
                /*
                onTap: () =>
                    Navigator.pushNamed(context, 'detallesP', arguments: producto)
                        .then((value) => setState(() {})),
                        */
              ),
            ],
          ),
        ));
  }

   Widget _crearListado(ProductosBlock productosB) {
    return StreamBuilder(
      stream: productosB.productosStream,
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot) {
        if (snapshot.hasData) {
          final productos = snapshot.data;

          return ListView.builder(
            itemCount: productos.length,
            itemBuilder: (context, i) =>
                _crearItemVisible(context, productosB, productos[i]),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _dashboar(context) {
    

    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: colapsoM ? 0 : 0.6 * pantallaAncho,
      right: colapsoM ? 0 : -0.6 * pantallaAncho,

      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          elevation: 8,
          color: Color(0xFF293670),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          child: Icon(Icons.menu, color: Colors.white),
                          onTap: () {
                            setState(() {
                              if (colapsoM)
                                _controler.forward();
                              else
                                _controler.reverse();
                              colapsoM = !colapsoM;
                            });
                          },
                        ),
                        Text("Auto Partes para tí",
                            style:
                                TextStyle(fontSize: 24, color: Colors.white)),
                        Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ]),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 350, // tamaño de cajas
                    child: PageView(
                      controller: PageController(viewportFraction: 0.8),
                      scrollDirection: Axis.horizontal,
                      pageSnapping: true,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: Colors.white,
                          width: 100,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: Colors.white,
                          width: 100,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: Colors.white,
                          width: 100,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: Colors.white,
                          width: 100,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                 
                  SizedBox(
                    height: 5,
                  ),
                 
                  //Cambio de lista Aqui. en este punto se pasa una lista de provider ModeloProducto
                  /*ListView.separated(
                    scrollDirection: Axis.vertical,
                    // Metodo que crea una lista de productos
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      // Lista
                      return ListTile(
                        title: Text("AutoParte",
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        subtitle: Text(
                          "BMW",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Text(
                          "40.000",
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 16,
                      );
                    },
                    itemCount: 20,
                  )*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
