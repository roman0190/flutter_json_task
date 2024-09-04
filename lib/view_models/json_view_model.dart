import 'package:flutter_json_task/models/android_version.dart';

class JsonViewModel {
  List<AndroidVerison> _androidVersions = [];

  List<AndroidVerison> get androidVersions => _androidVersions;

  void parseJsonData(dynamic input) {
    List<AndroidVerison> versionList = [];
    for (var items in input) {
      if (items is Map) {
        items.forEach(
          (key, value) {
            versionList.add(AndroidVerison(
              id: value?['id'],
              title: value?['title'],
            ));
          },
        );
      } else {
        for (var listItems in items) {
          versionList.add(AndroidVerison(
            id: listItems?['id'],
            title: listItems?['title'],
          ));
        }
      }
      _androidVersions = versionList;
    }
  }
}
