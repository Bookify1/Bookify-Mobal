import 'package:bookify/src/core/components/text_app.dart';
import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:bookify/src/core/styles/app_font_size.dart';
import 'package:bookify/src/features/auth/signup/presenter/components/build_terms_and_conditions.dart';
import 'package:bookify/src/shared/text.dart';
import 'package:flutter/material.dart';

class TermsPage extends StatefulWidget {
  const TermsPage({super.key});

  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
  bool AcceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.gray,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextApp(
                label: 'Olá, 👋',
                fontWeight: FontWeight.w600,
                color: AppColors.white,
                fontSize: AppFontSize.xxLarge,
              ),
              SizedBox(height: 10),
              TextApp(
                label:
                    'Para criar sua conta, pedimos que você leia e aceite nossos Termos e Condições.',
                color: AppColors.lightGray,
                fontSize: AppFontSize.large,
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        const TextApp(
          label: 'Termos e condições ',
          fontSize: AppFontSize.xxxLarge,
          color: AppColors.black,
        ),
        const SizedBox(height: 10),
        TextApp(
          label: 'Última atualização: ${TextGlobals.lastUpdate}',
          color: AppColors.gray,
        ),
        const SizedBox(height: 15),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.gray,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Scrollbar(
              thumbVisibility: true,
              radius: Radius.circular(8),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(right: 10),
                child: RichText(
                  text: TextSpan(
                    children: buildTermsAndConditions(),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              value: AcceptTerms,
              onChanged: (bool? value) {
                setState(() {
                  AcceptTerms = value ?? false;
                });
              },
            ),
            TextApp(
              label: 'Aceite os termos e condições',
              color: AppColors.black,
            )
          ],
        ),
      ],
    );
  }
}
