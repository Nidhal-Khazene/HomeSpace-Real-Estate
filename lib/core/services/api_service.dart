import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio) {
    _dio.options = BaseOptions(
      baseUrl: 'https://api.rentcast.io/v1',
      headers: {
        'X-Api-Key': dotenv.get('RENTCAST_API_KEY'),
        'accept': 'application/json',
      },
    );
  }

  Future<dynamic> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    var response = await _dio.get(endPoint, queryParameters: queryParameters);

    return response.data;
  }
}
