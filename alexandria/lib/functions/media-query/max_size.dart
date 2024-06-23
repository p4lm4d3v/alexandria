import 'package:alexandria/functions/media-query/height.dart';
import 'package:alexandria/functions/media-query/width.dart';
import 'package:flutter/material.dart';

double maxSize(double widthPercentage, double heightPercentage, BuildContext context) {
  double w = width(100, context);
  double h = height(100, context);
  if (w > h) {
    return width(widthPercentage, context);
  } else {
    return height(heightPercentage, context);
  }
}
