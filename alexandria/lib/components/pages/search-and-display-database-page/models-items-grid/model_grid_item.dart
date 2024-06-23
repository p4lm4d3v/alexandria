import 'package:flutter/material.dart';

import 'package:alexandria/components/other/custom/inkwell_card_button.dart';
import 'package:alexandria/models/base_item_model.dart';
import 'package:alexandria/static/static_icons.dart';

class ModelGridItem extends StatelessWidget {
  const ModelGridItem({super.key, required this.item});

  final BaseItem item;

  @override
  Widget build(BuildContext context) {
    final String topText = item.getTop();
    final String bottomText = item.getBottom();

    return LayoutBuilder(
      builder: (context, constraints) {
        final double cardHeight = constraints.maxHeight;
        final double iconSize = cardHeight / 3;
        final double topTextSize = cardHeight / 14;
        final double bottomTextSize = topTextSize * 0.9;
        const double bottomTextOpacity = .6;

        return InkwellCardButton(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: topTextSize),
              SizedBox(
                height: iconSize,
                child: Icon(
                  StaticIcons.note,
                  size: iconSize,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Column(
                  children: [
                    Text(
                      topText,
                      style: TextStyle(
                        fontSize: topTextSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Opacity(
                      opacity: bottomTextOpacity,
                      child: Text(
                        bottomText,
                        style: TextStyle(
                          fontSize: bottomTextSize,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
