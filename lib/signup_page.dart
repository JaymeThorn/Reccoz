// signup_page.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _newUsernameController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _newUsernameController,
              decoration: InputDecoration(labelText: 'New Username'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _newPasswordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'New Password'),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () async {
                // Perform local signup action
                String newUsername = _newUsernameController.text;
                String newPassword = _newPasswordController.text;

                // Save new credentials to a file
                await saveCredentialsToFile(newUsername, newPassword);

                print('New account created - Username: $newUsername, Password: $newPassword');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Account created successfully')),
                );
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> saveCredentialsToFile(String username, String password) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/credentials.txt');
      await file.writeAsString('$username,$password\n', mode: FileMode.append);
    } catch (e) {
      print('Error saving credentials to file: $e');
    }
  }
}
