import 'package:dio/dio.dart';

class AuthApiClient{
  final Dio _dio = Dio();

  Future<Response> login(String username, String password) async {
    try {
      Response response = await _dio.post(
        'https://fakestoreapi.com/auth/login',
        data: {
          'username': username,
          'password': password
        },
      );
      //returns the successful user data json object
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
}

