import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/app_fonts.dart';
import '../../utils/app_sizes.dart';
import '../theme_color/theme_color_light.dart';

ThemeData get getThemeDataLight => ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: ThemeColorLight.primaryColor,
    brightness: Brightness.light,
    primaryIconTheme: const IconThemeData(
      color: ThemeColorLight.black,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ThemeColorLight.white,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark
          .copyWith(statusBarColor: ThemeColorLight.white),
      iconTheme: const IconThemeData(color: ThemeColorLight.black),
    ),
    fontFamily: AppFonts.fontFamily,
    textTheme: getTextTheme(),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ThemeColorLight.primaryColor,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: ThemeColorLight.black,
      labelStyle: const TextStyle(
          fontWeight: AppFonts.semiBlod,
          fontSize: 16,
          fontFamily: AppFonts.fontFamily),
      unselectedLabelStyle: const TextStyle(
          fontWeight: AppFonts.semiBlod,
          fontSize: 16,
          fontFamily: AppFonts.fontFamily),
      unselectedLabelColor: ThemeColorLight.grey,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: CircleTabInicator(
        color: ThemeColorLight.primaryColor,
        radius: AppSizes.br4,
      ),
    ));

getTextTheme() => TextTheme(
      /// Grey Light --> Dark
      displaySmall: TextStyle(
        color: ThemeColorLight.white,
        fontSize: AppSizes.fs16,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamily,
      ),
      displayMedium: TextStyle(
        color: ThemeColorLight.white,
        fontSize: AppSizes.fs26,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamily,
      ),
      displayLarge: TextStyle(
        color: ThemeColorLight.grayscaleBold,
        fontSize: AppSizes.fs32,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamily,
      ),

      headlineLarge: TextStyle(
        color: ThemeColorLight.grayscale,
        fontSize: AppSizes.fs48,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamily,
      ),
      headlineMedium: TextStyle(
        color: ThemeColorLight.white,
        fontSize: AppSizes.fs24,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamily,
      ),
      headlineSmall: TextStyle(
        color: ThemeColorLight.grayscale,
        fontSize: AppSizes.fs24,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamily,
      ),

      /// Body For Text in Buttons
      bodySmall: TextStyle(
        color: ThemeColorLight.black,
        fontSize: AppSizes.fs16,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamily,
      ),
      bodyMedium: TextStyle(
        color: ThemeColorLight.black,
        fontSize: AppSizes.fs18,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamily,
      ),
      bodyLarge: TextStyle(
        color: ThemeColorLight.black,
        fontSize: AppSizes.fs24,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamily,
      ),

      /// Title
      titleSmall: TextStyle(
        color: ThemeColorLight.black,
        fontSize: AppSizes.fs11,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamily,
      ),

      /// black in light -- white in dark
      titleMedium: TextStyle(
        color: ThemeColorLight.primaryColor,
        fontSize: AppSizes.fs28,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamily,
      ),
      titleLarge: TextStyle(
        color: ThemeColorLight.black,
        fontSize: AppSizes.fs37,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamily,
      ),

      /// Label For (Text , Button) With Color Grey
      labelSmall: TextStyle(
        color: ThemeColorLight.grayscale,
        fontSize: AppSizes.fs16,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamily,
      ),

      labelMedium: TextStyle(
        color: ThemeColorLight.black,
        fontSize: AppSizes.fs16,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamily,
      ),

      /// AppBar
      labelLarge: TextStyle(
        color: ThemeColorLight.primaryColor,
        fontSize: AppSizes.fs20,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamily,
      ),
    );

class CircleTabInicator extends Decoration {
  final Color color;
  final double radius;

  const CircleTabInicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  final double radius;

  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    Offset circleOffset = Offset(configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
