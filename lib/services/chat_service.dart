import 'dart:convert';

import 'package:chatbot_frontend/models/response_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ChatService {
  static void getReply(String query) async {
    String link = 'https://chatbot-api-f35f8455.fastapicloud.dev/chat';

    var response = await http.post(
      Uri.parse(link),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'prompt': query}),
    );
    debugPrint(response.body);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final responseModel = ResponseModel.fromjson(
        data['model'],
        data['role'],
        data['reply'],
        Usage(
          data['completion_tokens'],
          data['prompt_tokens'],
          data['total_tokens'],
        ),
      );
      debugPrint(responseModel.reply);
    }
  }
}
