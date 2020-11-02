import 'package:flutter/material.dart';

import 'package:store/providers/getLogin.dart';
export 'package:store/providers/getLogin.dart';

import 'package:store/providers/productosBlock.dart';
export 'package:store/providers/productosBlock.dart';

class ProviderR extends InheritedWidget {
  final loginB = LoginBloc();
  final _productosB = new ProductosBlock();

  static ProviderR _instancia;

  factory ProviderR({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = new ProviderR._internal(key: key, child: child);
    }

    return _instancia;
  }

  ProviderR._internal({Key key, Widget child}) : super(key: key, child: child);

  // Provider({ Key key, Widget child })
  //   : super(key: key, child: child );

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ProviderR>().loginB;
  }

  static ProductosBlock productosBlock(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ProviderR) as ProviderR)
        ._productosB;
  }
}