abstract class ChatEvent {}

class SendMessage extends ChatEvent {
  String query;
  SendMessage(this.query);
}

class NewChat extends ChatEvent {}

class DeleteChat extends ChatEvent {
  final int? id;
  DeleteChat(this.id);
}

class LoadChat extends ChatEvent {}

class OpenChat extends ChatEvent {
  final int? id;
  OpenChat(this.id);
}
