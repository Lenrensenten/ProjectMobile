import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'presentation/Logreg/startpage.dart';
import 'firebase_options.dart'; // Pastikan Anda memiliki file ini

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Pastikan ini terkonfigurasi dengan benar
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopedia',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const StartPage(),
    );
  }
}
