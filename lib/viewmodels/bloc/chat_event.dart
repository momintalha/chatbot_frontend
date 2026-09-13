abstract class ChatEvent {}

class SendMessage extends ChatEvent {
  String query;
  SendMessage(this.query);
}

class NewChat extends ChatEvent{}
class DeleteChat extends ChatEvent{}
class LoadChat extends ChatEvent{}
