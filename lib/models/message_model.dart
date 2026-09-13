class MessageModel {
  final String? role;
  final String? message;
  final bool isLoading;
  
  MessageModel({this.role, this.message, this.isLoading = false});
}
