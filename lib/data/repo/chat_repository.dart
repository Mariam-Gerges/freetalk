import 'package:freetalk/core/network/api_endpoints.dart';
import 'package:freetalk/core/network/api_service.dart';
import 'package:freetalk/data/model/chat_model.dart';

class ChatRepository {
  final ApiService apiService;

  ChatRepository(this.apiService);

  // ========== Get Chat History ==========
  Future<List<ChatMessage>> getChatHistory({
    required String conversationId,
    int page = 1,
    int limit = 50,
  }) async {
    final messages = await apiService.get<List<ChatMessage>>(
      endpoint: '${ApiEndpoints.chatHistory}/$conversationId',
      queryParams: {'page': page, 'limit': limit},
      fromJson: (json) {
        if (json is List) {
          return json.map((e) => ChatMessage.fromJson(e)).toList();
        }
        return [];
      },
    );

    return messages;
  }

  // ========== Get Conversations ==========
  Future<List<Conversation>> getConversations() async {
    final conversations = await apiService.get<List<Conversation>>(
      endpoint: ApiEndpoints.getChatConversations,
      fromJson: (json) {
        if (json is List) {
          return json.map((e) => Conversation.fromJson(e)).toList();
        }
        return [];
      },
    );

    return conversations;
  }

  // ========== Send Message ==========
  Future<ChatMessage> sendMessage({
    required String conversationId,
    required String content,
    String? imageUrl,
  }) async {
    final message = await apiService.post<ChatMessage>(
      endpoint: ApiEndpoints.sendMessage,
      data: SendMessageRequest(
        conversationId: conversationId,
        content: content,
        imageUrl: imageUrl,
      ).toJson(),
      fromJson: (json) => ChatMessage.fromJson(json),
    );

    return message;
  }

  // ========== Edit Message ==========
  Future<ChatMessage> editMessage({
    required String messageId,
    required String newContent,
  }) async {
    final message = await apiService.put<ChatMessage>(
      endpoint: '${ApiEndpoints.editMessage}/$messageId',
      data: {'content': newContent},
      fromJson: (json) => ChatMessage.fromJson(json),
    );

    return message;
  }

  // ========== Delete Message ==========
  Future<void> deleteMessage(String messageId) async {
    await apiService.delete<Map<String, dynamic>>(
      endpoint: '${ApiEndpoints.deleteMessage}/$messageId',
      fromJson: (json) => json,
    );
  }
}
