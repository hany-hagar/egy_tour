import 'package:flutter/material.dart';

class CodeResetDialog extends StatelessWidget {
  const CodeResetDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Check Your Email",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.email, size: 50, color: Colors.blue), // Email icon
          SizedBox(height: 16),
          Text(
            "We've sent a password reset link to your email address. "
                "Please check your inbox and follow the instructions to reset your password.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text("OK", style: TextStyle(color: Colors.blue)),
        ),
      ],
    );
  }
}
