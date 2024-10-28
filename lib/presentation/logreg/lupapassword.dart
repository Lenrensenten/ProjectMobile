import 'package:flutter/material.dart';
import 'package:projectmobile/presentation/Logreg/loginpage.dart';

class LupaPasswordPage extends StatefulWidget {
  const LupaPasswordPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LupaPasswordPage createState() => _LupaPasswordPage();
}

class _LupaPasswordPage extends State<LupaPasswordPage> {
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

        //Body
        // Body
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text Login
                Container(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: const Text(
                    'Lupa Password',
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
                            labelText: 'Email',
                            border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.grey),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),
                        // Tombol Login
                        const SizedBox(
                          height: 200,
                        ),
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
                                      builder: (context) =>
                                          const Lupapasswordlanjutan()));
                            },
                            child: const Text(
                              'Kirim Reset Kode',
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
    ));
  }
}

class Lupapasswordlanjutan extends StatefulWidget {
  const Lupapasswordlanjutan({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Lupapasswordlanjutan createState() => _Lupapasswordlanjutan();
}

class _Lupapasswordlanjutan extends State<Lupapasswordlanjutan> {
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

        //Body
        // Body
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text Login
                Container(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: const Text(
                    'Lupa Password',
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
                        //New Password
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'New Password',
                            border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.grey),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Confirm New Password',
                            border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.grey),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),
                        // Tombol Login
                        const SizedBox(
                          height: 130,
                        ),
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
                                      builder: (context) => const LoginPage()));
                            },
                            child: const Text(
                              'Kirim Reset Kode',
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
    ));
  }
}