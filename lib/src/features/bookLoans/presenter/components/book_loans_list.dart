import 'package:flutter/material.dart';
import 'package:bookify/src/features/bookLoans/presenter/widgets/book_loan_card_widget.dart';
import 'package:bookify/src/core/models/book_loan.dart';

class BookLoansList extends StatelessWidget {
  final List<BookLoan> bookLoans;

  const BookLoansList({super.key, required this.bookLoans});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return BookLoanCard(
          coverImage: bookLoans[index].book.coverImage,
          returned: bookLoans[index].returned!,
          title: bookLoans[index].book.title,
          author: bookLoans[index].book.author,
          status: _calculateStatus(bookLoans[index]),
          days: _calculateDaysRemaining(bookLoans[index].returnDate),
        );
      },
      itemCount: bookLoans.length,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 8);
      },
    );
  }

  String _calculateStatus(BookLoan loan) {
    int daysRemaining = _calculateDaysRemaining(loan.returnDate);
    if (daysRemaining < 0) {
      return 'Atrasado';
    } else if (daysRemaining <= 5) {
      return 'Devolução em breve';
    } else {
      return 'Empréstimo ativo';
    }
  }

  int _calculateDaysRemaining(DateTime returnDate) {
    return returnDate.difference(DateTime.now()).inDays;
  }
}
