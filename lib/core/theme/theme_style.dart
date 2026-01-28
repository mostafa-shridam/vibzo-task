import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';

const MaterialColor graySwatch = MaterialColor(0XFF000000, {
  50: Color(0xFFFFFAF5),
  100: Color(0xFFFFF2E0),
  200: Color(0xFFFFE6C7),
  300: Color(0xFFFFD199),
  400: Color(0xFFFFB366),
  500: Color(0xFF241407),
  600: Color(0xFF170D05),
  700: Color(0xFF0F0803),
  800: Color(0xFF080401),
  900: Color(0xFF030100),
});
ThemeData getLightTheme({String fontFamily = 'Lexend'}) {
  return _buildTheme(
    brightness: Brightness.light,
    baseColor: graySwatch.shade900,
    backgroundColor: AppColors.white,
    surfaceColor: AppColors.white,
    dividerColor: AppColors.dividerColor,
    iconColor: graySwatch.shade600,
    navLabelColor: graySwatch.shade900,
    navUnselectedColor: graySwatch.shade600,
    overlayBrightness: Brightness.dark,
    fontFamily: fontFamily,
  );
}

ThemeData getDarkTheme({String fontFamily = 'Lexend'}) {
  return _buildTheme(
    brightness: Brightness.dark,
    baseColor: graySwatch.shade50,
    backgroundColor: graySwatch.shade900,
    surfaceColor: graySwatch.shade800,
    dividerColor: AppColors.dividerColor,
    iconColor: AppColors.primaryColor,
    navLabelColor: graySwatch.shade100,
    navUnselectedColor: graySwatch.shade300,
    overlayBrightness: Brightness.light,
    fontFamily: fontFamily,
  );
}

ThemeData _buildTheme({
  required Brightness brightness,
  required Color baseColor,
  required Color backgroundColor,
  required Color surfaceColor,
  required Color dividerColor,
  required Color iconColor,
  required Color navLabelColor,
  required Color navUnselectedColor,
  required Brightness overlayBrightness,
  required String fontFamily,
}) {
  final textTheme = TextTheme(
    displayLarge: TextStyle(
      color: baseColor,
      fontSize: 48,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily,
    ),
    displayMedium: TextStyle(
      color: baseColor,
      fontSize: 28,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily,
    ),
    displaySmall: TextStyle(
      color: baseColor,
      fontSize: 24,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily,
    ),
    titleLarge: TextStyle(
      color: baseColor,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily,
    ),
    titleMedium: TextStyle(
      color: baseColor,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily,
    ),
    titleSmall: TextStyle(
      color: baseColor,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily,
    ),
    bodyLarge: TextStyle(
      color: baseColor,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily,
    ),
    bodyMedium: TextStyle(
      color: baseColor,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily,
    ),
    bodySmall: TextStyle(
      color: baseColor,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: fontFamily,
    ),
    labelLarge: TextStyle(
      color: baseColor,
      fontSize: 20,
      fontWeight: FontWeight.w500,
      fontFamily: fontFamily,
    ),
    labelMedium: TextStyle(
      color: baseColor,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      fontFamily: fontFamily,
    ),
    labelSmall: TextStyle(
      color: baseColor,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: fontFamily,
    ),
    headlineLarge: TextStyle(
      color: baseColor,
      fontSize: 30,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily,
    ),
    headlineMedium: TextStyle(
      color: baseColor,
      fontSize: 26,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily,
    ),
    headlineSmall: TextStyle(
      color: baseColor,
      fontSize: 22,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily,
    ),
  );

  return ThemeData(
    useMaterial3: true,
    fontFamily: fontFamily,
    brightness: brightness,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    dividerColor: dividerColor,
    dividerTheme: DividerThemeData(color: dividerColor, thickness: 1),
    colorScheme: ColorScheme(
      brightness: brightness,
      primary: AppColors.primaryColor,
      secondary: AppColors.primaryColor,
      surface: surfaceColor,
      error: AppColors.dangerRed,
      onPrimary: AppColors.white,
      onSecondary: AppColors.white,
      onSurface: baseColor,
      onError: AppColors.white,
    ),
    iconTheme: IconThemeData(color: iconColor, size: 24),
    primaryIconTheme: IconThemeData(color: iconColor, size: 24),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      toolbarHeight: 80,
      actionsIconTheme: IconThemeData(color: iconColor),
      iconTheme: IconThemeData(color: iconColor),
      titleTextStyle: TextStyle(
        color: baseColor,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        fontFamily: fontFamily,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: overlayBrightness,
        statusBarBrightness: overlayBrightness == Brightness.light
            ? Brightness.dark
            : Brightness.light,
        systemNavigationBarColor: baseColor,
        systemNavigationBarIconBrightness: overlayBrightness,
        systemNavigationBarContrastEnforced: true,
        systemNavigationBarDividerColor: baseColor,
        systemStatusBarContrastEnforced: false,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: backgroundColor,
      elevation: 1,
      selectedLabelStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: navLabelColor,
        fontFamily: fontFamily,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: navUnselectedColor,
        fontFamily: fontFamily,
      ),
      selectedItemColor: navLabelColor,
      unselectedItemColor: navUnselectedColor,
      selectedIconTheme: IconThemeData(color: AppColors.primaryColor),
      unselectedIconTheme: IconThemeData(color: navUnselectedColor),
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
    textTheme: textTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.white,
        textStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontFamily: fontFamily,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surfaceColor,
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: dividerColor),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
      labelStyle: TextStyle(
        fontSize: 18,
        color: baseColor,
        fontFamily: fontFamily,
      ),
      hintStyle: TextStyle(fontFamily: fontFamily),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all<Color>(AppColors.primaryColor),
        textStyle: WidgetStateProperty.all<TextStyle>(
          TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontFamily: fontFamily,
          ),
        ),
      ),
    ),
    tooltipTheme: TooltipThemeData(
      textStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: baseColor,
        fontFamily: fontFamily,
      ),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    ),
    expansionTileTheme: ExpansionTileThemeData(
      textColor: AppColors.primaryColor,
      iconColor: AppColors.primaryColor,
      collapsedIconColor: iconColor,
      collapsedTextColor: baseColor,
    ),
    datePickerTheme: DatePickerThemeData(
      weekdayStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: baseColor,
        fontFamily: fontFamily,
      ),
      dayStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: baseColor,
        fontFamily: fontFamily,
      ),
      yearStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: baseColor,
        fontFamily: fontFamily,
      ),
    ),
  );
}
