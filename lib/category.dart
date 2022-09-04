class Category {
  final String electronics,jewelery,men,women;


  Category({
    required this.electronics,
    required this.jewelery,
    required this.men,
    required this.women,

  });
  factory Category.fromMap(Map<String, dynamic> map) => Category(
    electronics: map['electronics'] as String,
    jewelery: map['jewelery'] as String,
    men: map['men'] as String,
    women: map['women'] as String,

    // rating: map['rating'] as String,
  );

  Map<String, dynamic> toMap() => {
    'electronics': electronics,
    'jewelery': jewelery,
    'men': men,
    'women': women,

  };
}