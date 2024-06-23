import 'package:alexandria/models/tag_model.dart';

extension ToTag on String {
  Tag get toTag => Tag(this);
}
