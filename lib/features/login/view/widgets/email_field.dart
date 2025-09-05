import 'package:flutter/material.dart';
import 'package:new_todo_app/utils/login_constants.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;

  const EmailField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: LoginConstants.emailLabel,
        prefixIcon: const Icon(LoginConstants.emailIcon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(LoginConstants.borderRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(LoginConstants.borderRadius),
          borderSide: const BorderSide(color: LoginConstants.greyColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(LoginConstants.borderRadius),
          borderSide: const BorderSide(
            color: LoginConstants.primaryColor,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(LoginConstants.borderRadius),
          borderSide: const BorderSide(
            color: LoginConstants.errorColor,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(LoginConstants.borderRadius),
          borderSide: const BorderSide(
            color: LoginConstants.errorColor,
            width: 2,
          ),
        ),
      ),
      validator: _validateEmail,
    );
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LoginConstants.emailRequiredError;
    }
    if (!value.contains('@')) return LoginConstants.emailInvalidError;
    return null;
  }
}
