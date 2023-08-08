import 'package:flutter_headstart/models/configuration_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfigurationNotifier extends Notifier<ConfigurationModel> {
  @override
  build() {
    return ConfigurationModel();
  }

  void setProjectName(String value) {
    state = state.copyWith(projectName: value);
  }

  void setFirebaseCore(bool value) {
    state = state.copyWith(enableFirebaseCore: value);
  }

  void setFirebaseAuth(bool value) {
    state = state.copyWith(enableFirebaseAuth: value);
  }

  void setFirebaseFirestore(bool value) {
    state = state.copyWith(enableFirebaseFirestore: value);
  }
}
