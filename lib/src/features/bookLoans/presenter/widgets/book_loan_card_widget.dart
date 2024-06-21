import 'package:bookify/src/core/components/text_app.dart';
import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:bookify/src/core/styles/app_font_size.dart';
import 'package:flutter/material.dart';

class BookLoanCard extends StatelessWidget {
  final String title;
  final String author;
  final String status;
  final int days;

  const BookLoanCard({
    super.key,
    required this.title,
    required this.author,
    required this.status,
    required this.days,
  });

  @override
  Widget build(BuildContext context) {
    Color progressColor;
    double progressValue;

    // Determina a cor e o valor do progresso baseado no status e dias restantes
    if (status == 'Atrasado') {
      progressColor = AppColors.red;
      progressValue = 1.0;
    } else if (status == 'Devolução em breve') {
      progressColor = AppColors.yellow;
      // Calcula o valor do progresso baseado nos dias restantes
      progressValue = (20 - days) / 20;
    } else {
      progressColor = AppColors.green;
      progressValue =
          0.0; // Não será usado, pois a barra de progresso será oculta
    }

    return Row(
      children: [
        Container(
          width: 72,
          height: 105,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          child: Image.asset(
            'assets/images/book_placeholder.jpg',
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextApp(
                label: title,
                fontSize: AppFontSize.large,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
              const SizedBox(height: 4),
              TextApp(
                label: author,
                color: AppColors.gray,
              ),
              const SizedBox(height: 22),
              if (status != 'Entregue')
                Row(
                  children: [
                    const Icon(
                      Icons.timer_outlined,
                      color: AppColors.gray,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: LinearProgressIndicator(
                        borderRadius: BorderRadius.circular(999),
                        value: progressValue,
                        backgroundColor: AppColors.lightGray,
                        color: progressColor,
                      ),
                    ),
                    const SizedBox(width: 8),
                    TextApp(
                      label: days < 0 ? '$days dias' : 'em $days dias',
                      color: progressColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
            ],
          ),
        ),
        SizedBox(
          height: 105,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
