import 'package:flutter/material.dart';
import 'package:freetalk/feature/chat_bot/model/chat_message.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'chat_bubble.dart';
import 'message_input.dart';
import 'typing_indicator.dart';

class ChatBody extends StatefulWidget {
  const ChatBody({super.key});

  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  final TextEditingController _messageController = TextEditingController();

  late final GenerativeModel _model;
  late final ChatSession _chat;

  bool _isTyping = false;

  final List<ChatMessage> _messages = [
    ChatMessage(
      text: 'Hello! 👋 How can I help you today?',
      isBot: true,
      timestamp: DateTime.now(),
    ),
  ];

  @override
  void initState() {
    super.initState();

    const apiKey = 'AQ.Ab8RN6KheWcBbTD-GIs2II1w1ofjusFMcqzJ3Buv9PI2RiKqbw';

    _model = GenerativeModel(
      model: 'gemini-2.5-flash  ', // تصحيح اسم الموديل ليكون فعالاً
      apiKey: apiKey,
      systemInstruction: Content.system(
        'أنت مساعد ذكي اسمه FreeTalk Assistant متخصص في مساعدة الصم.',
      ),
    );

    _chat = _model.startChat();
  }

  void _sendMessage() async {
    final userMessage = _messageController.text.trim();
    if (userMessage.isEmpty) return;

    setState(() {
      _messages.add(
        ChatMessage(
          text: userMessage,
          isBot: false,
          timestamp: DateTime.now(),
        ),
      );
      _isTyping = true;
    });

    _messageController.clear();

    try {
      final response = await _chat.sendMessage(Content.text(userMessage));

      setState(() {
        _isTyping = false;
        _messages.add(
          ChatMessage(
            text: response.text ?? 'No response',
            isBot: true,
            timestamp: DateTime.now(),
          ),
        );
      });
    } catch (e) {
      setState(() {
        _isTyping = false;
        _messages.add(
          ChatMessage(
            text: 'Error: $e',
            isBot: true,
            timestamp: DateTime.now(),
          ),
        );
      });
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chat Bot")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length + (_isTyping ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == _messages.length) {
                  return const TypingIndicator();
                }
                return ChatBubble(message: _messages[index]);
              },
            ),
          ),
          MessageInput(
            controller: _messageController,
            onSend: _sendMessage,
          ),
        ],
      ),
    );
  }
}