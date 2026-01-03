class ContactRequest {
  final String? name;
  final String email;
  final String message;

  ContactRequest({
    this.name,
    required this.email,
    required this.message,
  });

  factory ContactRequest.empty() => ContactRequest(
        name: '',
        email: '',
        message: '',
      );

  ContactRequest copyWith({
    String? name,
    String? email,
    String? message,
  }) {
    return ContactRequest(
      name: name ?? this.name,
      email: email ?? this.email,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'message': message,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContactRequest &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          email == other.email &&
          message == other.message;

  @override
  int get hashCode => Object.hash(name, email, message);
}

class ContactResponse {
  final bool success;
  final String message;

  ContactResponse({required this.success, required this.message});

  factory ContactResponse.fromJson(Map<String, dynamic> map) {
    return ContactResponse(
      success: map['success'] as bool,
      message: map['message'] as String,
    );
  }
}
