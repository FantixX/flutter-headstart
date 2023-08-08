import 'package:flutter/material.dart';
import 'package:flutter_headstart/widgets/setting_checkbox.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod/providers.dart';

class FirebaseScreen extends ConsumerWidget {
  const FirebaseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(configurationProvider);

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SettingCheckbox(
              onChanged: (p0) => ref
                  .read(configurationProvider.notifier)
                  .setFirebaseCore(p0 ?? false),
              label: "Enable Firebase",
              value: config.enableFirebaseCore),
          SettingCheckbox(
              onChanged: (config.enableFirebaseCore)
                  ? (p0) => ref
                      .read(configurationProvider.notifier)
                      .setFirebaseAuth(p0 ?? false)
                  : null,
              label: "Enable Firebase Auth",
              value: (config.enableFirebaseCore)
                  ? config.enableFirebaseAuth
                  : false),
          SettingCheckbox(
              onChanged: (config.enableFirebaseCore)
                  ? (p0) => ref
                      .read(configurationProvider.notifier)
                      .setFirebaseFirestore(p0 ?? false)
                  : null,
              label: "Enable Firebase Firestore",
              value: (config.enableFirebaseCore)
                  ? config.enableFirebaseFirestore
                  : false),
        ],
      ),
    );
  }
}
