import 'package:flutter/material.dart';
import 'package:new_todo_app/utils/login_constants.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double height;
  final double width;

  const LoginButton({
    super.key,
    required this.onPressed,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: LoginConstants.primaryColor,
        borderRadius: BorderRadius.circular(LoginConstants.borderRadius),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
            vertical: height * LoginConstants.buttonVerticalPadding,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(LoginConstants.borderRadius),
          ),
        ),
        child: Text(
          LoginConstants.loginButtonText,
          style: TextStyle(
            fontSize: width * LoginConstants.buttonFontSize,
            color: LoginConstants.buttonTextColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
