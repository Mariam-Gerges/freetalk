class ChatMessage {
  final String id;
  final String conversationId;
  final String senderId;
  final String senderName;
  final String content;
  final String? imageUrl;
  final DateTime createdAt;
  final bool isEdited;

  ChatMessage({
    required this.id,
    required this.conversationId,
    required this.senderId,
    required this.senderName,
    required this.content,
    this.imageUrl,
    required this.createdAt,
    this.isEdited = false,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'] ?? '',
      conversationId: json['conversationId'] ?? '',
      senderId: json['senderId'] ?? '',
      senderName: json['senderName'] ?? '',
      content: json['content'] ?? '',
      imageUrl: json['imageUrl'],
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      isEdited: json['isEdited'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'conversationId': conversationId,
      'senderId': senderId,
      'senderName': senderName,
      'content': content,
      'imageUrl': imageUrl,
      'createdAt': createdAt.toIso8601String(),
      'isEdited': isEdited,
    };
  }
}

class Conversation {
  final String id;
  final String name;
  final String? imageUrl;
  final DateTime lastMessageTime;
  final String lastMessage;
  final List<String> participantIds;

  Conversation({
    required this.id,
    required this.name,
    this.imageUrl,
    required this.lastMessageTime,
    required this.lastMessage,
    required this.participantIds,
  });

  factory Conversation.fromJson(Map<String, dynamic> json) {
    return Conversation(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      imageUrl: json['imageUrl'],
      lastMessageTime:
          DateTime.tryParse(json['lastMessageTime'] ?? '') ?? DateTime.now(),
      lastMessage: json['lastMessage'] ?? '',
      participantIds: List<String>.from(json['participantIds'] ?? []),
    );
  }
}

class SendMessageRequest {
  final String conversationId;
  final String content;
  final String? imageUrl;

  SendMessageRequest({
    required this.conversationId,
    required this.content,
    this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'conversationId': conversationId,
      'content': content,
      'imageUrl': imageUrl,
    };
  }
}
