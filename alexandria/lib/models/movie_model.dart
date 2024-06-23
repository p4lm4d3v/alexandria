import 'package:alexandria/models/base_item_model.dart';

class Movie extends BaseItem {
  final DateTime date;
  Movie({
    required this.date,
    required super.name,
    required super.link,
    required super.tags,
  });
  @override
  String toString() {
    return "$name ${date.year}";
  }
}
