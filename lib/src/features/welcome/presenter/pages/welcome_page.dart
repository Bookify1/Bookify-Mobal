import 'package:bookify/src/features/welcome/presenter/components/welcome_buttons.dart';
import 'package:bookify/src/features/welcome/presenter/components/welcome_header.dart';
import 'package:bookify/src/features/welcome/presenter/components/welcome_message.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          WelcomeHeader(),
          SizedBox(height: 20),
          WelcomeMessage(),
          SizedBox(height: 40),
          WelcomeButtons(),
        ],
      ),
    );
  }
}
