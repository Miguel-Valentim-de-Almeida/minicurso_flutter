import 'package:flutter_modular/flutter_modular.dart';
import 'package:site_uenp_app/app/app_module.dart';

class SplashController {
  SplashController() {
    _initSplash();
  }

  _initSplash() async {
    await Modular.isModuleReady<AppModule>();

    await Future.delayed(const Duration(seconds: 1));

    Modular.to.navigate('/home/');
  }
}
