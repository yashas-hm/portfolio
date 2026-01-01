import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/data/links.dart';
import 'package:portfolio/model/contact.dart';
import 'package:portfolio/repositories/contact_repository.dart';
import 'package:portfolio/utilities/extensions.dart';
import 'package:portfolio/utilities/utils.dart';
import 'package:portfolio/widgets/new_widgets/text/gradient_text.dart';
import 'package:portfolio/widgets/new_widgets/text/subtext.dart';
import 'package:portfolio/widgets/new_widgets/window_container.dart';

part 'contact_connections.dart';
part 'contact_text_field.dart';
part 'contact_window.dart';

class ContactComponent extends StatelessWidget {
  const ContactComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: context.width * 0.9,
          child: Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            children: [
              Text(
                'Let\'s Build ',
                style: Styles.headlineTextBold(
                  textColor: colors.textColor,
                  isMobile: context.isMobile,
                ),
              ),
              GradientText(
                text: 'Something',
                textStyle: Styles.headlineTextBold(
                  isMobile: context.isMobile,
                ),
              ),
              Text(
                ' Intelligent!',
                style: Styles.headlineTextBold(
                  textColor: colors.textColor,
                  isMobile: context.isMobile,
                ),
              ),
            ],
          ),
        ),
        Gap(Sizes.spacingMedium),
        Subtext(
          'Initiate a connection protocol. Whether it\'s a project inquiry or a technical discussion, fill out the terminal inputs below to transmit your message.',
        ),
        Gap(Sizes.spacingXXL),
        Container(
          constraints: BoxConstraints(
            maxWidth: context.width * 0.9,
          ),
          child: Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            spacing: Sizes.spacingLarge,
            runSpacing: Sizes.spacingLarge,
            children: [
              ContactWindow(),
              ContactConnections(),
            ],
          ),
        ),
      ],
    );
  }
}
