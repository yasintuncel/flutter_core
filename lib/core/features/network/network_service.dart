import 'dart:convert';

import 'package:http/http.dart' as http;

import 'infrastructure/i_network_service.dart';
import 'models/json_model_parser.dart';
import 'network_constants.dart';

class NetworkService<T> extends INetworkService<T> {
  NetworkService(String path, JsonModelParser<T> parser) : super(path, parser);

  Future<List<T>?> list() async {
    try {
      var response = await http
          .get(
            Uri.parse(fullPath),
            headers: headers,
          )
          .timeout(NetworkConstants.timeoutDuration);
      if (response.statusCode != 200) return null;

      List<T> data = List<T>.from(json
          .decode(utf8.decode(response.bodyBytes))
          .map((x) => parser.fromJson(x)));
      return data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<T?> get(String id) async {
    try {
      var response = await http
          .get(
            Uri.parse('$fullPath/$id'),
            headers: headers,
          )
          .timeout(NetworkConstants.timeoutDuration);
      if (response.statusCode != 200) return null;
      T data = parser.fromJson(json.decode(utf8.decode(response.bodyBytes)));
      return data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<int> delete(String id) async {
    try {
      var response = await http
          .delete(
            Uri.parse('$fullPath/$id'),
            headers: headers,
          )
          .timeout(NetworkConstants.timeoutDuration);
      return response.statusCode;
    } catch (e) {
      print(e);
      return -1;
    }
  }

  Future<int> update(String id, Map<String, dynamic> body) async {
    try {
      var response = await http
          .patch(
            Uri.parse('$fullPath/$id'),
            headers: headers,
            body: json.encode(body),
          )
          .timeout(NetworkConstants.timeoutDuration);
      return response.statusCode;
    } catch (e) {
      print(e);
      return -1;
    }
  }

  Future<int> create(Map<String, dynamic> body) async {
    try {
      var response = await http
          .post(
            Uri.parse(fullPath),
            headers: headers,
            body: json.encode(body),
          )
          .timeout(NetworkConstants.timeoutDuration);
      return response.statusCode;
    } catch (e) {
      print(e);
      return -1;
    }
  }

  Future<int> image(String id, Map<String, dynamic> body) async {
    try {
      var response = await http
          .patch(
            Uri.parse('$fullPath/$id/image'),
            headers: headers,
            body: json.encode(body),
          )
          .timeout(NetworkConstants.timeoutDuration);
      return response.statusCode;
    } catch (e) {
      print(e);
      return -1;
    }
  }
}
