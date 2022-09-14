class UserModel {
  final String username, password;

  UserModel({
    required this.username,
    required this.password,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        username: map['username'] as String,
        password: map['password'] as String,
      );

  Map<String, dynamic> toMap() => {
        'username': username,
        'password': password,
      };
}