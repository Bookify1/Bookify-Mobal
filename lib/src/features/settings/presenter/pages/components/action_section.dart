import 'package:bookify/src/core/router/app_rout_enum.dart';
import 'package:bookify/src/features/auth/data/auth_repository.dart';
import 'package:bookify/src/features/settings/presenter/pages/widgets/profile_list_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:go_router/go_router.dart';

class ActionsSection extends StatelessWidget {
  const ActionsSection({super.key});

  void _confirmDeleteAccount(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmar Exclusão'),
          content: Text(
              'Você tem certeza que deseja deletar sua conta? Esta ação não pode ser desfeita.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                AppRouteEnum currentPath = AppRouteEnum.welcome;
                String routePath = currentPath.name;
                context.pushReplacement(routePath);

                await _deleteAccount(context);
              },
              child: Text('Deletar'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteAccount(BuildContext context) async {
    try {
      await AuthRepository(FirebaseAuth.instance).deleteAccount();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao deletar conta: $e')),
      );
    }
  }

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
              onTap: () async {
                await AuthRepository(FirebaseAuth.instance).signOut();
                AppRouteEnum currentPath = AppRouteEnum.welcome;
                String routePath = currentPath.name;
                context.pushReplacement(routePath);
              },
            ),
            ProfileListTile(
              icon: Icons.delete_rounded,
              label: 'Deletar Conta',
              onTap: () => _confirmDeleteAccount(context),
            ),
          ],
        ),
      ),
    );
  }
}
