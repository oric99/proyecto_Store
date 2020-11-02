import 'dart:convert';

ProductoModel productoModelFromJson(String str) =>
    ProductoModel.fromJson(json.decode(str));

String productoModelToJson(ProductoModel data) => json.encode(data.toJson());

class ProductoModel {
  String id;
  String titulo;
  double valor;
  String fotoUrl;
  String descripcion;
  int stock;

  ProductoModel({
    this.id,
    this.titulo = '',
    this.valor = 0.0,
    this.fotoUrl,
    this.descripcion = '',
    this.stock = 0,
  });

  factory ProductoModel.fromJson(Map<String, dynamic> json) =>
      new ProductoModel(
        id: json["id"],
        titulo: json["titulo"],
        valor: json["valor"],
        fotoUrl: json["fotoUrl"],
        descripcion: json["descripcion"],
        stock: json["stock"],
      );

  Map<String, dynamic> toJson() => {
      
        "titulo": titulo,
        "valor": valor,
        "fotoUrl": fotoUrl,
        "descripcion": descripcion,
        "stock": stock,
      };

  getFoto() {
    if (fotoUrl == null) {
      return 'assets/image/noImage.png';
    } else {
      return fotoUrl;
    }
  }
  
}
