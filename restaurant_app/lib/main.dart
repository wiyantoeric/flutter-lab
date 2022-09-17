import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import './ui/ui.dart';
import './common/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      initialRoute: SplashScreen.routeName,
      theme: myTheme,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        RestaurantListScreen.routeName: (context) =>
            const RestaurantListScreen(),
        RestaurantDetailsScreen.routeName: (context) => RestaurantDetailsScreen(
              restaurant:
                  ModalRoute.of(context)?.settings.arguments as Restaurant,
            ),
      },
    );
  }
}
