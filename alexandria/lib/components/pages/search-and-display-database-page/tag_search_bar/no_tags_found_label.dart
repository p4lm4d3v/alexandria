import 'package:flutter/material.dart';

class NoTagsFoundLabel extends StatelessWidget {
  const NoTagsFoundLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      title: Center(
        child: Text('No tags found.'),
      ),
    );
  }
}
