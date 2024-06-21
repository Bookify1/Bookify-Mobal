import 'package:flutter/material.dart';
import 'package:bookify/src/core/styles/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.white,
      toolbarHeight: 60,
      leadingWidth: double.maxFinite,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage('assets/images/logo.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearchPopup(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);

  void showSearchPopup(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height, // Altura da tela inteira
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Hinted search text',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: const [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/profile_picture.png'),
                      ),
                      title: Text('Yoo, Haneul'),
                      subtitle: Text(
                        'Q3 performance summary\nWe will discuss our sales performan...',
                      ),
                      trailing: Text('8:22 AM'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
