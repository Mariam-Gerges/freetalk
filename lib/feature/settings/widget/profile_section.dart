import 'package:flutter/material.dart';
import 'package:freetalk/core/routing/routes.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.person,
                color: Theme.of(context).primaryColor, size: 32),
          ),
          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('john doe'),
                const SizedBox(height: 4),
                Text('Show personal details',
                    style: TextStyle(color: Theme.of(context).hintColor)),
              ],
            ),
          ),

          IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: () {
              Navigator.pushNamed(context, Routes.accountScreen);
            },
          ),
        ],
      ),
    );
  }
}