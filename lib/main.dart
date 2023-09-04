import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/tvoe_bloc.dart';

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
      home: BlocProvider<TvoeBloc>(
        create: (context) => TvoeBloc(),
        child: HomeNavigationScreen(
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
      ),
    );
  }
}
