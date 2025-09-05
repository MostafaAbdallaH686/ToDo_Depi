import 'package:flutter/material.dart';

class LoginConstants {
  // Sizes and spacings
  static double get horizontalPadding => 0.08;
  static double get iconSize => 0.1;
  static double get smallSpacing => 0.03;
  static double get mediumSpacing => 0.015;
  static double get largeSpacing => 0.05;
  static double get buttonVerticalPadding => 0.02;
  static double get borderRadius => 10.0;

  // Text sizes
  static double get titleFontSize => 26.0;
  static double get subtitleFontSize => 0.04;
  static double get buttonFontSize => 0.045;

  // Colors
  static const Color primaryColor = Colors.blueAccent;
  static const Color greyColor = Colors.grey;
  static const Color errorColor = Colors.red;
  static const Color buttonTextColor = Colors.white;

  // Strings
  static const String welcomeTitle = 'Welcome Back!';
  static const String welcomeSubtitle = 'Log in to manage your to-do lists.';
  static const String emailLabel = 'Email';
  static const String emailRequiredError = 'Email required';
  static const String emailInvalidError = 'Invalid email';
  static const String loginButtonText = 'Login';

  // Icons
  static const IconData emailIcon = Icons.mail_outline;
  static const IconData appIcon = Icons.verified_rounded;
}
