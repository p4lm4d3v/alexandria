import 'package:alexandria/extensions/to_tag_for_string.dart';
import 'package:alexandria/firebase/fire_controller.dart';
import 'package:alexandria/models/song_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SongsProvider with ChangeNotifier {
  Future<List<Song>> _futureSongs = Future.value([Song.def]);

  Future<List<Song>> get([String? tagString]) {
    if (tagString == null || tagString.isEmpty) {
      _futureSongs = FireController.getMusic();
    } else {
      final tags = tagString.split(' ').map((e) => e.toTag.value).toList();
      _futureSongs = FireController.getMusic(tags);
    }
    _futureSongs.printInfo();
    return _futureSongs;
  }

  Future<void> fetchSongs([String? tagString]) async {
    _futureSongs = FireController.getMusic();
    notifyListeners();
  }
}
