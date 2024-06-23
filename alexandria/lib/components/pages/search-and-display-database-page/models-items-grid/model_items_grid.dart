import 'package:alexandria/providers/search_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:alexandria/components/other/centered_circular_progress_indicator.dart';
import 'package:alexandria/components/pages/search-and-display-database-page/models-items-grid/model_grid_item.dart';
import 'package:alexandria/models/database_model.dart';
import 'package:alexandria/models/song_model.dart';
import 'package:alexandria/providers/songs_provider.dart';
import 'package:alexandria/static/my_sliver_grid_delegate.dart';

class ModelsItemsGrid extends StatelessWidget {
  const ModelsItemsGrid({
    super.key,
    required this.db,
    this.flex,
  });

  final Database db;
  final int? flex;

  @override
  Widget build(BuildContext context) {
    final songsProvider = context.watch<SongsProvider>();
    final searchBarProvider = context.watch<SearchBarProvider>();
    final activeTags = searchBarProvider.activeTags;
    final tagsString = activeTags.join(' ');

    return Expanded(
      flex: flex ?? 1,
      child: FutureBuilder(
        future: songsProvider.get(tagsString),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CenteredCircularProgressIndicator();
          }
          final List<Song> songs = List<Song>.from(snapshot.data!);
          return GridView.builder(
            gridDelegate: mySliverGridDelegate,
            itemCount: songs.length,
            itemBuilder: (context, idx) {
              return ModelGridItem(
                item: songs[idx],
              );
            },
          );
        },
      ),
    );
  }
}
