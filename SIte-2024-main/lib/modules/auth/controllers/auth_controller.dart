import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:site_uenp_app/exceptions/not_authorized.dart';
import 'package:site_uenp_app/modules/auth/repositories/auth_repository.dart';

class AuthController {
  final SharedPreferences store;
  final AuthRepository repository;

  AuthController(this.store, this.repository);

  final isLoading = ValueNotifier<bool>(false);

  bool get isAuthenticated => store.containsKey('token');

  final ValueNotifier<String> error = ValueNotifier<String>('');

  Future<void> login(String username, String password) async {
    isLoading.value = true;

    try {
      final login = await repository.login(username, password);

      await store.setString('token', login.access);
      await store.setString('refreshToken', login.refresh);

      Modular.to.pushReplacementNamed('/home/');
    } on NotAuthorized catch (e) {
      error.value = e.message;
    } catch (e) {
      print(e);
    }

    isLoading.value = false;
  }

  Future<void> logout() async {
    await store.remove('token');

    Modular.to.navigate('/auth/');
  }
}
