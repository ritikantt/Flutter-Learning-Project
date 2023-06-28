import 'package:flutter/material.dart';
import 'package:income_expense_assignment/screens/tab_screen.dart';

import '../data/user_dummy.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  var _enteredUsername = '';
  var _enteredPassword = '';

  void _loginUser() {
    if (_loginFormKey.currentState!.validate()) {
      _loginFormKey.currentState!.save();
      _validateUser();
    }
  }

  void _validateUser() {
    for (final user in usersList) {
      if (user.userName == _enteredUsername &&
          user.password == _enteredPassword) {
        _navigateToDashboard();
        //go to main dashboard
      }
    }
  }

  void _navigateToDashboard() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: ((ctx) => const TabScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
            key: _loginFormKey,
            child: Column(
              children: [
                TextFormField(
                  maxLength: 30,
                  decoration: const InputDecoration(
                      label: Text('Username'), border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length < 4 ||
                        value.trim().length > 30) {
                      return 'Must be between 4 and 30 characters';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _enteredUsername = value!;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                    maxLength: 15,
                    decoration: const InputDecoration(
                        label: Text('Password'), border: OutlineInputBorder()),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().length < 6 ||
                          value.trim().length > 15) {
                        return 'Must be between 6 and 15 characters';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _enteredPassword = value!;
                    }),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _loginUser,
                  child: const Text('Login'),
                )
              ],
            )),
      ),
    );
  }
}
