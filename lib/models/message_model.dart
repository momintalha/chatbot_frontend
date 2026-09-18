class MessageModel {
  final String? role;
  final String? message;
  final bool? isLoading;

  MessageModel({this.role, this.message, this.isLoading});

  MessageModel copyWith({String? role, String? message, bool? isLoading}) {
    return MessageModel(
      role: role ?? this.role,
      message: message ?? this.message,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
