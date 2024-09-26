import 'package:flutter_modular/flutter_modular.dart';
import 'package:site_uenp_app/modules/auth/controllers/auth_controller.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/auth/');

  @override
  Future<bool> canActivate(String path, ModularRoute router) async {
    return Modular.get<AuthController>().isAuthenticated;
  }
}
