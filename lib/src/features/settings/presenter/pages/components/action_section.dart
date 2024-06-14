import 'package:bookify/src/features/settings/presenter/pages/widgets/profile_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:bookify/src/core/styles/app_colors.dart';

class ActionsSection extends StatelessWidget {
  const ActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Card(
        elevation: 0,
        color: AppColors.lightWhite,
        child: Column(
          children: [
            ProfileListTile(
              icon: Icons.exit_to_app_rounded,
              label: 'Sair',
              onTap: () {},
            ),
            ProfileListTile(
              icon: Icons.delete_rounded,
              label: 'Deletar Conta',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
