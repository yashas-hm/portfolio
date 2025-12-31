part of 'chat_component.dart';

class ChatTextField extends StatefulWidget {
  const ChatTextField({
    super.key,
    required this.onSend,
    this.disableSend = false,
  });

  final Function(String value) onSend;
  final bool disableSend;

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (widget.disableSend) return;
    if (_controller.text.trim().isEmpty) {
      setState(() => _isError = true);
    } else {
      widget.onSend(_controller.text.trim());
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return KeyboardListener(
      onKeyEvent: (event) {
        if (event is KeyDownEvent &&
            event.logicalKey == LogicalKeyboardKey.enter &&
            !HardwareKeyboard.instance.isShiftPressed) {
          _sendMessage();
        }
      },
      focusNode: FocusNode(),
      child: TextField(
        focusNode: _focusNode,
        controller: _controller,
        style: context.isMobile ? Styles.smallText() : Styles.regularText(),
        onChanged: (value) {
          if (_isError && value.trim().isNotEmpty) {
            setState(() => _isError = false);
          }
        },
        decoration: InputDecoration(
          isDense: true,
          suffixIcon: IconButton(
            onLongPress: () {},
            onPressed: _sendMessage,
            iconSize: context.isMobile ? Sizes.iconSmall : Sizes.iconRegular,
            padding: EdgeInsets.zero,
            icon: Icon(
              FontAwesomeIcons.solidPaperPlane,
              size: context.isMobile ? Sizes.iconSmall : Sizes.iconRegular,
              color: _focusNode.hasFocus
                  ? colors.primaryColor
                  : colors.textSecondary,
            ),
          ),
          hintStyle: context.isMobile
              ? Styles.smallText(textColor: colors.textSecondary)
              : Styles.regularText(textColor: colors.textSecondary),
          counterText: '',
          border: Styles.regularInputBorder(colors.borderColor),
          enabledBorder: Styles.regularInputBorder(colors.borderColor),
          errorBorder: Styles.regularInputBorder(KnownColors.red400),
          focusedBorder: Styles.regularInputBorder(colors.primaryColor),
          contentPadding: EdgeInsets.symmetric(
            vertical:
                context.isMobile ? Sizes.spacingSmall : Sizes.spacingMedium,
            horizontal:
                context.isMobile ? Sizes.spacingXS : Sizes.spacingRegular,
          ),
          fillColor: colors.surfaceColor,
          filled: true,
          errorText: _isError ? 'Field cannot be empty' : null,
          errorStyle:
              (context.isMobile ? Styles.extraSmallText() : Styles.smallText())
                  .copyWith(color: KnownColors.red400),
        ),
        minLines: 1,
        maxLines: 4,
        keyboardType: TextInputType.text,
        cursorColor: colors.primaryColor,
      ),
    );
  }
}
