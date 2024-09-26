import 'package:flutter/material.dart';
import 'package:site_uenp_app/exceptions/not_authorized.dart';
import 'package:site_uenp_app/modules/auth/controllers/auth_controller.dart';
import 'package:site_uenp_app/modules/home/models/user_models.dart';
import 'package:site_uenp_app/modules/home/repositories/user_repository.dart';

class UserController {
  // Declare as dependências e faça a injeção via construtor
  final UserRepository repository;
  final AuthController authController;
  UserController(this.repository, this.authController);

  // Crie uma variável do tipo bool Notifier para verificar se está em loading
  final isLoading = ValueNotifier<bool>(false);

  // Crie uma variável do tipo UserModel Notifier para verificar o estado do User
  final state = ValueNotifier<UserModel>(
    UserModel(
      matricula: 'matricula',
      nome_usual: 'nome_usual',
      cpf: 'cpf',
      rg: 'rg',
      data_nascimento: '2024-09-14 10:30:00',
      naturalidade: 'naturalidade',
      tipo_sanguineo: 'tipo_sanguineo',
      email: 'email',
      photo_url: 'photo_url',
      tipo_vinculo: 'tipo_vinculo',
    ),
  );

  // Crie uma variável do tipo String Notifier para verificar se está com erro
  final ValueNotifier<String> error = ValueNotifier<String>('');

  Future getData() async {
    // Inicia o carregamento - set loading como true
    isLoading.value = true;

    try {
      // Faz a chamada na ao repositório
      final result = await repository.getData();
      
      // Atualiza o estado com o UserModel retornado
      state.value = result;
    } on NotAuthorized {
      // Em caso de NotAuthorized, deslogar o usuário
      authController.logout();
    } catch (e) {
      // Caso tenha um erro genérico, salvar o erro no estado
      error.value = e.toString();
    }

    // Finaliza o carregamento - set loading como false
    isLoading.value = false;
  }
}