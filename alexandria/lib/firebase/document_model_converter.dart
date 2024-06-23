import 'package:alexandria/extensions/to_date_time_for_string.dart';
import 'package:alexandria/functions/get_icon.dart';
import 'package:alexandria/models/book_model.dart';
import 'package:alexandria/models/database_model.dart';
import 'package:alexandria/models/movie_model.dart';
import 'package:alexandria/models/show_model.dart';
import 'package:alexandria/models/song_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DocumentModelConverter {
  /// Converts a QueryDocumentSnapshot into a Database
  static Database toDatabase(QueryDocumentSnapshot doc) {
    String iconName = doc.get('icon');
    return Database(
      name: doc.get('name'),
      icon: getIcon(iconName),
    );
  }

  /// Converts a QueryDocumentSnapshot into a Song
  static Song toSong(QueryDocumentSnapshot doc) {
    return Song(
      name: doc.get('name'),
      author: doc.get('author'),
      link: doc.get('link'),
      tags: doc.get('tags'),
    );
  }

  /// Converts a QueryDocumentSnapshot into a Movie
  static Movie toMovie(QueryDocumentSnapshot doc) {
    String date = doc.get('date');
    return Movie(
      date: date.toDateTime(),
      name: doc.get('name'),
      link: doc.get('link'),
      tags: doc.get('tags'),
    );
  }

  /// Converts a QueryDocumentSnapshot into a Show
  static Show toShow(QueryDocumentSnapshot doc) {
    String startDate = doc.get('start_date');
    String endDate = doc.get('end_date');
    return Show(
      name: doc.get('name'),
      startDate: startDate.toDateTime(),
      endDate: endDate.toDateTime(),
      link: doc.get('link'),
      tags: doc.get('tags'),
    );
  }

  /// Converts a QueryDocumentSnapshot into a Book
  static Book toBook(QueryDocumentSnapshot doc) {
    return Book(
      name: doc.get('name'),
      author: doc.get('author'),
      link: doc.get('link'),
      tags: doc.get('tags'),
    );
  }
}
