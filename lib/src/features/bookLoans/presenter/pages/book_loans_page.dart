import 'package:bookify/src/features/auth/data/auth_repository.dart';
import 'package:bookify/src/features/bookLoans/presenter/components/book_loans_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bookify/src/core/components/text_app.dart';
import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:bookify/src/core/styles/app_font_size.dart';
import 'package:bookify/src/core/models/book_loan.dart';
import 'package:bookify/src/core/services/book_service.dart';

class BookLoansPage extends StatefulWidget {
  const BookLoansPage({super.key});

  @override
  _BookLoansPageState createState() => _BookLoansPageState();
}

class _BookLoansPageState extends State<BookLoansPage> {
  late Future<List<BookLoan>> _bookLoansFuture;

  @override
  void initState() {
    super.initState();
    _bookLoansFuture = _fetchBookLoans();
  }

  Future<List<BookLoan>> _fetchBookLoans() async {
    String userId = AuthRepository.idUser!;
    BookService bookService = BookService();
    return await bookService.fetchBookLoans(userId);
  }

  void _refreshBookLoans() {
    setState(() {
      _bookLoansFuture = _fetchBookLoans();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 1.sh,
          minWidth: 1.sw,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 28,
                right: 28,
                top: 100,
                bottom: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const TextApp(
                    label: 'Seus Empréstimos',
                    color: AppColors.black,
                    fontSize: AppFontSize.xxxLarge,
                    fontWeight: FontWeight.w600,
                  ),
                  IconButton(
                    onPressed: _refreshBookLoans,
                    icon: const Icon(
                      Icons.refresh,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder<List<BookLoan>>(
                future: _bookLoansFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Erro ao carregar empréstimos'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('Nenhum empréstimo encontrado'));
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 28,
                        right: 28,
                        bottom: 120,
                      ),
                      child: BookLoansList(bookLoans: snapshot.data!),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
