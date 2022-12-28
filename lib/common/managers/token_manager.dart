import '../../core/constants/token_states.dart';
import '../../core/features/network/constanst/options.dart';
import '../../core/features/secure_storage/secure_storage_keys.dart';
import '../../core/features/secure_storage/secure_storage_manager.dart';
import '../../core/utilities/jwt_parser.dart';

class TokenManager {
  TokenManager._privateConstructor();
  static final TokenManager instance = TokenManager._privateConstructor();

  String? token;
  late String userId;
  late TokenStates state;
  // String? pushToken;
  String? groupId;

  void setGroupId(String? groupId) {
    this.groupId = groupId;
  }

  setToken(token) async {
    this.token = token;
    var payload = JwtParser.parseJwt(token);
    userId = payload['id'];
    try {
      // pushToken = await FirebaseMessaging.instance.getToken();
      // await CompanyService.instance.update(companyId, {'notificationToken': pushToken});
      // await CompanyService.instance.getOne(companyId);
      return true;
    } catch (e) {
      return false;
    }
  }

  onLogin(String token) async {
    SecureStorageManager.instance.saveKey(SecureStorageKeys.TOKEN, token);
    networkConstant.addTokenToHeader(token);
    state = TokenStates.validToken;
    await setToken(token);
  }

  onLogout() async {
    await SecureStorageManager.instance.removeKey(SecureStorageKeys.TOKEN);
    networkConstant.removeTokenFromHeader();
    state = TokenStates.noLocalToken;
    token = null;
  }

  initialize() async {
    // pushToken = await FirebaseMessaging.instance.getToken();
    // print('push token: ' + pushToken!);

    String? localToken = await SecureStorageManager.instance.readKey(SecureStorageKeys.TOKEN);

    if (localToken == null) {
      return state = TokenStates.noLocalToken;
    }
    // await AppRepository.instance.getDefaults();
    print('API Token: $localToken');

    Map<String, dynamic> payload = JwtParser.parseJwt(localToken);
    DateTime now = DateTime.now();
    DateTime expDate = DateTime.fromMillisecondsSinceEpoch(payload['exp'] * 1000);
    var diff = expDate.difference(now);

    if (diff.inHours < 50) {
      return state = TokenStates.tokenExpired;
    }
    token = localToken;
    userId = payload['id'];
    networkConstant.addTokenToHeader(localToken);
    return state = TokenStates.validToken;
  }
}
