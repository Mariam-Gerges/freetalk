import 'package:flutter/material.dart';

class AccountCard extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController nameController;

  const AccountCard({
    super.key,
    required this.emailController,
    required this.nameController,
  });

  @override
  Widget build(BuildContext context) {
    final onSurfaceColor = Theme.of(context).colorScheme.onSurface;
    final hintColor = onSurfaceColor.withOpacity(0.7);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'E-mail',
            style: TextStyle(color: hintColor, fontSize: 12),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: emailController,
            readOnly: true,
            style: TextStyle(color: onSurfaceColor, fontSize: 14),
            decoration: _buildInputDecoration(context, Icons.email, 'user@example.com'),
          ),
          const SizedBox(height: 16),
          Text(
            'Name',
            style: TextStyle(color: hintColor, fontSize: 12),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: nameController,
            readOnly: true,
            style: TextStyle(color: onSurfaceColor, fontSize: 14),
            decoration: _buildInputDecoration(context, Icons.person, 'Full name'),
          ),
        ],
      ),
    );
  }

  InputDecoration _buildInputDecoration(BuildContext context, IconData icon, String hint) {
    final hintColor = Theme.of(context).colorScheme.onSurface.withOpacity(0.7);
    return InputDecoration(
      prefixIcon: Icon(icon, color: hintColor),
      hintText: hint,
      hintStyle: TextStyle(color: hintColor),
      filled: true,
      fillColor: Colors.transparent,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
