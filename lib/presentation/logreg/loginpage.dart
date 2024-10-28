import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projectmobile/presentation/Logreg/registerpage.dart';
import 'package:projectmobile/presentation/Logreg/lupapassword.dart';
import 'package:projectmobile/presentation/Logreg/startpage.dart';
import 'package:projectmobile/presentation/dashboard/dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  String? _errorMessage;

  Future<void> _login() async {
    try {
      // Login dengan email dan password
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // Jika login berhasil, navigasi ke Dashboard
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Dashboard()),
      );
    } on FirebaseAuthException catch (e) {
      // Tampilkan pesan error jika login gagal
      setState(() {
        _errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header
          Container(
            height: 80,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF191E20),
                  Color(0xFF677D86),
                ],
                stops: [0.0, 0.6],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 16.0, right: 4),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const StartPage()));
                    },
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
                Image.asset('assets/logo.png', width: 50, height: 50),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.question_mark, color: Colors.white, size: 24),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Body
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text Login
                  const Text('Login', style: TextStyle(fontSize: 24)),
                  const SizedBox(height: 16),

                  // Form Login
                  SizedBox(
                    width: 250,
                    child: Column(
                      children: [
                        // Email
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(width: 1, color: Colors.grey),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Password
                        TextFormField(
                          controller: _passwordController,
                          obscureText: !_isPasswordVisible,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: const UnderlineInputBorder(
                              borderSide: BorderSide(width: 1, color: Colors.grey),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Error Message
                        if (_errorMessage != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              _errorMessage!,
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),

                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const LupaPasswordPage()),
                              );
                            },
                            child: const Text(
                              'Lupa Password?',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),
                        // Tombol Login
                        SizedBox(
                          width: 200,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                elevation: 5,
                                side: const BorderSide(color: Colors.grey)),
                            onPressed: _login,
                            child: const Text(
                              'Login',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),

                        const SizedBox(height: 8),

                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const RegisterPage()),
                            );
                          },
                          child: const Text(
                            'Belum punya akun? Daftar',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Footer
          Container(
            height: 80,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF677D86),
                  Color(0xFF191E20),
                ],
                stops: [0.4, 1.0],
              ),
            ),
            child: const Center(
              child: Text(
                'Versi 1.0',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
