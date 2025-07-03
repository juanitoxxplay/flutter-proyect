class Marca {
  final String codBrand;
  final String description;

  Marca({required this.codBrand, required this.description});

  factory Marca.fromJson(Map<String, dynamic> json) => Marca(
    codBrand: json['codBrand'],
    description: json['description'],
  );
}
