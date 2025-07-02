part of '../custom_scaffold.dart';

class MobileScaffold extends ConsumerWidget {
  MobileScaffold({
    super.key,
    required this.child,
  });

  final Widget child;
  final advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);
    final pageIndex = ref.watch(pageIndexProvider);

    return AdvancedDrawer(
      controller: advancedDrawerController,
      animationDuration: 600.milliseconds,
      backdropColor: Theme.of(context).colorScheme.secondary,
      animationCurve: Curves.easeInOut,
      drawer: MobileNavItem(
        advancedDrawerController: advancedDrawerController,
        initialIndex: currentIndex,
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        appBar: mobileAppBar(
          context,
          advancedDrawerController,
        ),
        body: SizedBox(
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
    );
  }
}
