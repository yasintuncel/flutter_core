import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_status_code/http_status_code.dart';

import 'constanst/options.dart';
import 'model_parser.dart';
import 'network_reponse.dart';
import 'network_service.dart';

class RestService<T> extends NetworkService {
  RestService(this._path, this._parser) : super(constant: networkConstant) {
    fullPath = '${networkConstant.type}://${networkConstant.host}:${networkConstant.port}/$_path';
  }

  final String _path;
  final ModelParser<T> _parser;

  late String fullPath;

  Future<NetworkResponse> list() async {
    return _handleResponse<List<T>>(await this.get(fullPath));
  }

  Future<NetworkResponse> getOne(String id) async {
    return _handleResponse<T>(await this.get('$fullPath/$id'));
  }

  Future<NetworkResponse> deleteOne(String id) async {
    return _handleResponse<T>(await this.delete('$fullPath/$id'));
  }

  Future<NetworkResponse> update(String id, Map<String, dynamic> body) async {
    return _handleResponse<T>(await this.patch('$fullPath/$id', body: body));
  }

  Future<NetworkResponse> create(Map<String, dynamic> body) async {
    return _handleResponse<T>(await this.patch(fullPath, body: body));
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
    );

    if (Y is List) {
      handledResponse.data = List<Y>.from(json.decode(utf8.decode(response.bodyBytes)).map((x) => _parser.fromJson(x)));
    } else {
      handledResponse.data = _parser.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    }

    return handledResponse;
  }
}
