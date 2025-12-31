import 'package:flutter/material.dart';
import 'package:lava_lamp_effect/lava_lamp_effect.dart';
import 'package:portfolio/components/base_page/base_page.dart';
import 'package:portfolio/components/chat/chat_component.dart';
import 'package:portfolio/utilities/extensions.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      additionalBackground: Center(
        child: LavaLampEffect(
          size: context.screenSize,
          lavaCount: 6,
          color: context.colors.primaryColor.withValues(alpha: 0.5),
          speed: 5,
        ),
      ),
      content: ChatComponent(),
    );
  }
}
