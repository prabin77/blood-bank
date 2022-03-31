import 'package:dio/dio.dart';

class BackendService {
  Dio dio = Dio();
 static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<Response> getDetails(String endPoint) async {
    Response response = await dio.get('$_baseUrl/$endPoint');
    return response;
  }
}
