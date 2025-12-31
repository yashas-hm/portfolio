import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/constants/legacy_constants/portfolio_constants.dart';
import 'package:portfolio/model/chat.dart';
import 'package:portfolio/utilities/extensions.dart';

class ChatRepository {
  ChatRepository._();
  static final ChatRepository instance = ChatRepository._();

  final ValueNotifier<ChatState> state = ValueNotifier(const ChatState());
  final ScrollController scrollController = ScrollController();

  List<Map<String, dynamic>> generateHistory() {
    return state.value.messages
        .where((m) => m.role == Role.human)
        .toList()
        .reversed
        .take(3)
        .map((m) => m.toJson())
        .toList()
        .reversed
        .toList();
  }

  Future<void> _callApi(String query) async {
    try {
      state.value = state.value.copyWith(isLoading: true, clearError: true);

      final response = await http.post(
        Uri.parse(chatAPIEndpointURL),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'query': query,
          'history': [],
        }),
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final aiMessage = ChatMessage(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          role: Role.ai,
          content: responseBody['response'],
          timestamp: DateTime.now(),
        );
        state.value = state.value.copyWith(
          messages: [...state.value.messages, aiMessage],
          isLoading: false,
        );
      } else {
        state.value = state.value.copyWith(
          isLoading: false,
          errorMessage:
              'Whoa, too many questions! 🫠 My brain needs a quick breather. Try again later?\n(Rate Limit reached for free tier)',
        );
      }
    } catch (e) {
      state.value = state.value.copyWith(
        isLoading: false,
        errorMessage: 'Oops! Unexpected error occurred. Regenerate response?',
      );
    } finally {
      scrollController.animateTo(
        0,
        duration: 500.milliseconds,
        curve: Curves.easeIn,
      );
    }
  }

  void askQuestion(String query, {bool regenerate = false}) {
    if (!regenerate) {
      final humanMessage = ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        role: Role.human,
        content: query,
        timestamp: DateTime.now(),
      );
      state.value = state.value.copyWith(
        messages: [...state.value.messages, humanMessage],
        clearError: true,
      );
      scrollController.animateTo(
        0,
        duration: 1000.milliseconds,
        curve: Curves.easeIn,
      );
    }
    _callApi(query);
  }

  String get lastHumanMessage {
    final humans = state.value.messages.where((m) => m.role == Role.human);
    return humans.isNotEmpty ? humans.last.content : '';
  }

  void clearChat() {
    state.value = const ChatState();
  }
}