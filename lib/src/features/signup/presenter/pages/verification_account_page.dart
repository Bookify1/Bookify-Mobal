import 'package:bookify/src/core/components/text_app.dart';
import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:bookify/src/core/styles/app_font_size.dart';
import 'package:flutter/material.dart';

class VerificationCodePage extends StatefulWidget {
  @override
  _VerificationCodePageState createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  final List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());
  List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

  @override
  void dispose() {
    _controllers.forEach((controller) => controller.dispose());
    _focusNodes.forEach((focusNode) => focusNode.dispose());
    super.dispose();
  }

  void _handleInput(String value, int index) {
    if (value.isNotEmpty && index < 3) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    }
    if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const TextApp(
          label: 'Código de Verificação',
          fontSize: AppFontSize.xxxLarge,
          fontWeight: FontWeight.w400,
          color: AppColors.black,
        ),
        const SizedBox(height: 10),
        const TextApp(
          label: 'Enviaremos um código de verificação para seu e-mail',
          color: AppColors.gray,
        ),
        const SizedBox(height: 15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TextApp(
              label: 'example@gmail.com',
              color: AppColors.darkYellow,
            ),
            TextButton(
              onPressed: () {},
              child: const TextApp(
                label: 'Alterar e-mail',
                color: AppColors.darkYellow,
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (index) {
            return SizedBox(
              width: 50,
              child: TextField(
                controller: _controllers[index],
                focusNode: _focusNodes[index],
                maxLength: 1,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: AppFontSize.xxxLarge, color: AppColors.black),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  counterText: '',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.yellow),
                  ),
                ),
                onChanged: (value) => _handleInput(value, index),
              ),
            );
          }),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.yellow,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: () {
            // Lógica de verificação do código
          },
          child: const TextApp(
            label: 'Confirme',
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: () {
            // Lógica para reenviar o código
          },
          child: const TextApp(
            label: 'Reenviar',
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 10),
        const Center(
          child: TextApp(
            label: 'Reenviaremos o código em 00:30',
            color: AppColors.gray,
          ),
        ),
      ],
    );
  }
}
