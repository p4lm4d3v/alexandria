import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:alexandria/components/other/custom/inkwell_card_button.dart';
import 'package:alexandria/components/pages/search-and-display-database-page/models-items-grid/model_items_grid.dart';
import 'package:alexandria/components/pages/search-and-display-database-page/tag_search_bar/no_tags_found_label.dart';
import 'package:alexandria/models/database_model.dart';
import 'package:alexandria/providers/search_bar_provider.dart';
import 'package:alexandria/static/static_icons.dart';

class TagSearhBar extends StatelessWidget {
  const TagSearhBar({
    super.key,
    required this.db,
  });

  final Database db;

  @override
  Widget build(BuildContext context) {
    final searchBarProvider = context.watch<SearchBarProvider>();

    return Row(
      children: [
        InkwellCardButton(
          onTap: () => Get.back(),
          child: Padding(
            padding: const EdgeInsets.all(12.5),
            child: Icon(
              StaticIcons.left,
            ),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          flex: 1,
          child: Focus(
            onKeyEvent: (node, event) {
              if (event is KeyDownEvent) {
                switch (event.logicalKey) {
                  case LogicalKeyboardKey.escape:
                    searchBarProvider.unfocus();
                    return KeyEventResult.handled;
                  case LogicalKeyboardKey.backspace:
                    if (searchBarProvider.noText) {
                      searchBarProvider.popTag();
                      return KeyEventResult.handled;
                    }
                }
              }
              return KeyEventResult.ignored;
            },
            child: TextField(
              textAlign: TextAlign.center,
              // autofocus: true,
              controller: searchBarProvider.controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Search ${db.name}',
              ),
              onTap: () => searchBarProvider.focus(),
              onChanged: (_) => searchBarProvider.focus(),
              onTapOutside: (_) => searchBarProvider.unfocus(),
              onEditingComplete: () => searchBarProvider.unfocus(),
              onSubmitted: (value) {
                if (value.isEmpty && !searchBarProvider.hasFocus) {
                  searchBarProvider.focus();
                } else {
                  if (searchBarProvider.filteredTags.isNotEmpty) {
                    searchBarProvider.onTagSelected(searchBarProvider.filteredTags.first);
                    searchBarProvider.unfocus();
                  }
                }
              },
            ),
          ),
        ),
        const SizedBox(width: 15),
        InkwellCardButton(
          onTap: () => searchBarProvider.unfocus(),
          child: Padding(
            padding: const EdgeInsets.all(12.5),
            child: Icon(StaticIcons.x),
          ),
        ),
      ],
    );
  }
}

class ActiveArea extends StatelessWidget {
  const ActiveArea({super.key, this.flex});

  final int? flex;

  @override
  Widget build(BuildContext context) {
    final searchBarProvider = context.watch<SearchBarProvider>();
    final filteredTags = searchBarProvider.filteredTags.map((tag) => tag.capitalize ?? "no-tag").toList();

    return Expanded(
      flex: flex ?? 1,
      child: Column(
        children: [
          const SizedBox(height: 15),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70.0),
                    child: Builder(
                      builder: (context) {
                        if (filteredTags.isEmpty) {
                          return const NoTagsFoundLabel();
                        }
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: ListView.builder(
                            itemCount: filteredTags.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Center(child: Text(filteredTags[index])),
                                onTap: () => searchBarProvider.onTagSelected(filteredTags[index]),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NotActiveArea extends StatelessWidget {
  const NotActiveArea({
    super.key,
    required this.db,
    this.flex,
  });

  final Database db;
  final int? flex;

  @override
  Widget build(BuildContext context) {
    final searchBarProvider = context.watch<SearchBarProvider>();
    final activeTags = searchBarProvider.activeTags;

    return Expanded(
      flex: flex ?? 1,
      child: Column(
        children: [
          Visibility(
            visible: activeTags.isNotEmpty,
            child: const SizedBox(height: 15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
            child: Wrap(
              spacing: 8.0,
              children: activeTags.map((tag) {
                return Chip(
                  label: Text(tag),
                  onDeleted: () => searchBarProvider.removeTag(tag),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 15),
          ModelsItemsGrid(
            flex: 1,
            db: db,
          ),
        ],
      ),
    );
  }
}
