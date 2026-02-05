import 'package:flutter/material.dart';
import 'package:freetalk/core/routing/routes.dart';
import 'package:freetalk/core/theming/app_colors.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, Routes.translateScreen);
        break;
      case 1:
        Navigator.pushNamed(context, Routes.dictionaryScreen);
        break;
      case 2:
        Navigator.pushNamed(context, Routes.settingsScreen);
        break;
      case 3:
        Navigator.pushNamed(context, Routes.accountScreen);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Transform.translate(
              offset: const Offset(0, -20),
              child: FloatingActionButton(
                heroTag: 'chat_fab',
                onPressed: () {
                  Navigator.pushNamed(context, Routes.chatbotScreen);
                },
                backgroundColor: AppColors.primaryDark,
                child: const Icon(Icons.chat, color: Colors.white),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomNavigationBar(
              backgroundColor: AppColors.primary,
              selectedIconTheme: const IconThemeData(color: Colors.white),
              unselectedIconTheme: const IconThemeData(color: Colors.white70),
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white70,
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.translate),
                  label: 'Translate',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.book),
                  label: 'Dictionary',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'profile',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
