import 'package:flutter_modular/flutter_modular.dart';
import 'package:site_uenp_app/guards/auth_guard.dart';
import 'package:site_uenp_app/modules/splash/splash_module.dart';

import '../modules/auth/auth_module.dart';
import '../modules/core/core_module.dart';
import '../modules/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
        AuthModule(),
        HomeModule(),
      ];

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/home/',
          module: HomeModule(),
          guards: [AuthGuard()],
        ),
        ModuleRoute('/auth/', module: AuthModule()),
        ModuleRoute('/splash/', module: SplashModule())
      ];
}
