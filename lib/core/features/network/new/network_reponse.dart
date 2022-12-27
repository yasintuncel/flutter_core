class NetworkResponse<T> {
  NetworkResponse({
    required this.statusCode,
    required this.message,
    this.data,
  });

  int statusCode;
  String message;
  T? data;
}
