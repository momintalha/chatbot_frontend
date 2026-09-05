abstract class ChatEvent {}

class SendMessage extends ChatEvent {
  String query;
  SendMessage(this.query);
}

class RecieveMessage extends ChatEvent {
  String reply;
  RecieveMessage(this.reply);
}
