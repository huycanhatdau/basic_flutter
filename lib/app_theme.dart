import 'import.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff064681),
      brightness: Brightness.light,
      primary: const Color(0xff064681),
      onPrimary: Colors.white,
    ),
    brightness: Brightness.light,
    primaryColor: const Color(0xff064681),
    cardTheme: const CardTheme(color: Colors.white),
    scaffoldBackgroundColor: Colors.white,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xff064681),
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: Color(0xff064681),
      unselectedLabelColor: Colors.black,
      indicatorColor: Color(0xff064681),
      labelStyle: TextStyle(fontWeight: FontWeight.w600, color: AppColors.grey90),
      dividerHeight: 1.0,
      labelPadding: EdgeInsets.symmetric(vertical: 12),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(
          color: Color(0xffD0D5DD),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(
          color: Color(0xffD0D5DD),
        ),
      ),
      hintStyle: const TextStyle(
        color: Color(0xffCAD0D4),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      labelStyle: const TextStyle(color: Colors.black54),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(elevation: 1),
    fontFamily: 'Inter',
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black87,
      elevation: 1,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return const Color(0xff064681);
        }
        return Colors.white;
      }),
      splashRadius: 8,
      side: const BorderSide(color: Colors.grey),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(const EdgeInsets.all(10)),
        backgroundColor: WidgetStateProperty.all(const Color(0xff064681)),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        textStyle: WidgetStateProperty.all<TextStyle>(
          const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
          padding: WidgetStateProperty.all(const EdgeInsets.all(8)),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              side: const BorderSide(
                color: Color(0xff064681),
              ),
            ),
          ),
          side: WidgetStateProperty.resolveWith<BorderSide?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) return null;
              return const BorderSide(
                color: Color(0xff064681),
              );
              // Defer to the widget's default.
            },
          ),
          textStyle: WidgetStateProperty.all<TextStyle>(const TextStyle(
              color: Color(0xff064681), fontSize: 15, fontWeight: FontWeight.w500),),),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return const Color(0xff064681);
        }
        return null;
      }),
      trackColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return const Color(0xff064681);
        }
        return null;
      }),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return const Color(0xff064681);
        }
        return null;
      }),
    ),
    highlightColor: Colors.red.withOpacity(0.05),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    colorScheme:
        ColorScheme.fromSeed(seedColor: const Color(0xff064681), brightness: Brightness.dark),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Color(0xff064681)),
    fontFamily: 'Inter',
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.black.withOpacity(0.77),
    brightness: Brightness.dark,
    bottomAppBarTheme: const BottomAppBarTheme(color: Color(0xff064681)),
    tabBarTheme: const TabBarTheme(
      labelColor: Color(0xff064681),
      unselectedLabelColor: Colors.black,
      indicatorColor: Color(0xff064681),
      labelStyle: TextStyle(fontWeight: FontWeight.w600),
      dividerHeight: 1.0,
      labelPadding: EdgeInsets.symmetric(vertical: 12),
    ),
    // indicatorColor: Color(0xffC2243E),
  );
}
