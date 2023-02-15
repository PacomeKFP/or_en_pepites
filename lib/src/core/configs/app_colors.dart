part of core.configs;

class AppColors {
  final Color primary;
  final Color degradedPrimary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color error;
  final Color onError;

  // final Color black;
  // final Color lightBlack;
  // final Color darkerGrey;
  // final Color darkGrey;
  // final Color grey;
  // final Color lightGrey;
  // final Color whiteSmoke;
  // final Color white;
  final Color gold;

  AppColors.light()
      : background = const Color(0xC7FEFEFE),
        onBackground = const Color(0xFF101010),
        surface = const Color(0xFF888888),
        onSurface = const Color(0xFFFCF5F5),
        secondary = const Color(0xFFBBBBBB),
        onSecondary = const Color(0xFFF0AD03),
        primary = const Color(0xFF101010),
        degradedPrimary = const Color(0xE8D5C7A5),
        onPrimary = const Color(0xFFFCF5F5),
        error = const Color(0xFFD54300),
        onError = const Color(0xFFFBFAF5),
        gold = const Color(0xFF886407);

  //App Colors
  // black = Color(0xFF000000),
  // lightBlack = Color(0xFF101010),
  // darkerGrey = Color(0xFF8F8C8C),
  // darkGrey = Color(0xFF888888),
  // grey = Color(0xFFBBBBBB),
  // lightGrey = Color(0xFFF8F8F8),
  // whiteSmoke = Color(0xFFFCF5F5),
  // white = Color(0xFFFFFFFF),
  // 

  AppColors.dark()
      : background = const Color.fromARGB(197, 52, 52, 52),
        onBackground = const Color.fromARGB(255, 235, 235, 235),
        surface = const Color(0xFF888888),
        onSurface = const Color(0xFFFCF5F5),
        secondary = const Color.fromARGB(255, 139, 139, 139),
        onSecondary = const Color.fromARGB(255, 228, 228, 228),
        primary = const Color.fromARGB(255, 97, 70, 2),
        degradedPrimary = const Color(0xE8D5C7A5),
        onPrimary = const Color(0xFFFCF5F5),
        error = const Color(0xFFD54300),
        onError = const Color(0xFFFBFAF5),
        gold = const Color(0xFF886407);


  // //App Colors
  // black = Color(0xFF000000),
  // lightBlack = Color(0xFF101010),
  // darkerGrey = Color(0xFF8F8C8C),
  // darkGrey = Color(0xFF888888),
  // grey = Color(0xFFBBBBBB),
  // lightGrey = Color(0xFFF8F8F8),
  // whiteSmoke = Color(0xFFFCF5F5),
  // white = Color(0xFFFFFFFF),
  // gold = Color(0xFF886407);
}
