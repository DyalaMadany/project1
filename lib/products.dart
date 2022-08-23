class Products {
  final String name;
  final int id,price;

  Products({
    required this.name,
    required this.id,
    required this.price,
  });

  factory Products.fromMap(Map<String, dynamic> map) => Products(
    name: map['name'] as String,
    id: map['id'] as int,
    price: map['price'] as int,
  );

  Map<String, dynamic> toMap() => {
    'name': name,
    'id': id,
    'price': price,
  };
}