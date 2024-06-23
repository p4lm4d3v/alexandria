import 'package:alexandria/models/base_item_model.dart';

class Book extends BaseItem {
  final String author;
  Book({
    required this.author,
    required super.name,
    required super.link,
    required super.tags,
  });
  @override
  String toString() {
    return "$author - $name";
  }
}
