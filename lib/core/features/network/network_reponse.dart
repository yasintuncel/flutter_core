class NetworkResponse<T> {
  NetworkResponse({
    required this.statusCode,
    this.message,
    this.data,
  });

  int statusCode;
  String? message;
  T? data;
}
