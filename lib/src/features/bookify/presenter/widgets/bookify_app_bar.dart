import 'package:flutter/material.dart';
import 'package:bookify/src/core/components/text_app.dart';
import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:bookify/src/core/styles/app_font_size.dart';

class BookifyAppBar extends StatelessWidget {
  final int selectedCount;
  final VoidCallback refresh;
  final VoidCallback toBookLoan;
  const BookifyAppBar({
    super.key,
    required this.selectedCount,
    required this.refresh,
    required this.toBookLoan,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      forceElevated: false,
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.white,
      collapsedHeight: 100,
      expandedHeight: 200,
      automaticallyImplyLeading: false,
      excludeHeaderSemantics: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(left: 28, right: 28, top: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextApp(
                    label: 'Emprestar',
                    color: AppColors.black,
                    fontSize: AppFontSize.xxxLarge,
                    fontWeight: FontWeight.w600,
                  ),
                  IconButton(
                    onPressed: refresh,
                    icon: const Icon(
                      Icons.refresh,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const TextApp(
                label:
                    'Atenção: Você só pode emprestar 2 livros por biiblioteca.',
                color: AppColors.lightBlack,
                fontSize: AppFontSize.medium,
                overflow: TextOverflow.visible,
              ),
              const SizedBox(height: 5),
              TextApp(
                label: 'Livros selecionados: $selectedCount/2',
                color: AppColors.lightBlack,
                fontSize: AppFontSize.medium,
              ),
            ],
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.zero,
        child: Container(
          margin: const EdgeInsets.only(bottom: 20),
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: TextButton(
            style: TextButton.styleFrom(
              fixedSize: const Size(double.maxFinite, 56),
              backgroundColor: AppColors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: toBookLoan,
            child: TextApp(
              fontWeight: FontWeight.w500,
              color: AppColors.white,
              label: 'Avançar com empréstimo ($selectedCount livros)',
            ),
          ),
        ),
      ),
    );
  }
}
