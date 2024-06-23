import 'package:alexandria/functions/media-query/size.dart';
import 'package:flutter/material.dart';

double height(double percentage, BuildContext context) {
  double heightValue = size(context).height * percentage / 100;
  return heightValue;
}
