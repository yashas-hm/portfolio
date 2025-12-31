enum Role { ai, human }

class ChatMessage {
  final String id;
  final Role role;
  final String content;
  final DateTime timestamp;

  const ChatMessage({
    required this.id,
    required this.role,
    required this.content,
    required this.timestamp,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    final dateTime = DateTime.now();

    return ChatMessage(
      id: dateTime.millisecondsSinceEpoch.toString(),
      role: Role.values.byName(json['role']),
      content: json['message'],
      timestamp: dateTime,
    );
  }

  Map<String, dynamic> toJson() => {
        'role': role.name,
        'message': content,
      };

  ChatMessage copyWith({String? content}) => ChatMessage(
        id: id,
        role: role,
        content: content ?? this.content,
        timestamp: timestamp,
      );
}

class ChatState {
  final List<ChatMessage> messages;
  final bool isLoading;
  final String? errorMessage;

  const ChatState({
    this.messages = const [],
    this.isLoading = false,
    this.errorMessage,
  });

  ChatState copyWith({
    List<ChatMessage>? messages,
    bool? isLoading,
    String? errorMessage,
    bool clearError = false,
  }) =>
      ChatState(
        messages: messages ?? this.messages,
        isLoading: isLoading ?? this.isLoading,
        errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      );
}
