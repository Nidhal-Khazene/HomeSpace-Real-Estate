import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:home_space/core/services/backend_breakpoint.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio) {
    _dio.options = BaseOptions(
      baseUrl: BackendBreakpoint.kBaseUrl,
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
    Map<String, dynamic>? processedQueryParameters;
    processedQueryParameters = handleQueryParameters(
      queryParameters,
      processedQueryParameters,
    );

    var response = await _dio.get(
      endPoint,
      queryParameters: processedQueryParameters,
    );

    return response.data;
  }

  Map<String, dynamic>? handleQueryParameters(
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? processedQueryParameters,
  ) {
    if (queryParameters != null) {
      processedQueryParameters = {};
      queryParameters.forEach((key, value) {
        if (value is List) {
          processedQueryParameters![key] = value.join('|');
        } else {
          processedQueryParameters![key] = value;
        }
      });
    }
    return processedQueryParameters;
  }
}
