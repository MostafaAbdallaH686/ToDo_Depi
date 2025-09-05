import 'package:flutter/material.dart';
import 'package:new_todo_app/utils/login_constants.dart';

class LoginHeader extends StatelessWidget {
  final double height;
  final double width;

  const LoginHeader({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          LoginConstants.appIcon,
          size: height * LoginConstants.iconSize,
          color: LoginConstants.primaryColor,
        ),
        SizedBox(height: height * LoginConstants.smallSpacing),
        Text(
          LoginConstants.welcomeTitle,
          style: TextStyle(
            fontSize: LoginConstants.titleFontSize,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: height * LoginConstants.mediumSpacing),
        Text(
          LoginConstants.welcomeSubtitle,
          style: TextStyle(
            color: LoginConstants.greyColor,
            fontSize: width * LoginConstants.subtitleFontSize,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
