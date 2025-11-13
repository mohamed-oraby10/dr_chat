import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

class ApiService {
  final Dio dio;
  ApiService({required this.dio});

  final String _baseUrl =
      'https://mohamedoraby0500-dr-chat-api.hf.space/gradio_api/call/predict';

  Future<String> sendRequest({required String message}) async {
    final response = await dio.post(
      _baseUrl,
      data: {
        "data": [message],
      },
      options: Options(headers: {"Content-Type": "application/json"}),
    );

    if (response.data is Map<String, dynamic> &&
        response.data.containsKey('event_id')) {
      return response.data['event_id'];
    } else {
      throw Exception('Failed to get event_id: ${response.data}');
    }
  }

  Future<String> getResponseByEventId({required String eventId}) async {
    final response = await dio.get('$_baseUrl/$eventId');

    if (response.data is String) {
      final rawData = response.data.toString();
      final dataLine = rawData
          .split('\n')
          .firstWhere(
            (line) => line.trim().startsWith('data:'),
            orElse: () => '',
          );

      if (dataLine.isNotEmpty) {
        final regex = RegExp(r'data:\s*\["(.+)"\]');
        final match = regex.firstMatch(dataLine);
        if (match != null) {
          final reply = match.group(1);
          return reply ?? 'chat.no_reply_found'.tr();
        }
      }
      throw Exception('No valid "data" line found in response');
    } else if (response.data is Map<String, dynamic> &&
        response.data.containsKey('data')) {
      final data = response.data['data'];
      if (data is List && data.isNotEmpty) {
        return data[0].toString();
      }
    }

    throw Exception('Failed to get bot response: ${response.data}');
  }

  String cleanText(String text) {
    return text
        .replaceAll(r'\u2014', '—')
        .replaceAll(r'\u2019', "'")
        .replaceAll(r'\u201c', '"')
        .replaceAll(r'\u201d', '"')
        .replaceAll(r'\n', '\n')
        .replaceAll(r'\\', '');
  }

  Future<String> getBotReply({required String message}) async {
    final eventId = await sendRequest(message: message);
    await Future.delayed(Duration(seconds: 1));
    final botReply = await getResponseByEventId(eventId: eventId);
    return cleanText(botReply);
  }
}
