import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/utilities/extensions.dart';


class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({
    super.key,
    this.title,
    this.description,
  });

  final String? title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        height: context.height,
        width: context.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title ?? '404',
              style: TextStyle(
                fontSize: context.isMobile ? 160 : 180,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              description ??
                  'Oops! Looks like this page took a vacation without telling anyone.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: context.isMobile ? 20 : 30,
              ),
            ),
            Gap(10),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                // onTap: () => updateIndex(context, ref, homeIndex),
                child: Text(
                  'Try the homepage?',
                  style: TextStyle(
                    fontSize: context.isMobile ? 18 : 26,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
