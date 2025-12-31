import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:lava_lamp_effect/lava_lamp_effect.dart';
import 'package:portfolio/constants/constants.dart' show KnownColors;
import 'package:portfolio/constants/legacy_constants/portfolio_constants.dart';
import 'package:portfolio/constants/legacy_constants/portfolio_data.dart';
import 'package:portfolio/model/chat.dart';
import 'package:portfolio/model/legacy_models/project_model.dart';
import 'package:portfolio/repositories/chat_repository.dart';
import 'package:portfolio/utilities/extensions.dart';
import 'package:portfolio/utilities/widget_generators.dart';
import 'package:portfolio/widgets/chat_bubble.dart';
import 'package:portfolio/widgets/custom_scaffold.dart';
import 'package:resize/resize.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _chatRepo = ChatRepository.instance;
  final FocusNode _focusNode = FocusNode();
  final tec = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Stack(
        children: [
          Center(
            child: LavaLampEffect(
              size: Size(
                context.width,
                context.height,
              ),
              lavaCount: 5,
              color: KnownColors.blue300,
            ),
          ),
          Center(
            child: SizedBox(
              height: context.height,
              width: context.isMobile ? context.width / 1.1 : context.width / 2,
              child: ValueListenableBuilder<ChatState>(
                valueListenable: _chatRepo.state,
                builder: (context, state, _) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ...buildHeading(),
                      Expanded(
                        child: Container(
                          alignment: Alignment.topCenter,
                          child: ListView(
                            controller: _chatRepo.scrollController,
                            shrinkWrap: true,
                            reverse: true,
                            padding: EdgeInsets.zero,
                            children: buildChatList(
                              state,
                              context.isMobile
                                  ? context.width / 1.2
                                  : context.width / 2,
                            ),
                          ),
                        ),
                      ),
                      ...buildChatText(state.isLoading),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildChatList(ChatState state, double width) {
    final list = <Widget>[];
    for (ChatMessage chat in state.messages.reversed) {
      list.add(
        ChatBubble(
          key: ValueKey(chat.id),
          chat: chat,
          width: width,
        ),
      );
    }
    if (state.isLoading) {
      list.insert(
        0,
        TypingIndicator(width: width),
      );
    }
    if (state.errorMessage != null && !state.isLoading) {
      list.insert(
        0,
        ErrorBubble(
          width: width,
          message: state.errorMessage!,
        ),
      );
    }
    return list;
  }

  void sendMessage() {
    if (tec.text.trim() != '') {
      _chatRepo.askQuestion(tec.text);
      tec.clear();
    }
  }

  List<Widget> buildHeading() {
    return [
      Gap(context.isMobile ? 65.sp : 45.sp),
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
      Gap(5.sp),
      Text(
        'It knows my story',
        style: TextStyle(
          fontSize: context.isMobile ? 12.sp : 18.sp,
        ),
      ),
      Gap(15.sp),
    ];
  }

  Widget getRecommendations() {
    return SizedBox(
      height: context.isMobile ? 20.sp : 30.sp,
      width: context.isMobile ? context.width / 1.1 : context.width / 2,
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: chatRecommendations.length + 1,
        itemBuilder: (_, index) => index == 0
            ? MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => launchUrlString(
                    projectsList
                        .getByIdentifier<ProjectModel>('ask-yashas')
                        .link,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.sp),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.sp,
                      vertical: 3.sp,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          github,
                          height: context.isMobile ? 10.sp : 15.sp,
                          width: context.isMobile ? 10.sp : 15.sp,
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.tertiary,
                            BlendMode.srcIn,
                          ),
                        ),
                        Gap(5.sp),
                        Text(
                          'Source Code',
                          style: TextStyle(
                            fontSize: context.isMobile ? 11.sp : 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => _chatRepo.askQuestion(chatRecommendations[index - 1]),
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 10.sp,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.sp),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.sp,
                      vertical: 3.sp,
                    ),
                    child: Text(
                      chatRecommendations[index - 1],
                      style: TextStyle(
                        fontSize: context.isMobile ? 11.sp : 16.sp,
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  List<Widget> buildChatText(bool loading) {
    return [
      Gap(15.sp),
      getRecommendations(),
      Gap(5.sp),
      Hero(
        tag: 'heroChat',
        child: KeyboardListener(
          focusNode: FocusNode(),
          onKeyEvent: (event) {
            if (event is KeyDownEvent &&
                event.logicalKey == LogicalKeyboardKey.enter &&
                !HardwareKeyboard.instance.isShiftPressed) {
              if (!loading) {
                sendMessage();
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  tec.clear();
                });
              }
            }
          },
          child: TextFormField(
            controller: tec,
            focusNode: _focusNode,
            autofocus: false,
            minLines: 1,
            maxLines: 5,
            maxLength: 300,
            decoration: InputDecoration(
              labelText: '',
              counterText: '',
              border: outlineBorder(context),
              focusedBorder: outlineBorder(context),
              enabledBorder: outlineBorder(context),
              suffixIcon: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: loading ? () {} : () => sendMessage(),
                  child: Icon(
                    Icons.send_outlined,
                    size: context.isMobile ? 15.sp : 25.sp,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      Gap(15.sp),
    ];
  }
}