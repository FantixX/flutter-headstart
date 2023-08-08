import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:window_manager/window_manager.dart';

import '../models/explorer_tab.dart';

class TabsNotifier extends Notifier<List<ExplorerTab>> {
  @override
  build() {
    return [ExplorerTab(path: "C:", isCurrent: true)];
  }

  void addTab(ExplorerTab tab) {
    ExplorerTab addedTab = tab;
    addedTab.isCurrent = true;
    state = [...state]..forEach((element) => element.isCurrent = false);
    state = [...state, addedTab];
  }

  void removeTab(ExplorerTab tab) {
    if (tab.isCurrent) {
      final nextIndex = state.indexOf(tab);
      try {
        state = [...state]..[nextIndex + 1].isCurrent = true;
      } catch (e) {
        try {
          state = [...state]..[nextIndex - 1].isCurrent = true;
        } catch (e) {
          windowManager.close();
        }
      }
    }
    state = [...state]..remove(tab);
  }

  void setCurrentTab(ExplorerTab tab) {
    state = [...state]..forEach((element) => element.isCurrent = false);
    state = [...state]..firstWhere((element) => element == tab).isCurrent =
        true;
  }

  void setTabPath(String newPath) {
    state = [...state]..firstWhere((element) => element.isCurrent).path =
        newPath;
  }

  void pathUp() {
    final currentTab = state.firstWhere((element) => element.isCurrent);
    final currentPath = currentTab.path;
    try {
      final newPath = currentPath.substring(0, currentPath.lastIndexOf('\\'));
      setTabPath(newPath);
    } catch (e) {
      return;
    }
  }
}
