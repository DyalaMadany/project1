class Product {
  final String title, description, category, image;
  final int id;
  final num price;

  Product({
    required this.category,
    required this.id,
    required this.price,
    required this.description,
    required this.image,
    required this.title,
  });

  factory Product.fromMap(Map<String, dynamic> map) => Product(
        title: map['title'] as String,
        id: map['id'] as int,
        price: map['price'] as num,
        category: map['category'] as String,
        description: map['description'] as String,
        image: map['image'] as String,
        // rating: map['rating'] as String,
      );

  Map<String, dynamic> toMap() => {
        'title': title,
        'id': id,
        'price': price,
        'category': category,
        'description': description,
        'image': image,
      };
}
