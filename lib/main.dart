import 'package:flutter/material.dart';
import 'package:galaxy_planets/views/screens/components/SolarSystem/solar_intro_page.dart';
import 'package:galaxy_planets/views/screens/components/SolarSystem/solar_system.dart';
import 'package:galaxy_planets/views/screens/components/space/space.dart';
import 'package:galaxy_planets/views/screens/components/space/space_intro_page.dart';
import 'package:provider/provider.dart';
import 'package:galaxy_planets/views/screens/splash_screen.dart';
import 'package:galaxy_planets/views/screens/home_page.dart';
import 'package:galaxy_planets/views/screens/components/SolarSystem/detail_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controllers/provider/theme_provider.dart';
import 'models/theme_modals.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool isdark = prefs.getBool('isdark') ?? false;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => themeProvider(
            thememodel: themeModel(
              isDark: isdark,
            ),
          ),
        ),
      ],
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(
            useMaterial3: true,
          ),
          darkTheme: ThemeData.dark(
            useMaterial3: true,
          ),
          themeMode:
          (Provider.of<themeProvider>(context).thememodel.isDark == false)
              ? ThemeMode.light
              : ThemeMode.dark,
          routes: {
            '/': (context) => SplashScreen(),
            'home_page': (context) => HomePage(),
            'solar_system': (context) => SolarSystemPage(),
            'solar_intro_page': (context) => SolarIntroPage(),
            'detail_page': (context) => DetailPage(),
            'space_intro_page': (context) => SpaceIntroPage(),
            'space': (context) => Space(),
          },
        );
      },
    ),
  );
}
