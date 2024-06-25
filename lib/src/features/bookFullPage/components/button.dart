import 'package:bookify/src/core/components/text_app.dart';
import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonsSection extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onPressed;

  const ButtonsSection({
    Key? key,
    required this.isFavorite,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // TextButton(
        //   style: TextButton.styleFrom(
        //     backgroundColor: AppColors.black,
        //     padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 13),
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(5),
        //     ),
        //   ),
        //   onPressed: () {},
        //   child: const TextApp(
        //     fontWeight: FontWeight.w500,
        //     color: AppColors.white,
        //     label: 'Empreste esse livro',
        //   ),
        // ),
        IconButton(
          icon: Icon(
            isFavorite ? Icons.bookmark : Icons.bookmark_border_outlined,
            color: isFavorite ? AppColors.yellow : Colors.grey,
          ),
          onPressed: onPressed,
          iconSize: 32,
        ),
      ],
    );
  }
}
