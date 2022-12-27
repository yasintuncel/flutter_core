import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../logger/logger.dart';
import '../models/json_model_parser.dart';
import '../network_constants.dart';
import 'i_network_service.dart';

abstract class IRestfulService<T> extends INetworkService {
  IRestfulService(String path, JsonModelParser<T> parser) : super(path, parser) {
    fullPath = '${NetworkConstants.baseApiUrl}$path';
    imageFullPath = '${NetworkConstants.baseImageUrl}$path';
  }

  String imageFullPath = '';

  Future<List<T>> getList() async {
    try {
      var response = await http
          .get(
            Uri.parse(fullPath),
            headers: headers,
          )
          .timeout(NetworkConstants.timeoutDuration);
      if (response.statusCode == 200) {
        return List<T>.from(json.decode(utf8.decode(response.bodyBytes)).map((x) => parser.fromJson(x)));
      } else {
        Logger.instance.log(LogLevels.error, '${response.statusCode}');
        return [];
      }
    } catch (e) {
      Logger.instance.log(LogLevels.error, e.toString());
      return [];
    }
  }

  Future<Response> getBy(Map<String, dynamic> model) async {
    return http
        .post(
          Uri.parse('$fullPath/getBy'),
          headers: headers,
          body: json.encode(model),
        )
        .timeout(NetworkConstants.timeoutDuration);
  }

  Future<T?> getOne(String id) async {
    try {
      var response = await http
          .get(
            Uri.parse('$fullPath/$id'),
            headers: headers,
          )
          .timeout(NetworkConstants.timeoutDuration);
      if (response.statusCode == 200) {
        return parser.fromJson(json.decode(utf8.decode(response.bodyBytes)));
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<Response> create(Map<String, dynamic> model) async {
    var response = await http
        .post(
          Uri.parse(fullPath),
          headers: headers,
          body: json.encode(model),
        )
        .timeout(NetworkConstants.timeoutDuration);
    return response;
  }

  Future<Response> update(String id, Map<String, dynamic> model) async {
    return await http
        .patch(
          Uri.parse('$fullPath/$id'),
          headers: headers,
          body: json.encode(model),
        )
        .timeout(NetworkConstants.timeoutDuration);
  }

  Future<int> delete(String id) async {
    var response = await http
        .delete(
          Uri.parse('$fullPath/$id'),
          headers: headers,
        )
        .timeout(NetworkConstants.timeoutDuration);
    return response.statusCode;
  }

  Future<int> deleteWithBody(String id, {body}) async {
    var response = await http
        .delete(
          Uri.parse('$fullPath/$id'),
          body: json.encode(body),
          headers: headers,
        )
        .timeout(NetworkConstants.timeoutDuration);
    return response.statusCode;
  }

  List<T> convertList(bodyBytes) {
    return List<T>.from(json.decode(utf8.decode(bodyBytes)).map((x) => parser.fromJson(x)));
  }

  T convertModel(bodyBytes) {
    return parser.fromJson(json.decode(utf8.decode(bodyBytes)));
  }

  Map<String, dynamic> getMap(bodyBytes) {
    return json.decode(utf8.decode(bodyBytes));
  }
}
