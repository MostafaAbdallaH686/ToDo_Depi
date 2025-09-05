import 'package:flutter/material.dart';
import 'package:new_todo_app/utils/add_task_constants.dart';

class SaveButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isEdit;

  const SaveButton({super.key, required this.onPressed, required this.isEdit});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AddEditConstants.buttonHeight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AddEditConstants.buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AddEditConstants.buttonBorderRadius,
            ),
          ),
        ),
        onPressed: onPressed,
        child: const Text(
          AddEditConstants.saveButtonText,
          style: AddEditConstants.buttonTextStyle,
        ),
      ),
    );
  }
}
