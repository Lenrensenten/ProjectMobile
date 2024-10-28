import 'package:flutter/material.dart';
import 'package:projectmobile/presentation/Logreg/loginpage.dart';

class Regverif extends StatefulWidget {
  const Regverif({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Regverif createState() => _Regverif();
}

class _Regverif extends State<Regverif> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 80,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF191E20), // warna header
                  Color(0xFF677D86), // warna header
                ],
                stops: [0.0, 0.6],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, top: 16.0, bottom: 16.0, right: 4),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                Image.asset(
                  'assets/logo.png', // ganti dengan logo aplikasi Anda
                  width: 50,
                  height: 50,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.question_mark,
                        color: Colors.white,
                        size: 24,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),

          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text Login
                  Container(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),

                  // Form Login
                  SizedBox(
                    width: 250,
                    child: Form(
                      child: Column(
                        children: [
                          // Email
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Verifikasi Email',
                              border: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.grey),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 150,
                          ),

                          SizedBox(
                            height: 50,
                            width: 300,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Checkbox(
                                    value: _isChecked,
                                    onChanged: (value) {
                                      setState(() {
                                        _isChecked = value!;
                                      });
                                    },
                                  ),
                                ),
                                const Positioned(
                                  left: 16,
                                  bottom: 16,
                                  child: SizedBox(
                                    width: 200,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Setuju, Anda sudah menyetujui segala isi Syarat dan Ketentuan Penggunaan dan Pemberitahuan Privasi',
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                        softWrap: true,
                                        maxLines: 3,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 8),
                          SizedBox(
                            width: 200,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  elevation: 5,
                                  side: const BorderSide(color: Colors.grey)),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()),
                                );
                              },
                              child: const Text(
                                'Register',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 8),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()),
                              );
                            },
                            child: const Text(
                              'Sudah punya akun?',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
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
                  Color(0xFF677D86), // warna footer
                  Color(0xFF191E20), // warna footer
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