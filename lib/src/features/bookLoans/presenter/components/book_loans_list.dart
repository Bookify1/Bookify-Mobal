import 'dart:math';
import 'package:flutter/material.dart';
import 'package:bookify/src/features/bookLoans/presenter/widgets/book_loan_card_widget.dart';

class BookLoansList extends StatelessWidget {
  const BookLoansList({super.key});

  @override
  Widget build(BuildContext context) {
    var rng = Random();
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return BookLoanCard(
          title: 'Yves Saint Laurent',
          author: 'Suzy Menkes',
          status: 'Devolução em breve',
          days: rng.nextInt(20),
        );
      },
      itemCount: 5,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 8);
      },
    );
  }
}
