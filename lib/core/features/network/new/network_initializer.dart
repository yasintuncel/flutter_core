import 'network.dart';

class NetworkInitializer {
  NetworkInitializer._privateConstructor() {
    currentConstants = _developmentConstants;
  }
  static final NetworkInitializer instance = NetworkInitializer._privateConstructor();

  final NetworkConstant _developmentConstants = NetworkConstant(
    host: 'localhost',
    port: 'port',
    apikey: 'key',
  );

  final NetworkConstant _productionConstants = NetworkConstant(
    host: 'localhost',
    port: 'port',
    apikey: 'key',
  );

  late NetworkConstant currentConstants;
}
