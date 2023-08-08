import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedWelcomeText extends StatelessWidget {
  const AnimatedWelcomeText({super.key});

  static const appNames = [
    "Gaming",
    "Fitness",
    "Social Media",
    "E-Commerce",
    "Streaming",
    "Education",
    "Finance",
    "News",
    "Travel",
    "Food",
    "Dating",
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text("Your",
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20)),
          AnimatedTextKit(
            animatedTexts: [
              ...appNames
                  .map((e) => TyperAnimatedText(e,
                      textStyle: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      speed: const Duration(milliseconds: 90),
                      curve: Curves.ease))
                  .toList()
            ],
            repeatForever: true,
          ),
          const Text("App starts here",
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20)),
        ],
      ),
    );
  }
}
