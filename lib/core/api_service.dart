import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  ApiService({required this.dio});
  final String _baseUrl =
      'https://mohamedoraby0500-dr-chat-api.hf.space/gradio_api/call/predict';
  Future<Map<String, dynamic>> getResponse() async {
    var response = await dio.get(_baseUrl);
    return response.data;
  }
}
