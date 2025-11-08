import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  ApiService({required this.dio});
  final String _baseUrl =
      'https://mohamedoraby0500-dr-chat-api.hf.space/gradio_api/call/predict';

  Future<Map<String, dynamic>> sendRequest({required String message}) async {
    var response = await dio.post(
      _baseUrl,
      data: {
        'data': [message],
      },
      options: Options(headers: {"Content-Type": "application/json"}),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> getResponseByEventId({
    required String eventId,
  }) async {
    var response = await dio.get('$_baseUrl/$eventId');
    return response.data;
  }
}
