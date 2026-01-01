import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/model/chat.dart';
import 'package:portfolio/repositories/chat_repository.dart';
import 'package:portfolio/utilities/extensions.dart';
import 'package:portfolio/utilities/utils.dart';
import 'package:portfolio/widgets/new_widgets/gradient_text.dart';

part 'chat_bubble/ai_chat_bubble.dart';
part 'chat_bubble/error_bubble.dart';
part 'chat_bubble/human_chat_bubble.dart';
part 'chat_bubble/thinking_bubble.dart';
part 'chat_recommendation.dart';
part 'chat_text_field.dart';
part 'chat_view.dart';
part 'chat_window.dart';

class ChatComponent extends StatefulWidget {
  const ChatComponent({super.key});

  @override
  State<ChatComponent> createState() => _ChatComponentState();
}

class _ChatComponentState extends State<ChatComponent> {
  final ChatRepository _chatRepo = ChatRepository.instance;
  bool _hasStartedChat = false;

  @override
  void initState() {
    super.initState();
    _chatRepo.state.addListener(_onChatStateChanged);
    if (_chatRepo.state.value.messages.isNotEmpty) {
      _hasStartedChat = true;
    }
  }

  @override
  void dispose() {
    _chatRepo.state.removeListener(_onChatStateChanged);
    super.dispose();
  }

  void _onChatStateChanged() {
    if (!_hasStartedChat && _chatRepo.state.value.messages.isNotEmpty) {
      setState(() => _hasStartedChat = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return SizedBox(
      height: context.height - Sizes.navBarHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!_hasStartedChat) ...[
            SizedBox(
              width: context.width * 0.9,
              child: Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                children: [
                  Text(
                    'How can I ',
                    style: Styles.headlineTextBold(
                      textColor: colors.textColor,
                      isMobile: context.isMobile,
                    ),
                  ),
                  GradientText(
                    text: 'Help You',
                    textStyle: Styles.headlineTextBold(
                      isMobile: context.isMobile,
                    ),
                  ),
                  Text(
                    ' Today?',
                    style: Styles.headlineTextBold(
                      textColor: colors.textColor,
                      isMobile: context.isMobile,
                    ),
                  ),
                ],
              ),
            ),
            Gap(Sizes.spacingMedium),
            SizedBox(
              width: context.width * (context.isMobile ? 0.9 : 0.4),
              child: Text(
                'Ask me about Yashas\'s experience, specific projects, technical skills, or just say hello.',
                style: Styles.subText(
                  textColor: colors.textSecondary,
                  isMobile: context.isMobile,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Gap(Sizes.spacingXXL),
          ],
          Flexible(child: ChatWindow()),
          Gap(Sizes.spacingRegular)
        ],
      ),
    );
  }
}
