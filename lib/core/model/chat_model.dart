

enum Role {
  ai,
  human;

  @override
  String toString() => name.replaceAll('Role.', '');

  static Role fromString(String value) =>
      Role.values.firstWhere((element) => element.toString() == value);
}

class ChatModel {
  Role role;
  String message;
  bool error;
  
  ChatModel({
    required this.role,
    required this.message,
    this.error=false,
  });

  Map<String, String> toJson() {
    return {
      'role': role.toString(),
      'message': message,
    };
  }
}
