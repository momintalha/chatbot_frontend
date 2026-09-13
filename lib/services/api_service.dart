import 'dart:convert';

import 'package:chatbot_frontend/models/response_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<String?> getReply(String query) async {
    debugPrint('in api');
    String chatbotApi = 'https://chatbot-api-f35f8455.fastapicloud.dev/chat';

    late ResponseModel? responseModel;

    var response = await http.post(
      Uri.parse(chatbotApi),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'prompt': query}),
    );
    debugPrint(response.body);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final usage = data['usage'];
      responseModel = ResponseModel.fromjson(
        data['model'],
        data['role'],
        data['reply'],
        Usage(
          usage['completion_tokens'],
          usage['prompt_tokens'],
          usage['total_tokens'],
        ),
      );
      debugPrint(responseModel.reply);
    }
    return responseModel?.reply;
  }
}
