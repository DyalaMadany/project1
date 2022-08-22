class UserModel {
  final String name, email;

  UserModel({
    required this.name,
    required this.email,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        name: map['name'] as String,
        email: map['email'] as String,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'email': email,
      };
}
