import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:site_uenp_app/modules/auth/controllers/auth_controller.dart';
import 'package:site_uenp_app/modules/home/controllers/user_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<UserController>();
  final authController = Modular.get<AuthController>();

  @override
  void initState() {
    super.initState();
    
    // Chama a função do controller para buscar os dados
    controller.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: Listenable.merge([
          controller.isLoading,
          controller.error,
          controller.state,
        ]),
        builder: (context, child) {
          if (controller.isLoading.value) {
            // Retorna um widget para indicar o loading
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.error.value.isNotEmpty) {
          
            // Retorna um widget para indicar o erro
            return Center(
              child: Text(
                controller.error.value,
                style: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            );
          }

          var user = controller.state.value;

          // Retorna um widget para a tela principal
          return Column(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: CachedNetworkImageProvider(
                                "https://suap.uenp.edu.br/${user.photo_url}",
                              ),
                            ),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user.nome_usual,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 184, 196),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  user.matricula,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Divider(
                          height: 30,
                          thickness: 1,
                          color: Color.fromARGB(255, 0, 184, 196),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  const Icon(
                                    Icons.calendar_today_rounded,
                                    color: Color.fromARGB(255, 0, 184, 196),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Data de Nascimento',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    DateFormat('dd/MM/yyyy').format(
                                        DateTime.parse(user.data_nascimento)),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  const Icon(
                                    Icons.school_rounded,
                                    color: Color.fromARGB(255, 0, 184, 196),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Vínculo',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    user.tipo_vinculo,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  const Icon(
                                    Icons.document_scanner_rounded,
                                    color: Color.fromARGB(255, 0, 184, 196),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'RG',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    user.rg,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  const Icon(
                                    Icons.person_rounded,
                                    color: Color.fromARGB(255, 0, 184, 196),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'CPF',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    user.cpf,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                const Icon(
                                  Icons.email_rounded,
                                  color: Color.fromARGB(255, 0, 184, 196),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'Email',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  user.email,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 0, 184, 196),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 24,
                            ),
                          ),
                          icon: const Icon(
                            Icons.logout_rounded,
                            color: Colors.white,
                          ),
                          label: const Text(
                            'Sair',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: authController.logout,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/bitzen.png'),
                  const SizedBox(width: 24),
                  Image.asset('assets/uenp.png'),
                ],
              ),
              const SizedBox(height: 8),
            ],
          );
        },
      ),
    );
  }
}