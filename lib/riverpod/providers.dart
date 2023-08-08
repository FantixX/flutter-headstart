import 'package:flutter/widgets.dart';
import 'package:flutter_headstart/models/configuration_model.dart';
import 'package:flutter_headstart/riverpod/configuration_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utility/app_settings_utility.dart';

final appSettingsProvider = Provider<AppSettingsUtility>((ref) {
  return AppSettingsUtility();
});

final pageViewControllerProvider = Provider<PageController>((ref) {
  return PageController();
});

final configurationProvider =
    NotifierProvider<ConfigurationNotifier, ConfigurationModel>(
  () => ConfigurationNotifier(),
);
