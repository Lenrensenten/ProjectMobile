import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF677D86), // warna header
              Color(0xFFFFFFFF), // warna body
              Color(0xFF677D86), // warna footer
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: Column(
          children: [
            // Header
            Container(
              height: 80,
              color: const Color(0xFF677D86),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Add this
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: SizedBox.shrink(), // Add this
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0, top: 16.0),
                    child: Container(
                      // Add this
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: const Color(0xFF677D86),
                            width: 2), // Add this
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.question_mark,
                          color: Colors.black,
                          size: 24,
                        ),
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
                    // Logo aplikasi
                    Image.asset(
                      'assets/logo.png', // ganti dengan logo aplikasi Anda
                      width: 150,
                      height: 150,
                    ),
                    // Tombol login dan register
                    Column(
                      // Change Row to Column
                      children: [
                        SizedBox(
                          width: 150, // Add this
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            onPressed: () {},
                            child: Text('Login',
                                style: TextStyle(color: Colors.black)),
                          ),
                        ),
                        SizedBox(height: 16),
                        SizedBox(
                            width: 150, // Add this
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: Text('Register',
                                  style: TextStyle(color: Colors.black)),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Footer
            Container(height: 80, color: const Color(0xFF677D86))
          ],
        ),
      ),
    );
  }
}
