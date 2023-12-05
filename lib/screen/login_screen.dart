import 'package:flutter/material.dart';
import 'package:thrifthing_app_kel4/model/UserManager.dart';
import 'package:thrifthing_app_kel4/model/user.dart';
import 'package:thrifthing_app_kel4/screen/home_screen.dart';
import 'package:thrifthing_app_kel4/screen/register_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff564D49),
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.grey[600],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo di sebelah kiri
            Expanded(
              child: Container(
                padding: EdgeInsets.only(right: 20),
                child: Image.asset(
                  'images/logo.png',
                  height: 700,
                ),
              ),
            ),
            // Formulir login di sebelah kanan
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _handleLogin(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff63663C),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()),
                      );
                    },
                    child: Text(
                      'Belum punya akun? Daftar sekarang!',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleLogin(BuildContext context) {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      final user = User(email: email, password: password);
      final isAuthenticated = UserManager.loginUser(user);

      if (isAuthenticated != null) {
        // Login berhasil, pindah ke halaman HomeScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        // Login gagal
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Login Gagal'),
              content: Text('Email atau password salah.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } else {
      // Email atau password kosong
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Input Tidak Valid'),
            content: Text('Harap isi email dan password.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
