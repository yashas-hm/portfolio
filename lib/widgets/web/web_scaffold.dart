part of '../custom_scaffold.dart';

class WebScaffold extends ConsumerWidget {
  const WebScaffold({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(pageIndexProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: webAppBar(context),
      body: Stack(
        children: [
          if (pageIndex == homeIndex) const FollowMouse(),
          MouseRegion(
            opaque: false,
            child: SizedBox(
              height: context.height,
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    child,
                    if (pageIndex != homeIndex) const BottomBar(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
