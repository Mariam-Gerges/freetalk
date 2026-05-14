import 'package:flutter/material.dart';
import 'package:freetalk/core/routing/routes.dart';
import 'package:freetalk/core/widget/bottom_navigation_bar.dart';
import 'package:freetalk/feature/settings/widget/setting_item.dart';
import 'profile_section.dart';
import 'dark_mode_section.dart';
import 'section_header.dart';

class SettingBody extends StatelessWidget {
  const SettingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              Text(
                'Settings',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).textTheme.titleLarge?.color ??
                      Theme.of(context).colorScheme.onSurface,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ProfileSection(),
              ),

              const SizedBox(height: 8),
              const DarkModeSection(),

              const SizedBox(height: 8),
              const SectionHeader(title: 'Profile'),

              SettingsItem(
                icon: Icons.person,
                iconColor: const Color(0xFFFFA500),
                title: 'Edit Profile',
                onTap: () {
                  Navigator.pushNamed(context, Routes.accountScreen);
                },
              ),

              SettingsItem(
                icon: Icons.lock,
                iconColor: const Color(0xFF1E90FF),
                title: 'Change Password',
                onTap: () {
                  Navigator.pushNamed(context, Routes.changePasswordScreen);
                },
              ),

              const SizedBox(height: 8),

              SettingsItem(
                icon: Icons.logout,
                iconColor: const Color(0xFFFF6B6B),
                title: 'Logout',
                isDestructive: true,
                onTap: () {
                  _showLogoutConfirmation(context);
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          const CustomBottomNavigationBar(initialIndex: 3),
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.loginScreen);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Logged out successfully')),
              );
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}