part of 'theme.dart';

class AppTheme {
  final BuildContext context;

  static final DarkThemeColors darkColors = DarkThemeColors();
  static final LightThemeColors lightColors = LightThemeColors();

  ThemeData get lightTheme => _generateTheme(
        Brightness.light,
        lightColors,
      );

  ThemeData get darkTheme => _generateTheme(
        Brightness.dark,
        darkColors,
      );

  AppTheme(this.context);

  ThemeData _generateTheme(Brightness brightness, ThemeColors colors) =>
      ThemeData(
        primaryColor: colors.primaryColor,
        scaffoldBackgroundColor: colors.backgroundColor,
        textTheme:
            GoogleFonts.jetBrainsMonoTextTheme(Theme.of(context).textTheme)
                .apply(
          bodyColor: colors.textColor,
          displayColor: colors.textColor,
        ),
        fontFamilyFallback: const [
          'roboto',
          'arial',
        ],
        appBarTheme: AppBarTheme(
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarColor: colors.primaryColor,
            statusBarIconBrightness: Brightness.dark,
          ),
          elevation: 0,
          iconTheme: IconThemeData(
            color: colors.textColor,
          ),
          backgroundColor: colors.primaryColor,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: colors.primaryColor,
          primary: colors.primaryColor,
          onPrimary: colors.onPrimary,
          secondary: colors.backgroundColor,
        ),
        iconTheme: IconThemeData(
          color: colors.textColor,
        ),
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: colors.primaryColor.withValues(alpha: 0.3),
        ),
        extensions: [colors],
      );
}
