// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_todo_app/cubit/auth_cubit.dart';
import 'package:new_todo_app/features/login/view/widgets/email_field.dart';
import 'package:new_todo_app/features/login/view/widgets/login_button.dart';
import 'package:new_todo_app/features/login/view/widgets/login_header.dart';
import 'package:new_todo_app/utils/login_constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final height = mediaQuery.height;
    final width = mediaQuery.width;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: width * LoginConstants.horizontalPadding,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LoginHeader(height: height, width: width),
                SizedBox(height: height * LoginConstants.largeSpacing),
                EmailField(controller: _emailController),
                SizedBox(height: height * LoginConstants.smallSpacing),
                LoginButton(
                  onPressed: _handleLogin,
                  height: height,
                  width: width,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthCubit>().login(_emailController.text.trim());
    }
  }
}
