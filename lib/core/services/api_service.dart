import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  final Dio _dio;
  final String baseUrl = "https://api.rentcast.io/v1/listings/sale/";
  final String apiKey = dotenv.get('RENTCAST_API_KEY');
  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get("$baseUrl$endPoint");
    return response.data;
  }
}
