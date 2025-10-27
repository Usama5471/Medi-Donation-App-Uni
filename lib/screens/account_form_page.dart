import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AccountFormPage extends StatefulWidget {
  const AccountFormPage({super.key});

  @override
  State<AccountFormPage> createState() => _AccountFormPageState();
}

class _AccountFormPageState extends State<AccountFormPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _contactController = TextEditingController();

  bool _isLogin = true;
  String _message = '';

  Future<void> _handleAuth() async {
    try {
      if (_isLogin) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        setState(() {
          _message = '✅ Logged in successfully!';
        });
      } else {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        setState(() {
          _message = '✅ Account created successfully!';
        });
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        _message = '❌ Error: ${e.message}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("📝 Account Form")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: '👤 Name'),
            ),
            TextField(
              controller: _contactController,
              decoration: const InputDecoration(labelText: '📞 Contact Number'),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: '📧 Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: '🔒 Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleAuth,
              child: Text(_isLogin ? '🔓 Login' : '📝 Sign Up'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _isLogin = !_isLogin;
                });
              },
              child: Text(_isLogin
                  ? "Don't have an account? Sign Up"
                  : "Already have an account? Login"),
            ),
            const SizedBox(height: 20),
            Text(_message, style: const TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
