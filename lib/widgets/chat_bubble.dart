import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/model/chat_model.dart';
import 'package:portfolio/core/utilities/extensions.dart';
import 'package:portfolio/providers/chat_provider.dart';
import 'package:resize/resize.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.chat,
    required this.width,
  });

  final ChatModel chat;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      alignment: chat.role == Role.human
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10.sp,
          vertical: 8.sp,
        ),
        margin: EdgeInsets.only(bottom: 10.sp),
        constraints: BoxConstraints(
          maxWidth: context.isMobile ? width / 1.1 : width / 1.3,
        ),
        decoration: BoxDecoration(
          color: chat.role == Role.human
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8.sp),
        ),
        child: Text(
          chat.message,
          style: TextStyle(
            color: chat.role == Role.human
                ? darkText
                : Theme.of(context).colorScheme.tertiary,
            fontSize: context.isMobile ? 14.sp : 16.sp,
          ),
        ),
      ),
    );
  }
}

class TypingIndicator extends StatefulWidget {
  const TypingIndicator({super.key, required this.width});

  final double width;

  @override
  State<TypingIndicator> createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<TypingIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController animCtr;
  final TweenSequence sequence = TweenSequence(
    [
      TweenSequenceItem(
        tween: Tween(
          begin: Offset.zero,
          end: const Offset(0, -5),
        ).chain(
          CurveTween(
            curve: Curves.easeOut,
          ),
        ),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: const Offset(0, -5),
          end: Offset.zero,
        ).chain(
          CurveTween(
            curve: Curves.easeIn,
          ),
        ),
        weight: 1,
      ),
    ],
  );

  @override
  void initState() {
    animCtr = AnimationController(
      vsync: this,
      duration: 1000.milliseconds,
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    animCtr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      alignment: Alignment.centerLeft,
      child: Container(
        height: 40.sp,
        padding: EdgeInsets.symmetric(
          horizontal: 10.sp,
          vertical: 8.sp,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(13.sp),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 3.sp,
          children: List.generate(
            3,
            (index) {
              final animation = sequence.animate(
                CurvedAnimation(
                  parent: animCtr,
                  curve: Interval(
                    index * 0.33,
                    (index * 0.33) + 0.33,
                  ),
                ),
              );
              return AnimatedBuilder(
                animation: animation,
                builder: (_, __) => Transform.translate(
                  offset: animation.value,
                  child: Container(
                    height: 8.sp,
                    width: 8.sp,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.tertiary,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ErrorBubble extends ConsumerWidget {
  const ErrorBubble({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => ref.read(chatProvider.notifier).askQuestion(
              ref.read(chatProvider).lastHumanMessage,
              regenerate: true,
            ),
        child: Container(
          width: width,
          alignment: Alignment.centerLeft,
          child: Container(
            height: 40.sp,
            padding: EdgeInsets.symmetric(
              horizontal: 10.sp,
              vertical: 8.sp,
            ),
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(13.sp),
            ),
            child: Text(
              'Oops! Unexpected error occurred. Regenerate response?',
              style: TextStyle(
                color: darkText,
                fontSize: context.isMobile ? 14.sp : 16.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
