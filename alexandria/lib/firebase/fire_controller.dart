import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:alexandria/firebase/document_model_converter.dart';
import 'package:alexandria/models/book_model.dart';
import 'package:alexandria/models/database_model.dart';
import 'package:alexandria/models/movie_model.dart';
import 'package:alexandria/models/show_model.dart';
import 'package:alexandria/models/song_model.dart';
import 'package:alexandria/static/firestore_collections.dart';
import 'package:flutter/material.dart';

class FireController {
  static Future<List<String>> getAllTags(FireCollection collection) async {
    Set<String> tagsSet = {};
    List<String> tagsList = [];
    final allDocuments = await getAllDocuments(collection);
    allDocuments.forEach(
      (doc) => tagsSet.addAll(
        List<String>.from(
          doc.get('tags'),
        ),
      ),
    );
    tagsList = List<String>.from(tagsSet);
    tagsList.sort();
    return tagsList;
  }

  /// Get items depending on the database model
  static Future<List> getItems(Database db) async {
    switch (db.name) {
      case "Music":
        return getMusic();
      case "Movies":
        return getMovies();
      case "Shows":
        return getShows();
      case "Books":
        return getBooks();
      default:
        return Future.value([]);
    }
  }

  /// Get all documents from a collection
  static Future<List<QueryDocumentSnapshot>> getAllDocuments(FireCollection collection) async {
    CollectionReference collectionReference = FirebaseFirestore.instance.collection(collection.path);
    QuerySnapshot querySnapshot = await collectionReference.get();
    return querySnapshot.docs;
  }

  static Future<List<QueryDocumentSnapshot>> getDocumentsWithTags(FireCollection collection, List<String> tags) async {
    CollectionReference collectionReference = FirebaseFirestore.instance.collection(collection.path);
    QuerySnapshot querySnapshot = await collectionReference.where('tags', arrayContainsAny: tags).get();
    return querySnapshot.docs;
  }

  /// Get all documents and turn them into Databases
  static Future<List<Database>> getDatabases() async {
    final docs = await FireController.getAllDocuments(FireCollection.dbs);
    return docs.map(DocumentModelConverter.toDatabase).toList();
  }

  /// Get documents with specific tags and turn them into Songs
  static Future<List<Song>> getMusic([List<String>? tags]) async {
    final docs = tags != null && tags.isNotEmpty
        ? await FireController.getDocumentsWithTags(FireCollection.music, tags)
        : await FireController.getAllDocuments(FireCollection.music);
    return docs.map(DocumentModelConverter.toSong).toList();
  }

  /// Get all documents and turn them into Movies
  static Future<List<Movie>> getMovies() async {
    final docs = await FireController.getAllDocuments(FireCollection.movies);
    return docs.map(DocumentModelConverter.toMovie).toList();
  }

  /// Get all documents and turn them into Show
  static Future<List<Show>> getShows() async {
    final docs = await FireController.getAllDocuments(FireCollection.shows);
    return docs.map(DocumentModelConverter.toShow).toList();
  }

  /// Get all documents and turn them into Book
  static Future<List<Book>> getBooks() async {
    final docs = await FireController.getAllDocuments(FireCollection.books);
    return docs.map(DocumentModelConverter.toBook).toList();
  }
}
