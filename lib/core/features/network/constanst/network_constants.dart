import '../key_fields.dart';

class NetworkConstant {
  NetworkConstant({
    this.type = 'http',
    required this.host,
    required this.port,
    required this.apikey,
    this.timeoutDuration = const Duration(seconds: 15),
    this.header = const {
      'Content-Type': 'application/json; charset=UTF-8',
    },
  }) {
    base = '$type$host:$port';
    header.addAll({KeyFields.apikey: apikey});
  }

  String type;
  String host;
  String port;

  String apikey;
  Map<String, String> header;

  late String base;
  Duration timeoutDuration;

  addTokenToHeader(String? token) {
    header.addAll({KeyFields.access: token ?? ''});
  }

  removeTokenFromHeader() {
    header.remove(KeyFields.access);
  }
}
