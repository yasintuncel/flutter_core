import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../models/json_model_parser.dart';
import '../network_constants.dart';

abstract class INetworkService<T> {
  INetworkService(this.path, this.parser) {
    fullPath = '${NetworkConstants.baseApiUrl}$path';
  }

  String fullPath = '';
  String path;
  JsonModelParser<T> parser;

  Future<Response> postRequest(String route, Map<String, dynamic> data) {
    return http
        .post(
          Uri.parse('$fullPath/$route'),
          headers: headers,
          body: json.encode(data),
        )
        .timeout(NetworkConstants.timeoutDuration);
  }
}
