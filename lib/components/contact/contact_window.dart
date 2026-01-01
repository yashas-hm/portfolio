part of 'contact_component.dart';

class ContactWindow extends StatefulWidget {
  const ContactWindow({super.key});

  @override
  State<ContactWindow> createState() => _ContactWindowState();
}

class _ContactWindowState extends State<ContactWindow> {
  final _formKey = GlobalKey<FormState>();

  ContactRequest _request = ContactRequest.empty();
  bool _loading = false;
  String _message = 'waiting for input ...';

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      width: context.width * (context.isMobile ? 0.9 : 0.45),
      constraints: BoxConstraints(
        minWidth: 500,
      ),
      child: WindowContainer(
        headline: '~/contact/compose.sh',
        headlineIcon: FontAwesomeIcons.solidEnvelope,
        bottomText: _message,
        content: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: Sizes.paddingLarge,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: Sizes.spacingLarge,
                  children: [
                    LayoutBuilder(builder: (_, constraints) {
                      final fieldWidth = context.isMobile
                          ? constraints.maxWidth
                          : (constraints.maxWidth - Sizes.spacingLarge) / 2;

                      return Wrap(
                        alignment: WrapAlignment.center,
                        runAlignment: WrapAlignment.center,
                        spacing: Sizes.spacingLarge,
                        runSpacing: Sizes.spacingLarge,
                        children: [
                          SizedBox(
                            width: fieldWidth,
                            child: ContactTextField(
                              hintText: 'John Doe',
                              label: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Name ',
                                      style: Styles.mediumTextBold(
                                        textColor: colors.textColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '(Optional)',
                                      style: Styles.regularText(
                                        textColor: colors.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              inputType: TextInputType.emailAddress,
                              prefixIcon: FontAwesomeIcons.person,
                              onChanged: (value) {
                                if (value != null && value.trim().isNotEmpty) {
                                  _request =
                                      _request.copyWith(name: value.trim());
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            width: fieldWidth,
                            child: ContactTextField(
                              hintText: 'name@email.com',
                              label: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Email ',
                                      style: Styles.mediumTextBold(
                                        textColor: colors.textColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '(Required)',
                                      style: Styles.regularText(
                                        textColor: colors.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              inputType: TextInputType.multiline,
                              prefixIcon: FontAwesomeIcons.solidEnvelope,
                              validator: (value) {
                                if (value != null) {
                                  final val = value.trim();
                                  if (val.isEmpty) {
                                    return 'Email cannot be empty';
                                  } else if (!val.isEmail) {
                                    return 'Invalid Email';
                                  }
                                }

                                return null;
                              },
                              onChanged: (value) {
                                if (value != null && value.trim().isNotEmpty) {
                                  _request =
                                      _request.copyWith(email: value.trim());
                                }
                              },
                            ),
                          ),
                        ],
                      );
                    }),
                    ContactTextField(
                      hintText: 'Type your message here',
                      label: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Message ',
                              style: Styles.mediumTextBold(
                                textColor: colors.textColor,
                              ),
                            ),
                            TextSpan(
                              text: '(Required)',
                              style: Styles.regularText(
                                textColor: colors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      inputType: TextInputType.multiline,
                      minLines: 10,
                      maxLines: 30,
                      validator: (value) {
                        if (value != null) {
                          final val = value.trim();
                          if (val.isEmpty) {
                            return 'Message cannot be empty';
                          }
                        }

                        return null;
                      },
                      onChanged: (value) {
                        if (value != null && value.trim().isNotEmpty) {
                          _request = _request.copyWith(message: value.trim());
                        }
                      },
                    ),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.centerRight,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: _loading
                              ? null
                              : () async {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      _loading = true;
                                      _message = 'Sending message...';
                                    });

                                    final response = await ContactRepository
                                        .sendEmailRequest(
                                      _request,
                                    );

                                    if (context.mounted) {
                                      Utils.showToast(
                                        context,
                                        response.message,
                                        response.success,
                                      );
                                    }

                                    setState(() {
                                      _loading = false;
                                      _message = response.success
                                          ? 'Message sent successfully'
                                          : 'Error Sending message';
                                    });
                                  }
                                },
                          child: Container(
                            padding: Sizes.paddingRegular,
                            decoration: BoxDecoration(
                              color: _loading
                                  ? colors.textSecondary
                                  : colors.primaryColor,
                              borderRadius: Sizes.borderRadiusSmall,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: Sizes.spacingRegular,
                              children: [
                                Text(
                                  'Send Message',
                                  style: Styles.extraSmallTextBold(
                                    textColor: colors.onPrimary,
                                  ),
                                ),
                                Icon(
                                  FontAwesomeIcons.solidPaperPlane,
                                  size: Sizes.iconSmall,
                                  color: colors.onPrimary,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            if (_loading) ...[
              Positioned.fill(
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 10,
                      sigmaY: 10,
                    ),
                    child: Container(
                      color: KnownColors.transparent,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: Sizes.iconLarge,
                height: Sizes.iconLarge,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(colors.textColor),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
