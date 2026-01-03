part of 'contact_component.dart';

class ContactTextField extends StatefulWidget {
  const ContactTextField({
    super.key,
    required this.onChanged,
    this.hintText,
    this.validator,
    this.label,
    this.prefixIcon,
    this.autofillHints,
    this.inputType = TextInputType.text,
    this.minLines = 1,
    this.maxLines = 1,
  });

  final String? hintText;
  final TextInputType inputType;
  final int minLines;
  final int maxLines;
  final Function(String? value) onChanged;
  final FormFieldValidator<String>? validator;
  final Widget? label;
  final IconData? prefixIcon;
  final List<String>? autofillHints;

  @override
  State<ContactTextField> createState() => _ContactTextFieldState();
}

class _ContactTextFieldState extends State<ContactTextField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: Sizes.spacingRegular,
      children: [
        if (widget.label != null) widget.label!,
        TextFormField(
          focusNode: _focusNode,
          autofillHints: widget.autofillHints,
          style: Styles.regularText(),
          validator: widget.validator,
          onChanged: widget.onChanged,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon != null
                ? Icon(
                    widget.prefixIcon ?? FontAwesomeIcons.keyboard,
                    size: Sizes.iconRegular,
                    color: _focusNode.hasFocus
                        ? colors.primaryColor
                        : colors.textSecondary,
                  )
                : null,
            hintText: widget.hintText,
            hintStyle: Styles.regularText(textColor: colors.textSecondary),
            counterText: '',
            border: Styles.regularInputBorder(colors.borderColor),
            enabledBorder: Styles.regularInputBorder(colors.borderColor),
            errorBorder: Styles.regularInputBorder(KnownColors.red400),
            focusedBorder: Styles.regularInputBorder(colors.primaryColor),
            contentPadding: EdgeInsets.symmetric(
              vertical: Sizes.spacingMedium,
              horizontal: Sizes.spacingRegular,
            ),
            alignLabelWithHint: true,
            fillColor: colors.surfaceColor,
            hoverColor: colors.surfaceColor,
            focusColor: colors.surfaceColor,
            filled: true,
            errorStyle: Styles.smallText(textColor: KnownColors.red400),
          ),
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          keyboardType: widget.inputType,
          cursorColor: colors.primaryColor,
        ),
      ],
    );
  }
}
