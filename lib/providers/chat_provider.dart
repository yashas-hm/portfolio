import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/core/model/chat_model.dart';
import 'package:portfolio/core/utilities/extensions.dart';

final StateNotifierProvider<ChatNotifier, List<ChatModel>> chatProvider =
    StateNotifierProvider<ChatNotifier, List<ChatModel>>(
  (ref) => ChatNotifier([], ref),
);

final StateProvider<bool> loadingResponseProvider =
    StateProvider<bool>((_) => false);

class ChatNotifier extends StateNotifier<List<ChatModel>> {
  ChatNotifier(
    super.state,
    this.ref,
  );

  final Ref ref;

  List<Map<String, String>> generateHistory({List<ChatModel>? chat}) {
    final chats = (chat ?? state)
        .where((chat) => !chat.error)
        .toList()
        .reversed
        .take(6)
        .toList()
        .reversed;
    final list = <Map<String, String>>[];
    for (ChatModel chat in chats) {
      list.add(chat.toJson());
    }
    return list;
  }

  void callApi(
    String query, {
    bool regenerate = false,
  }) async {
    try {
      final history = generateHistory();
      ref.read(loadingResponseProvider.notifier).update((_) => true);
      final response = await http.post(
        Uri.parse('https://ask.yashashm.dev/api/prompt'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          {
            'query': query,
            'history': history,
          },
        ),
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        state.add(
          ChatModel(
            role: Role.ai,
            message: responseBody['response'],
          ),
        );
      } else {
        state[state.length - 1].error = true;
      }
    } catch (e) {
      state[state.length - 1].error = true;
    } finally {
      state = [...state];
      ref.read(loadingResponseProvider.notifier).update((_) => false);
    }
  }

  void askQuestion(
    String query, {
    bool regenerate = false,
  }) {
    callApi(
      query,
      regenerate: regenerate,
    );
    if (!regenerate) {
      state.add(
        ChatModel(
          role: Role.human,
          message: query,
        ),
      );

      state = [...(state.where((chat) => !chat.error))];
    }
  }
}
