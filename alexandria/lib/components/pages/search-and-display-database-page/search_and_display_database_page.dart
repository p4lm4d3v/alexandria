import 'package:alexandria/providers/search_bar_provider.dart';
import 'package:flutter/material.dart';

import 'package:alexandria/components/pages/search-and-display-database-page/tag_search_bar/tag_search_bar.dart';
import 'package:alexandria/models/database_model.dart';
import 'package:provider/provider.dart';

class SearchAndDisplayDatabasePage extends StatelessWidget {
  const SearchAndDisplayDatabasePage({super.key, required this.db});

  final Database db;

  @override
  Widget build(BuildContext context) {
    final searchBarProvider = context.watch<SearchBarProvider>();
    final hasFocus = searchBarProvider.hasFocus;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TagSearhBar(db: db),
            hasFocus ? const ActiveArea() : NotActiveArea(flex: 1, db: db),
          ],
        ),
      ),
    );
  }
}
