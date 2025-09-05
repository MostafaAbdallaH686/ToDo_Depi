import 'package:flutter/material.dart';

class TodoConstants {
  // Sizes and spacings
  static double get horizontalPadding => 0.04;
  static double get searchIconSpacing => 0.02;
  static double get listSpacing => 0.015;

  // Colors
  static const Color primaryColor = Colors.blueAccent;
  static const Color deleteColor = Colors.red;
  static const Color iconColor = Colors.black;
  static const Color fabColor = Colors.blueAccent;
  static const Color fabIconColor = Colors.white;

  // Text styles
  static const TextStyle appBarTitleStyle = TextStyle(color: Colors.black);
  static const TextStyle dialogTitleStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  // Strings
  static const String appBarTitle = 'My Todos';
  static const String searchHint = 'Search...';
  static const String emptyStateText = 'No todos yet';
  static const String deleteDialogTitle = 'Delete';
  static const String deleteDialogContent = 'Do you want to delete this todo?';
  static const String cancelText = 'Cancel';
  static const String deleteText = 'Delete';
  static const String deadlinePrefix = 'Deadline: ';
}
