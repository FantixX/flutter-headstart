import 'dart:io';

import 'package:flutter_headstart/riverpod/tabs_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/explorer_tab.dart';
import '../services/file_system_service.dart';
import '../utility/app_settings_utility.dart';

final appSettingsProvider = Provider<AppSettingsUtility>((ref) {
  return AppSettingsUtility();
});

final tabsProvider = NotifierProvider<TabsNotifier, List<ExplorerTab>>(() {
  return TabsNotifier();
});

final fileSystemServiceProvider = Provider<FileSystemService>((ref) {
  return FileSystemService();
});

final currentPathProvider = Provider<String>((ref) {
  return ref
      .watch(tabsProvider)
      .firstWhere((element) => element.isCurrent)
      .path;
});

final currentDirectoryContentsProvider =
    StreamProvider<List<FileSystemEntity>>((ref) async* {
  try {
    final Directory directory = Directory(ref.watch(currentPathProvider));
    while (true) {
      await Future.delayed(const Duration(milliseconds: 500));
      yield await ref.watch(fileSystemServiceProvider).dirContents(directory);
    }
  } catch (e) {
    return;
  }
});
