import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/constants/legacy_constants/portfolio_constants.dart';
import 'package:portfolio/model/legacy_models/chat_model.dart';
import 'package:portfolio/utilities/extensions.dart';

final chatProvider = NotifierProvider<ChatNotifier, List<ChatModel>>(
  ChatNotifier.new,
);

final loadingResponseProvider = NotifierProvider<LoadingNotifier, bool>(
  LoadingNotifier.new,
);

class LoadingNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  void set(bool value) => state = value;
}

class ChatNotifier extends Notifier<List<ChatModel>> {
  final ScrollController scrollController = ScrollController();

  @override
  List<ChatModel> build() => [];

  List<Map<String, String>> generateHistory({List<ChatModel>? chat}) {
    final chats = (chat ?? state)
        .where((chat) => !chat.error)
        .toList()
        .reversed
        .take(3)
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
      ref.read(loadingResponseProvider.notifier).set(true);
      final response = await http.post(
        Uri.parse(chatAPIEndpointURL),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          {
            'query': query,
            'history': [],
          },
        ),
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        state = [
          ...state,
          ChatModel(
            role: Role.ai,
            message: responseBody['response'],
          ),
        ];
      } else {
        state = [
          ...state,
          ChatModel(
            role: Role.ai,
            message:
                'Whoa, too many questions! 🫠 My brain needs a quick breather. Try again later?\n(Rate Limit reached for free tier)',
            error: true,
          ),
        ];
      }
    } catch (e) {
      final updated = [...state];
      updated[updated.length - 1].error = true;
      state = updated;
    } finally {
      ref.read(loadingResponseProvider.notifier).set(false);
      scrollController.animateTo(
        0,
        duration: 500.milliseconds,
        curve: Curves.easeIn,
      );
    }
  }

  void askQuestion(
    String query, {
    bool regenerate = false,
  }) {
    if (!regenerate) {
      state = [
        ...state.where((chat) => !chat.error),
        ChatModel(
          role: Role.human,
          message: query,
        ),
      ];
      scrollController.animateTo(
        0,
        duration: 1000.milliseconds,
        curve: Curves.easeIn,
      );
    }
    final updated = [...state];
    updated[updated.length - 1].error = false;
    state = updated;
    callApi(
      query,
      regenerate: regenerate,
    );
  }
}
