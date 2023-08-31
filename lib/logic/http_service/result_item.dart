class ResultItem<T> {
  String message;
  int? errorCode;
  bool? success;
  T result;

  ResultItem({required this.result, this.message = '', this.errorCode = 400, this.success});
}
