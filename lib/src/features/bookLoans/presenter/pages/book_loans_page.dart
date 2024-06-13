import 'package:bookify/src/features/bookLoans/presenter/components/book_loans_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bookify/src/core/components/text_app.dart';
import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:bookify/src/core/styles/app_font_size.dart';

class BookLoansPage extends StatelessWidget {
  const BookLoansPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 1.sh,
          minWidth: 1.sw,
        ),
        child: const Padding(
          padding: EdgeInsets.only(
            left: 28,
            right: 28,
            top: 100,
            bottom: 120,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextApp(
                label: 'Seus Empréstimos',
                color: AppColors.black,
                fontSize: AppFontSize.xxxLarge,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 32),
              BookLoansList(),
            ],
          ),
        ),
      ),
    );
  }
}
