import 'package:flutter/material.dart';
import 'restaurant_list_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  final int _duration = 2000;

  void _moveToHomePage() {
    Navigator.of(context).pushReplacementNamed(RestaurantListScreen.routeName);
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: _duration),
    )..addListener(() {
        setState(() {});
      });
    _controller.forward().then((value) => _moveToHomePage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstrainedBox(
                constraints:
                    const BoxConstraints(maxHeight: 300, maxWidth: 300),
                child: const Image(
                  image: AssetImage("assets/images/splash.png"),
                )),
            const SizedBox(height: 24),
            Text(
              "My Restaurant",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 72),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48),
                child: LinearProgressIndicator(
                  value: _controller.value,
                  backgroundColor: Theme.of(context).colorScheme.background,
                ))
          ],
        ),
      ),
    );
  }
}
