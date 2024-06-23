import 'package:alexandria/static/icon_name_to_icon_data.dart';
import 'package:alexandria/static/static_icons.dart';
import 'package:flutter/material.dart';

IconData getIcon(String iconName) {
  return iconNameToIconDataMap[iconName] ?? StaticIcons.block;
}
