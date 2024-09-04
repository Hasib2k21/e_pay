
import 'package:e_pay/presentation/ui/screens/splash_screen.dart';
import 'package:e_pay/presentation/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class EpayApp extends StatelessWidget {
  const EpayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData(
        colorSchemeSeed: AppColors.themeColor,
        scaffoldBackgroundColor: Colors.white,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.themeColor,
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
        ),
        inputDecorationTheme: InputDecorationTheme(

          border: _outlineInputBorder(),
          enabledBorder: _outlineInputBorder(),
          focusedBorder: _outlineInputBorder(),
          errorBorder: _outlineInputBorder(Colors.red),
          contentPadding:

          const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.themeColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              textStyle: const TextStyle(fontSize: 16),
              fixedSize: const Size.fromWidth(130)),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              foregroundColor: AppColors.themeColor,
              textStyle: const TextStyle(fontSize: 16)),
        ),
      ),
    );
  }

  OutlineInputBorder _outlineInputBorder([Color? color]) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color ?? AppColors.themeColor, width: 1),
      borderRadius: BorderRadius.circular(8),

    );
  }
}