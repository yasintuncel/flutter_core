import 'new/network.dart';

class NetworkConstants {
  static const type = 'http://';
  static const host = 'host';
  static const port = 'port';
  static const apikey = 'key';

  static const api = '/api';
  static const images = '/images';

  static const baseUrl = '$type$host:$port';

  static const baseApiUrl = '$baseUrl$api';
  static const baseImageUrl = '$baseUrl$images';

  static const Duration timeoutDuration = Duration(seconds: 15);
}

// general header
Map<String, String> headers = {
  'Content-Type': 'application/json; charset=UTF-8',
  KeyFields.apikey: NetworkConstants.apikey,
};

addTokenToHeader(String? token) {
  headers.addAll({KeyFields.access: token ?? ''});
}

removeTokenFromHeader() {
  headers.remove(KeyFields.access);
}
