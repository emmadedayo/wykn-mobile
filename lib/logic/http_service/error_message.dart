class ErrorMessage {
  final String field;
  final String message;

  ErrorMessage({
    required this.field,
    required this.message,
  });

  factory ErrorMessage.fromJson(Map<String, dynamic> json) {
    return ErrorMessage(
      field: json['field'],
      message: json['message'],
    );
  }
}
