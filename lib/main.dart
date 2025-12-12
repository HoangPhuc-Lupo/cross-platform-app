import 'package:flutter/material.dart';

import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';
import 'screens/ranking_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/comic_detail_screen.dart';
import 'screens/chapter_reader_screen.dart';

void main() {
  runApp(const NetTruyenApp());
}

class NetTruyenApp extends StatelessWidget {
  const NetTruyenApp({super.key});

  @override
  Widget build(BuildContext context) {
    final baseTheme = ThemeData.light();

    return MaterialApp(
      title: 'NetTruyen',
      debugShowCheckedModeBanner: false,
      theme: baseTheme.copyWith(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFF00C6C4), // xanh ở trên cùng
        colorScheme: baseTheme.colorScheme.copyWith(
          primary: const Color(0xFF00C6C4),
          secondary: const Color(0xFFFF5722), // cam nút
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            backgroundColor: const Color(0xFFFF5722),
            foregroundColor: Colors.white,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey.shade200,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      initialRoute: LoginScreen.routeName,
      routes: {
        LoginScreen.routeName: (_) => const LoginScreen(),
        RegisterScreen.routeName: (_) => const RegisterScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        RankingScreen.routeName: (_) => const RankingScreen(),
        FavoritesScreen.routeName: (_) => const FavoritesScreen(),
        ComicDetailScreen.routeName: (_) => const ComicDetailScreen(),
        ChapterReaderScreen.routeName: (_) => const ChapterReaderScreen(),
      },
    );
  }
}
