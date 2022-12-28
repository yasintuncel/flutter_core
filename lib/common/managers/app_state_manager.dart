import '../../core/constants/app_states.dart';
import '../../core/utilities/network_checker.dart';

class AppStateManager {
  AppStateManager._privateConstructor();
  static final AppStateManager instance = AppStateManager._privateConstructor();

  AppStates state = AppStates.initialize;
  // SettingModel? settingModel;

  checkAppState() async {
    bool isOnline = await NetworkChecker.instance.checkConnectivity();

    if (!isOnline) {
      state = AppStates.noInternet;
      return;
    }

    // List<SettingModel> settings = await SettingService.instance.getList();
    // if (settings.isEmpty) {
    //   state = AppStates.cantReachServer;
    //   return;
    // }

    // settingModel = settings[0];
    state = AppStates.success;
    return;
  }
}
