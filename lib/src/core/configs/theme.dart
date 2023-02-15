part of core.configs;

class AppTheme {
  static ThemeData _buildTheme({required Brightness brightness, required AppColors colors}) {
    
    var baseTheme = _buildTextTheme(colors: colors);
    return ThemeData(
      
      brightness: brightness,
      scaffoldBackgroundColor: colors.background,
      textTheme: GoogleFonts.poppinsTextTheme(baseTheme),
      appBarTheme: AppBarTheme(
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: brightness == Brightness.light ? Brightness.dark : Brightness.light,
        ),
        backgroundColor: Colors.transparent,
      ),
      drawerTheme: DrawerThemeData(backgroundColor: colors.background),
      cardColor: colors.background,
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: colors.background),
      dialogTheme: DialogTheme(backgroundColor: colors.background),
      primaryColor: colors.primary,
      colorScheme: ColorScheme(
        background: colors.background,
        onBackground: colors.onBackground,
        primary: colors.primary,
        onPrimary: colors.onPrimary,
        surface: colors.surface,
        onSurface: colors.onSurface,
        secondary: colors.secondary,
        onSecondary: colors.onSecondary,
        error: colors.error,
        brightness: brightness,
        onError: colors.onError,
        shadow: Colors.black,
      ),
    );
  }

  static TextTheme _buildTextTheme({required AppColors colors}) {
    return const TextTheme();
  }

  

  static final ThemeData lightTheme = _buildTheme(
    brightness: Brightness.light,
    colors: AppColors.light(),
  );

  static final ThemeData darkTheme = _buildTheme(
    brightness: Brightness.dark,
    colors: AppColors.dark(),
  );
}

