import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hanin AbuHasirah - Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xFF9D7DFF),
          onPrimary: Colors.white,
          secondary: Color(0xFFFF6BD6),
          onSecondary: Colors.black,
          error: Color(0xFFFF6B6B),
          onError: Colors.white,
          surface: Color(0xFF0B0F1A),
          onSurface: Color(0xFFE5E7EB),
        ),
        scaffoldBackgroundColor: const Color(0xFF050814),
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF050814),
          surfaceTintColor: Colors.transparent,
          elevation: 0,
        ),
        cardColor: const Color(0xFF0B0F1A),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}