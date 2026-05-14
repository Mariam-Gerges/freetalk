import 'package:flutter/material.dart';
import 'package:freetalk/feature/chat_bot/model/chat_message.dart';


class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment:
            message.isBot ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
         if (!message.isBot)
  CircleAvatar(
    radius: 18,
    backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
    child: const Text('👤', style: TextStyle(fontSize: 20)),
  ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
               color: message.isBot
    ? theme.cardColor
    : theme.colorScheme.primary.withOpacity(0.8),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  color: message.isBot
                      ? theme.colorScheme.onSurface
                      : theme.colorScheme.onPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}