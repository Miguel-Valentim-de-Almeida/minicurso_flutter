import 'package:dio/dio.dart';
import 'package:site_uenp_app/exceptions/not_authorized.dart';
import 'package:site_uenp_app/modules/home/models/user_models.dart';

class UserRepository {
  // Declare a dependência e faça a injeção via construtor
  final Dio client;
  UserRepository(this.client);

  Future<UserModel> getData() async {
    // Faça a chamada tratando as exceções
    try {
    
      // Chame a rota '/v2/minhas-informacoes/meus-dados/' da api client
      final response = await client.get(
        '/v2/minhas-informacoes/meus-dados/',
      );

      // Faça a desserilização do json
      UserModel user = UserModel.fromJson(response.data);

      // Retorne o model
      return user;
    } on DioException catch (e) {
      // Tratamento de exceção - 401
      if (e.response?.statusCode == 401) {
        throw NotAuthorized(e.response?.statusMessage ?? "Não autorizado");
      }
      
      // Tratamento genérico de erro
      throw Exception();
    } catch (e) {
    
      // Tratamento genérico de erro
      throw Exception();
    }
  }
}