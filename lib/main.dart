import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'moduls/main_screen/main_screen.dart';

void main() {
  runApp(const TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TestApp",
      home: HomeNavigationScreen(
        screens: const [
          MainScreen(),
          MainScreen(),
          MainScreen(),
          MainScreen(),
          MainScreen(),
        ],
        navigation: const [
          HomeNavigationData(icon: Icons.home, label: 'Главня'),
          HomeNavigationData(icon: Icons.movie_outlined, label: 'Каталог'),
          HomeNavigationData(icon: Icons.favorite_outline, label: 'Мое'),
          HomeNavigationData(icon: Icons.tv, label: 'ТВ-каналы'),
          HomeNavigationData(icon: Icons.person_outline, label: 'Профиль'),
        ],
      ),
    );
  }
}
