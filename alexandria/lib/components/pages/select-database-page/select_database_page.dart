import 'package:alexandria/components/other/centered_circular_progress_indicator.dart';
import 'package:alexandria/components/other/custom/inkwell_card_button.dart';
import 'package:alexandria/static/my_sliver_grid_delegate.dart';
import 'package:alexandria/static/static_icons.dart';
import 'package:flutter/material.dart';

import 'package:alexandria/components/pages/select-database-page/database_grid_item.dart';
import 'package:alexandria/firebase/fire_controller.dart';
import 'package:alexandria/models/database_model.dart';

class SelectDatabasePage extends StatefulWidget {
  const SelectDatabasePage({super.key});

  @override
  State<SelectDatabasePage> createState() => _SelectDatabasePageState();
}

class _SelectDatabasePageState extends State<SelectDatabasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 15, 15),
        child: InkwellCardButton(
          child: Padding(
            padding: const EdgeInsets.all(12.5),
            child: Icon(StaticIcons.refresh),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: FutureBuilder(
          future: FireController.getDatabases(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CenteredCircularProgressIndicator();
            }
            final List<Database> dbs = snapshot.data!;
            return Scrollbar(
              trackVisibility: true,
              child: GridView.builder(
                gridDelegate: mySliverGridDelegate,
                itemCount: dbs.length,
                itemBuilder: (context, idx) {
                  return DatabaseGridItem(
                    db: dbs[idx],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
