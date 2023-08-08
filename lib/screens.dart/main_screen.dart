import 'package:flutter/material.dart';
import 'package:flutter_headstart/widgets/animated_welcome_text.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const AnimatedWelcomeText(),
          ElevatedButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Get started",
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
