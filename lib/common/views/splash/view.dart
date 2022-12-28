import 'package:flutter/material.dart';

import '../../../core/constants/app_states.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/token_states.dart';
import '../../../core/dialogs/message_dialog.dart';
import '../../../core/navigation/navigator.dart';
import '../../managers/app_state_manager.dart';
import '../../managers/token_manager.dart';
import '../login/view.dart';
import '../main/view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  initialize(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    await AppStateManager.instance.checkAppState();
    print('App State: ${AppStateManager.instance.state}');

    switch (AppStateManager.instance.state) {
      case AppStates.noInternet:
        await showMessageDialog(
          context,
          message: 'Aktif internet bağlantınızın olduğundan emin olun.\nTekrar denemek için tıklayınız.',
        );
        setState(() {
          initialize(context);
        });
        return;
      case AppStates.cantReachServer:
        await showMessageDialog(
          context,
          message: 'Sunucuya ulaşılamadı.\nLütfen daha sonra tekrar deneyiniz.',
        );
        setState(() {
          initialize(context);
        });
        return;
      default:
        break;
    }

    // await AppRepository.instance.getDefaults();
    await TokenManager.instance.initialize();
    print('Token State: ${TokenManager.instance.state}');

    switch (TokenManager.instance.state) {
      case TokenStates.noLocalToken:
      case TokenStates.tokenExpired:
        replaceNextScreen(context, const LoginView());
        break;
      case TokenStates.validToken:
        replaceNextScreen(context, const MainView());
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    initialize(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: mainColorDark,
        child: const Center(child: Text('Splash')),
      ),
    );
  }
}
