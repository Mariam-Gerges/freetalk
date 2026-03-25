import 'package:flutter/material.dart';
import 'package:freetalk/core/routing/routes.dart';
import 'package:freetalk/core/theming/app_colors.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int initialIndex;
  const CustomBottomNavigationBar({super.key, this.initialIndex = 0});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    if (index == widget.initialIndex) return;

    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, Routes.translateScreen);
        break;
      case 1:
        Navigator.pushReplacementNamed(context, Routes.dictionaryScreen);
        break;
      case 2:
        Navigator.pushReplacementNamed(context, Routes.chatbotScreen);
        break;
      case 3:
        Navigator.pushReplacementNamed(context, Routes.settingsScreen);
        break;
      case 4:
        Navigator.pushReplacementNamed(context, Routes.accountScreen);
        break;
    }
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = _selectedIndex == index;
    // Using an energetic color similar to the design image to pop on the purple background
    final activeColor = Colors.white;
    final inactiveColor = Colors.white54;
    final color = isSelected ? activeColor : inactiveColor;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 65,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // The animated top indicator line
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutCubic,
              height: 3,
              width: isSelected ? 24 : 0,
              decoration: BoxDecoration(
                color: activeColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const Spacer(),
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 11,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95, // Total height to accommodate the bump
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          // 1. The circular bump for the FAB (drawn behind to cast shadow upwards seamlessly)
          Positioned(
            top: 2,
            child: Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 10,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
            ),
          ),

          // 2. The main bottom bar rectangle
          Container(
            height: 70,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(24),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 10,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(0, Icons.translate, 'Translate'),
                _buildNavItem(1, Icons.book, 'Dictionary'),
                const SizedBox(width: 65), // Gap for the center FAB
                _buildNavItem(3, Icons.settings, 'Settings'),
                _buildNavItem(4, Icons.person, 'Profile'),
              ],
            ),
          ),

          // 3. The Central Floating Action Button (ChatBot)
          Positioned(
            top: 5,
            child: FloatingActionButton(
              heroTag: 'chat_fab',
              onPressed: () => _onItemTapped(2),
              backgroundColor: AppColors.primaryDark,
              elevation:
                  0, // removed elevation so it sits nicely inside the bump
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Icon(Icons.chat, color: Colors.white, size: 28),
            ),
          ),
        ],
      ),
    );
  }
}
