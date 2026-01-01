part of 'chat_component.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});

  final ChatRepository _chatRepo = ChatRepository.instance;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _chatRepo.state,
      builder: (_, state, ___) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: Sizes.spacingRegular,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.topCenter,
              child: ListView.builder(
                physics: BouncingScrollPhysics().applyTo(
                  ClampingScrollPhysics(),
                ),
                controller: _chatRepo.scrollController,
                padding: EdgeInsets.zero,
                itemCount: state.messages.length,
                itemBuilder: (_, index) {
                  final message = state.messages[index];
                  final bubbleAlignment = message.role == Role.ai
                      ? Alignment.centerLeft
                      : Alignment.centerRight;
                  final child = Container(
                    width: double.infinity,
                    alignment: bubbleAlignment,
                    child: message.role == Role.ai
                        ? AiChatBubble(text: message.content)
                        : HumanChatBubble(text: message.content),
                  );
                  final isLast = state.messages.length - 1 == index;
                  if (state.isStateError && isLast) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        child,
                        if (state.errorMessage != null)
                          ErrorBubble(
                            text: state.errorMessage!,
                            onRegenerate: _chatRepo.regenerateResponse,
                          ),
                        if (state.isLoading) ThinkingBubble(),
                      ],
                    );
                  } else {
                    return child;
                  }
                },
              ),
            ),
          ),
          ChatTextField(
            onSend: _chatRepo.askQuestion,
            disableSend: state.isLoading,
          ),
        ],
      ),
    );
  }
}
