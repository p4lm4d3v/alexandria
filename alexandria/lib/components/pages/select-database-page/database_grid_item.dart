import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:alexandria/components/other/custom/inkwell_card_button.dart';
import 'package:alexandria/components/pages/search-and-display-database-page/search_and_display_database_page.dart';
import 'package:alexandria/models/database_model.dart';

class DatabaseGridItem extends StatelessWidget {
  const DatabaseGridItem({super.key, required this.db});

  final Database db;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double cardHeight = constraints.maxHeight;
        final double iconSize = cardHeight / 3;
        final double textSize = cardHeight / 12;

        return InkwellCardButton(
          onTap: () => Get.to(
            () => SearchAndDisplayDatabasePage(db: db),
          ),
          child: Column(
            children: [
              const Spacer(flex: 1),
              SizedBox(height: textSize),
              const Spacer(flex: 1),
              SizedBox(
                height: iconSize,
                child: Icon(db.icon, size: iconSize),
              ),
              const Spacer(flex: 1),
              SizedBox(
                height: textSize,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    db.name,
                    style: TextStyle(
                      fontSize: textSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 1),
            ],
          ),
        );
      },
    );
  }
}
