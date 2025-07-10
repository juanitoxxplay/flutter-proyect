class Auto {
  final String codauto;
  final String description;
  final String codBrand;
  final double price;
  final int capacity;
  final int idtype; // ← actualizado
 int isActive;

  Auto({
    required this.codauto,
    required this.description,
    required this.codBrand,
    required this.price,
    required this.capacity,
    required this.idtype, // ← actualizado
    required this.isActive,
  });

 factory Auto.fromJson(Map<String, dynamic> json) => Auto(
  codauto: json['cod_auto'],
  description: json['description'],
  codBrand: json['cod_brand'],
  price: double.tryParse(json['price'].toString()) ?? 0.0,
  capacity: json['capacity'] ?? 0,
  idtype: json['id_type'] ?? 0,
  isActive: json['estatus'] ?? 0,
);


  Map<String, dynamic> toJson() => {
  'cod_auto': codauto,
  'description': description,
  'cod_brand': codBrand,
  'price': price,
  'capacity': capacity,
  'id_type': idtype,
  'estatus': isActive, // debe ser int: 0 o 1
};

}