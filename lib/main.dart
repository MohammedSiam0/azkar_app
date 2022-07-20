import 'package:azkar_app/screens/home_screen.dart';
import 'package:azkar_app/screens/info_screen.dart';
import 'package:azkar_app/screens/launch_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        // وظيفتها التحكم في ادارة محتوى النص في ال Material
        GlobalMaterialLocalizations.delegate,
        // وظيفتها التحكم في ادارة المحتوى النصي في ال capertino في ال ios
        GlobalCupertinoLocalizations.delegate,
        // وظيفتها التحكم في اتجاه النصوص rtl , ltr
        GlobalWidgetsLocalizations.delegate
      ],
       supportedLocales: const [
         // دعم اللغات
        Locale('ar'),
        Locale('en'),
      ],
      //اللغة الاساسية في النطبيق
      locale: Locale('ar'),

      // home: const LaunchScreen(),
      initialRoute: '/luanch_screen',
      routes: {
        '/luanch_screen': (context) => const LaunchScreen(),
        '/home_screen': (context) => const HomeScreen(),
        '/Info_screen': (context) => /*const*/ InfoScreen(),
      },
    );
  }
}
