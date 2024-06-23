import 'package:alexandria/firebase/fire_controller.dart';
import 'package:alexandria/static/firestore_collections.dart';
import 'package:flutter/material.dart';

class SearchBarProvider extends ChangeNotifier {
  final TextEditingController _controller = TextEditingController();
  final List<String> _activeTags = [];
  List<String> _filteredTags = [];
  bool _hasFocus = false;

  SearchBarProvider() {
    _controller.addListener(onSearchChanged);
  }

  TextEditingController get controller => _controller;
  Future<List<String>> get allTags => FireController.getAllTags(FireCollection.music);
  List<String> get activeTags => _activeTags;
  List<String> get filteredTags => _filteredTags;
  bool get hasFocus => _hasFocus;
  bool get noText => _controller.text.isEmpty;

  void focus() {
    _hasFocus = true;
    notifyListeners();
  }

  void unfocus() {
    _hasFocus = false;
    notifyListeners();
  }

  void onSearchChanged() async {
    if (_controller.text.isEmpty) {
      _filteredTags = await allTags;
    } else {
      _filteredTags = (await allTags).where((tag) => tag.startsWith(_controller.text.toLowerCase().trim()) && !_activeTags.contains(tag)).toList();
    }
    notifyListeners();
  }

  void onTagSelected(String tag) {
    _activeTags.add(tag);
    _controller.text = "";
    notifyListeners();
  }

  void removeTag(String tag) {
    _activeTags.remove(tag);
    notifyListeners();
  }

  void popTag() {
    _activeTags.removeAt(_activeTags.length - 1);
    notifyListeners();
  }
}
