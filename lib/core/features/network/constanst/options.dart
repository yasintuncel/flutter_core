import 'network_constants.dart';

final NetworkConstant _development = NetworkConstant(
  host: 'localhost',
  port: '12000',
  apikey: 'Gvpws_rhOes8u_4itrX3wY4XMb4SL_1LKoBhBFjG_sJY5P7y_VvGGQd_yqfdEifOCcamjK',
);

final NetworkConstant _production = NetworkConstant(
  host: 'localhost',
  port: '12000',
  apikey: 'Gvpws_rhOes8u_4itrX3wY4XMb4SL_1LKoBhBFjG_sJY5P7y_VvGGQd_yqfdEifOCcamjK',
);

NetworkConstant networkConstant = _development;
