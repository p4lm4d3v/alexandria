import 'package:alexandria/models/base_item_model.dart';

class Song extends BaseItem {
  final String author;

  Song({
    required this.author,
    required super.name,
    required super.link,
    required super.tags,
  });

  /// Returns the default instance of the Song class
  static Song get def => Song(author: 'author', name: 'name', link: 'link', tags: []);

  @override
  String toString() {
    return "$author - $name";
  }
}
