import 'package:flutter/material.dart';
import 'package:freetalk/core/theming/app_colors.dart';

class AvatarWidget extends StatelessWidget {
  final String? initials;
  final VoidCallback onEditTap;

  const AvatarWidget({super.key, this.initials, required this.onEditTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            child: Text(
              initials ?? '',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: onEditTap,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 6,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(8),
                child: Icon(Icons.edit, size: 18, color: AppColors.primary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
