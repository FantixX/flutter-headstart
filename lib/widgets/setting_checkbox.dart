import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingCheckbox extends ConsumerWidget {
  final Function(bool?)? onChanged;
  final String label;
  final bool value;
  const SettingCheckbox(
      {super.key,
      required this.onChanged,
      required this.label,
      required this.value});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(label), Checkbox(value: value, onChanged: onChanged)],
    );
  }
}
