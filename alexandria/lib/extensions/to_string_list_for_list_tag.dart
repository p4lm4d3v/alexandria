import 'package:alexandria/models/tag_model.dart';

extension ToStringList on List<Tag> {
  List<String> toStringList() {
    return map((tag) => tag.value).toList();
  }
}
