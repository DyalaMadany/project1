class Products {
  final String title,description,category,image,rating;
  final int id,price;

  Products({
    required this.category,
    required this.id,
    required this.price,
    required this.description,
    required this.image,
    required this.rating,
    required this.title,

  });

  factory Products.fromMap(Map<String, dynamic> map) => Products(
    title: map['title'] as String,
    id: map['id'] as int,
    price: map['price'] as int,
    category: map['category'] as String,
    description: map['description'] as String,
    image: map['image'] as String,
    rating: map['rating'] as String,
  );

  Map<String, dynamic> toMap() => {
    'title': title,
    'id': id,
    'price': price,
    'category': category,
    'description': description,
    'image': image,
    'rating': rating,

  };
}