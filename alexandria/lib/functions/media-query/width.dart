import 'package:alexandria/functions/media-query/size.dart';
import 'package:flutter/material.dart';

double width(double percentage, BuildContext context) {
  return size(context).width * percentage / 100;
}
