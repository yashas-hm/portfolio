import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/utilities/extensions.dart';
import 'package:portfolio/core/utilities/utils.dart';
import 'package:portfolio/core/utilities/widget_generators.dart';
import 'package:portfolio/providers/chat_provider.dart';
import 'package:portfolio/widgets/custom_scaffold.dart';
import 'package:resize/resize.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final FocusNode _focusNode = FocusNode();
  final tec = TextEditingController();

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      indexCheck(chatIndex, ref);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final chats = ref.watch(chatProvider);
    final loading = ref.watch(loadingResponseProvider);

    return CustomScaffold(
      child: Container(
        padding: EdgeInsets.only(bottom: 15.sp),
        height: context.height,
        width: context.isMobile ? context.width / 1.2 : context.width / 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(75.sp),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Ask ',
                    style: TextStyle(
                      fontSize: context.isMobile ? 20.sp : 30.sp,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  TextSpan(
                    text: 'Yashas',
                    style: TextStyle(
                      fontSize: context.isMobile ? 20.sp : 30.sp,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                ],
              ),
            ),
            Gap(15.sp),
            Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  children: buildChatList(
                    chats,
                    loading,
                    context.isMobile ? context.width / 1.2 : context.width / 2,
                  ),
                ),
              ),
            ),
            Gap(15.sp),
            TextFormField(
              autofocus: true,
              focusNode: _focusNode,
              maxLines: 1,
              maxLength: 300,
              readOnly: loading,
              decoration: InputDecoration(
                labelText: '',
                counterText: '',
                border: outlineBorder(context),
                focusedBorder: outlineBorder(context),
                enabledBorder: outlineBorder(context),
                fillColor: Theme.of(context).colorScheme.secondary,
                suffixIcon: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => sendMessage(),
                    child: Icon(
                      Icons.send_outlined,
                      size: context.isMobile ? 15.sp : 25.sp,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                ),
              ),
              controller: tec,
              onFieldSubmitted: (_) => sendMessage(),
            ),
          ],
        ),
      ),
    );
  }

  void sendMessage() {
    if (tec.text.trim() != '') {
      ref.read(chatProvider.notifier).askQuestion(tec.text);
      tec.clear();
    }
  }
}
