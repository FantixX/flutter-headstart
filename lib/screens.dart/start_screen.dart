import 'package:flutter/material.dart';
import 'package:flutter_headstart/riverpod/providers.dart';
import 'package:flutter_headstart/utility/constants.dart';
import 'package:flutter_headstart/widgets/animated_welcome_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StartScreen extends ConsumerStatefulWidget {
  const StartScreen({super.key});

  @override
  ConsumerState<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends ConsumerState<StartScreen> {
  late TextEditingController _controller;
  @override
  void initState() {
    final projectName = ref.read(configurationProvider).projectName;
    _controller = TextEditingController(text: projectName);
    _validateDartPackageName(projectName);
    super.initState();
  }

  late bool isValid;
  void _validateDartPackageName(String name) {
    print("called");
    if (name.isEmpty) {
      setState(() {
        isValid = false;
      });
    } else {
      final regexPattern = RegExp(r'^[a-zA-Z][a-zA-Z0-9_]*$');
      setState(() {
        isValid = regexPattern.hasMatch(name);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const AnimatedWelcomeText(),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.35),
          child: TextField(
            onChanged: (value) {
              _validateDartPackageName(value);
              if (isValid ?? false) {
                ref.read(configurationProvider.notifier).setProjectName(value);
              }
            },
            controller: _controller,
            decoration: InputDecoration(
                errorText: ((isValid ?? true) || _controller.text.isEmpty)
                    ? null
                    : "Invalid Dart package name",
                hintText: "Enter a valid dart package name"),
          ),
        ),
        ElevatedButton(
          onPressed: (isValid ?? false)
              ? () {
                  ref.read(pageViewControllerProvider).nextPage(
                      duration: pageTransitionDuration,
                      curve: pageTransitionCurve);
                }
              : null,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Get started",
                    style: TextStyle(
                      fontSize: 20,
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(Icons.arrow_forward),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
