part of '../chat_component.dart';

class ThinkingBubble extends StatefulWidget {
  const ThinkingBubble({super.key});

  @override
  State<ThinkingBubble> createState() => _ThinkingBubbleState();
}

class _ThinkingBubbleState extends State<ThinkingBubble>
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
    final colors = context.colors;

    return Container(
      padding: Sizes.paddingRegular,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Sizes.spacingSmall),
          topRight: Radius.circular(Sizes.spacingSmall),
          bottomRight: Radius.circular(Sizes.spacingSmall),
        ),
        color: colors.secondarySurface,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: Sizes.spacingSmallRegular,
        children: [
          Text(
            'Thinking',
            style: context.isMobile ? Styles.smallText() : Styles.regularText(),
          ),
          ...List.generate(
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
                    height: Sizes.spacingSmall,
                    width: Sizes.spacingSmall,
                    decoration: BoxDecoration(
                      color: colors.textColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
