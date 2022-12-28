import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'constanst/network_constants.dart';

class NetworkService {
  NetworkConstant constant;

  NetworkService({required this.constant});

  Future<Response> get(url) {
    return http.get(Uri.parse(url), headers: constant.header).timeout(constant.timeoutDuration);
  }

  Future<Response> post(url, {body}) {
    return http.post(Uri.parse(url), body: json.encode(body), headers: constant.header).timeout(constant.timeoutDuration);
  }

  Future<Response> patch(url, {body}) {
    return http.patch(Uri.parse(url), body: json.encode(body), headers: constant.header).timeout(constant.timeoutDuration);
  }

  Future<Response> delete(url, {body}) {
    return http.delete(Uri.parse(url), body: json.encode(body), headers: constant.header).timeout(constant.timeoutDuration);
  }
}
