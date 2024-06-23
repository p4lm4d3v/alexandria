import 'package:flutter/material.dart';

class Database {
  final String name;
  final IconData icon;
  Database({
    required this.name,
    required this.icon,
  });
  @override
  String toString() {
    return "Database('$name')";
  }
}
