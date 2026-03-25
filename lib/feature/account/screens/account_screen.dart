import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freetalk/core/theming/app_colors.dart';
import 'package:freetalk/core/widget/bottom_navigation_bar.dart';
import 'package:freetalk/feature/account/logic/cubit/profile_cubit.dart';
import 'package:freetalk/feature/account/logic/cubit/profile_state.dart';
import 'package:freetalk/feature/account/widget/account_card.dart';
import 'package:freetalk/feature/account/widget/avatar.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  String? avatarInitials = 'MG';

  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getProfile();
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (user) {
                emailController.text = user.email;
                nameController.text = user.username;
                avatarInitials = user.username.isNotEmpty
                    ? user.username[0] +
                          (user.username.split(' ').length > 1
                              ? user.username.split(' ')[1][0]
                              : '')
                    : 'MG';
                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Account',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 30),
                      AvatarWidget(
                        initials: avatarInitials,
                        onEditTap: () {
                          // open bottom sheet
                        },
                      ),
                      const SizedBox(height: 40),
                      AccountCard(
                        emailController: emailController,
                        nameController: nameController,
                      ),
                    ],
                  ),
                );
              },
              error: (msg) => Center(
                child: Text(msg, style: const TextStyle(color: Colors.white)),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(initialIndex: 4),
    );
  }
}
