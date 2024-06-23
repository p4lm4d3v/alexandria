import 'package:alexandria/models/base_item_model.dart';

class Show extends BaseItem {
  final DateTime startDate;
  final DateTime endDate;
  Show({
    required this.startDate,
    required this.endDate,
    required super.name,
    required super.link,
    required super.tags,
  });
  @override
  String toString() {
    return "$name (${startDate.year} - ${endDate.year})";
  }
}
