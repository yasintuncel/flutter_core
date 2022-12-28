import 'network_constants.dart';

NetworkConstant _development = NetworkConstant(
  host: '172.23.137.125',
  port: '12000',
  apikey: 'Gvpws_rhOes8u_4itrX3wY4XMb4SL_1LKoBhBFjG_sJY5P7y_VvGGQd_yqfdEifOCcamjK',
  header: {
    'Content-Type': 'application/json; charset=UTF-8',
  },
);

// ignore: unused_element
NetworkConstant _production = NetworkConstant(
  host: 'localhost',
  port: '12000',
  apikey: 'Gvpws_rhOes8u_4itrX3wY4XMb4SL_1LKoBhBFjG_sJY5P7y_VvGGQd_yqfdEifOCcamjK',
  header: {
    'Content-Type': 'application/json; charset=UTF-8',
  },
);

NetworkConstant networkConstant = _development;
