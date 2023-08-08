class ConfigurationModel {
  final String projectName;
  final bool enableFirebaseCore;
  final bool enableFirebaseAuth;
  final bool enableFirebaseFirestore;

  ConfigurationModel({
    this.enableFirebaseCore = false,
    this.enableFirebaseAuth = false,
    this.enableFirebaseFirestore = false,
    this.projectName = "",
  });

  ConfigurationModel copyWith({
    bool? enableFirebaseCore,
    bool? enableFirebaseAuth,
    bool? enableFirebaseFirestore,
    String? projectName,
  }) {
    return ConfigurationModel(
      projectName: projectName ?? this.projectName,
      enableFirebaseCore: enableFirebaseCore ?? this.enableFirebaseCore,
      enableFirebaseAuth: enableFirebaseAuth ?? this.enableFirebaseAuth,
      enableFirebaseFirestore:
          enableFirebaseFirestore ?? this.enableFirebaseFirestore,
    );
  }
}
