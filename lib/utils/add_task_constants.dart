import 'package:flutter/material.dart';

class AddEditConstants {
  // Padding and spacing
  static const double screenPadding = 16.0;
  static const double cardPadding = 12.0;
  static const double spacing = 16.0;
  static const double buttonHeight = 48.0;
  static const double buttonBorderRadius = 12.0;

  // Colors
  static const Color cardColor = Colors.white;
  static const Color buttonColor = Colors.blueAccent;
  static const Color textColor = Colors.white;

  // Text styles
  static const TextStyle buttonTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
  );

  // Strings
  static const String editTitle = 'Edit Details';
  static const String addTitle = 'Add Details';
  static const String titleLabel = 'Todo Title';
  static const String descriptionLabel = 'Description';
  static const String descriptionHint = 'Add a description...';
  static const String deadlineLabel = 'Deadline';
  static const String deadlinePlaceholder = 'mm/dd/yyyy';
  static const String saveButtonText = 'Save';
  static const String requiredError = 'Required';

  // Icons
  static const IconData deadlineIcon = Icons.event_outlined;
}
