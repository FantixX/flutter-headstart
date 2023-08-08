class ExplorerTab {
  final String id;
  String path;
  bool isCurrent;

  ExplorerTab({required this.path, id, this.isCurrent = false})
      : id = DateTime.now().toString();
  ExplorerTab.defaultDirectory()
      : id = DateTime.now().toString(),
        path = "C:",
        isCurrent = false;
}
