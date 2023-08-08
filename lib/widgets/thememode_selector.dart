import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../riverpod/providers.dart';

class ThemeModeSelector extends ConsumerWidget {
  const ThemeModeSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ValueListenableBuilder(
      valueListenable: Hive.box("settings").listenable(),
      builder: (context, value, child) {
        return DropdownButton(
          //borderRadius: BorderRadius.circular(10),
          autofocus: false,
          underline: const SizedBox(),
          borderRadius: BorderRadius.circular(10),
          icon: const SizedBox(),
          focusColor: Colors.transparent,
          value: ref.watch(appSettingsProvider).getThemeMode,
          items: [
            DropdownMenuItem(
              value: ThemeMode.system,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.smartphone,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            DropdownMenuItem(
              value: ThemeMode.light,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.light_mode,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            DropdownMenuItem(
              value: ThemeMode.dark,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.dark_mode,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ],
          onChanged: (value) {
            if (value != null) {
              ref.read(appSettingsProvider).setThemeMode(value);
            }
          },
        );
      },
    );
  }
}
