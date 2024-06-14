import 'package:bookify/src/features/settings/presenter/pages/widgets/profile_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:bookify/src/core/styles/app_colors.dart';

class ProfileOptionsSection extends StatelessWidget {
  const ProfileOptionsSection({super.key});

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
              icon: Icons.person_rounded,
              label: 'Editar perfil',
              onTap: () {},
            ),
            ProfileListTile(
              icon: Icons.lock_rounded,
              label: 'Segurança',
              onTap: () {},
            ),
            ProfileListTile(
              icon: Icons.privacy_tip_rounded,
              label: 'Privacidade',
              onTap: () {},
            ),
            ProfileListTile(
              icon: Icons.policy_rounded,
              label: 'Termos e Políticas',
              onTap: () {},
            ),
            ProfileListTile(
              icon: Icons.help_rounded,
              label: 'Ajuda e Suporte',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
