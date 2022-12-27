import 'dart:convert';
import 'dart:typed_data';

import '../features/network/models/json_model_parser.dart';

class JsonHelper {
  static Map<String, dynamic> decode(Uint8List bodyBytes) {
    return json.decode(utf8.decode(bodyBytes));
  }

  static List<T> converToList<T>(Uint8List bodyBytes, JsonModelParser parser) {
    return List<T>.from(json.decode(utf8.decode(bodyBytes)).map((x) => parser.fromJson(x)));
  }
}
