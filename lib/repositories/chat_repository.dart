import 'package:chatbot_frontend/services/api_service.dart';
import 'package:chatbot_frontend/services/database_service.dart';
import 'package:flutter/widgets.dart';

class ChatRepository {
  final _chatDb = DatabaseService.chatDb;

  Future<String?> sendMessage(String query, int? chatid) async {
    debugPrint('in repository');

    // add user query to database
    await _chatDb.insert(
      chatid: chatid,
      role: 'user',
      content: query,
      dateTime: DateTime.now().toString(),
    );

    // call api
    final String? response = await ApiService.getReply(query);

    // add reply to database
    await _chatDb.insert(
      chatid: chatid,
      role: 'chatbot',
      content: response,
      dateTime: DateTime.now().toString(),
    );

    return response;
  }

  Future<int?> newChat(
    String? title,
    String? createdAt,
    String? updatedAt,
  ) async {
    return await _chatDb.create(
      title: title,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  Future<List<Map<String, dynamic>>> loadChat() async {
    final data = await _chatDb.fetchChat();
    return data ?? [];
  }

  Future<List<Map<String, dynamic>>> openChat(int? chatid) async {
    final data = await _chatDb.fetchMessage(id: chatid);
    return data ?? [];
  }

  Future<int> deleteChat(int? chatid) async {
    final int? count = await _chatDb.delete(id: chatid);
    return count ?? 0;
  }
}
