import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/splash_controller.dart';

class SplashScreenPage extends StatelessWidget {
  SplashScreenPage({super.key}) {
    Modular.get<SplashController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 184, 196),
      body: Column(
        children: [
          const Spacer(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Quick",
                style: TextStyle(
                  fontSize: 48,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "SUAP",
                style: TextStyle(
                  fontSize: 48,
                  color: Color.fromARGB(255, 24, 62, 75),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/bitzen-alt.png'),
              const SizedBox(width: 24),
              Image.asset('assets/uenp-alt.png'),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
