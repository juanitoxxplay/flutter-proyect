class Auto {
  final String codauto;
  final String description;
  final String codBrand;
  final double price;
  final int capacity;
  final String type;
        bool isActive;

  Auto({
    required this.codauto,
    required this.description,
    required this.codBrand,
    required this.price,
    required this.capacity,
    required this.type,
    required this.isActive,
  });

  factory Auto.fromJson(Map<String, dynamic> json) => Auto(
    codauto: json['codauto'],
    description: json['description'],
    codBrand: json['codBrand'],
    price: json['price'],
    capacity: json['capacity'],
    type: json['type'],
    isActive: json['isActive'],
  );

  Map<String, dynamic> toJson() => {
    'codauto': codauto,
    'description': description,
    'codBrand': codBrand,
    'price': price,
    'capacity': capacity,
    'type': type,
    'isActive': isActive,
  };
}
