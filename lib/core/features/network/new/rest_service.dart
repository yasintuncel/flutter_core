import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_status_code/http_status_code.dart';
import 'package:user/core/features/network/new/network.dart';

import 'network_model_parser.dart';
import 'network_reponse.dart';

class RestService<T> {
  RestService(
    this._path,
    this._parser,
    this._constants,
  ) {
    _fullPath = '${_constants.host}/$_path';
    _headers = _constants.header;
    _duration = _constants.timeoutDuration;
  }

  final String _path;
  final NetworkModelParser<T> _parser;
  final NetworkConstant _constants;

  late String _fullPath;
  late Map<String, String> _headers;
  late Duration _duration;

  Future<NetworkResponse> list() async {
    return _handleResponse<List<T>>(
      await http.get(Uri.parse(_fullPath), headers: _headers).timeout(_duration),
    );
  }

  Future<NetworkResponse> get(String id) async {
    return _handleResponse<T>(
      await http.get(Uri.parse('$_fullPath/$id'), headers: _headers).timeout(_duration),
    );
  }

  Future<NetworkResponse> delete(String id) async {
    return _handleResponse<T>(
      await http.delete(Uri.parse('$_fullPath/$id'), headers: _headers).timeout(_duration),
    );
  }

  Future<NetworkResponse> update(String id, Map<String, dynamic> body) async {
    return _handleResponse<T>(
      await http.patch(Uri.parse('$_fullPath/$id'), headers: _headers, body: json.encode(body)).timeout(_duration),
    );
  }

  Future<NetworkResponse> create(Map<String, dynamic> body) async {
    return _handleResponse<T>(
      await http.post(Uri.parse(_fullPath), headers: _headers, body: json.encode(body)).timeout(_duration),
    );
  }

  NetworkResponse _handleResponse<Y>(Response response) {
    if (response.statusCode != StatusCode.OK) {
      return NetworkResponse(
        statusCode: response.statusCode,
        message: response.bodyBytes.toString(),
      );
    }

    var handledResponse = NetworkResponse(
      statusCode: response.statusCode,
      message: response.bodyBytes.toString(),
    );

    if (Y is List) {
      handledResponse.data = List<Y>.from(json.decode(utf8.decode(response.bodyBytes)).map((x) => _parser.fromJson(x)));
    } else {
      handledResponse.data = _parser.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    }

    return handledResponse;
  }
}
