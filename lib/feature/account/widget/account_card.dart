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
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF7C6FB5),
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
          const Text(
            'E-mail',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: emailController,
            readOnly: true,
            style: const TextStyle(color: Colors.white, fontSize: 14),
            decoration: _buildInputDecoration(Icons.email, 'user@example.com'),
          ),
          const SizedBox(height: 16),
          const Text(
            'Name',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: nameController,
            readOnly: true,
            style: const TextStyle(color: Colors.white, fontSize: 14),
            decoration: _buildInputDecoration(Icons.person, 'Full name'),
          ),
        ],
      ),
    );
  }

  InputDecoration _buildInputDecoration(IconData icon, String hint) {
    return InputDecoration(
      prefixIcon: Icon(icon, color: Colors.white70),
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.white70),
      filled: true,
      fillColor: Colors.transparent,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
