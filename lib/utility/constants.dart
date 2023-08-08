import 'package:flutter/animation.dart';
import 'package:flutter_headstart/models/configuration_section.dart';
import 'package:flutter_headstart/screens.dart/firebase_screen.dart';

const pageTransitionDuration = Duration(milliseconds: 100);
const pageTransitionCurve = Curves.ease;

final configurationSections = [
  ConfigurationSection(
      title: "Firebase Settings", screen: const FirebaseScreen())
];
