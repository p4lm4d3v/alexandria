import 'package:alexandria/extensions/contains_all_for_list.dart';
import 'package:alexandria/models/book_model.dart';
import 'package:alexandria/models/movie_model.dart';
import 'package:alexandria/models/show_model.dart';
import 'package:alexandria/models/song_model.dart';

class BaseItem {
  final String name;
  final String link;
  final List tags;

  BaseItem({
    required this.name,
    required this.link,
    required this.tags,
  });

  bool containsTags(String tags) {
    if (tags.isEmpty) return true;
    List<String> tagsList = tags.split('');
    return this.tags.containsAll(tagsList);
  }

  String getTop() {
    return name;
  }

  String getBottom() {
    if (this is Song)
      return (this as Song).author;
    else if (this is Movie)
      return "${(this as Movie).date.year}";
    else if (this is Show)
      return "${(this as Show).startDate.year} - ${(this as Show).endDate.year}";
    else if (this is Book)
      return (this as Book).author;
    else
      return 'no-model';
  }
}
