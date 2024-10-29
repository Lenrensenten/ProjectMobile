import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:projectmobile/app/presentation/Logreg/loginpage.dart';
import 'package:projectmobile/app/presentation/Logreg/registerpage.dart';
import 'package:projectmobile/app/presentation/Logreg/regverif.dart';
import 'package:projectmobile/app/presentation/cart/topuppage.dart';
import 'package:projectmobile/app/presentation/dashboard/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/app/Profile/pusat_bantuan.dart';
import '/app/presentation/Logreg/startpage.dart';
import 'app/model/firebase_options.dart'; // Pastikan Anda memiliki file ini
import 'package:get/get.dart';

import 'app/profile/edit_profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Pastikan ini terkonfigurasi dengan benar
  );
  await Get.putAsync(() async => await SharedPreferences.getInstance());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Shopedia',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/welcome',
      getPages: [
        GetPage(name: '/welcome', page: () => const StartPage()),  // Halaman welcome
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/register', page: () => const RegisterPage()),
        GetPage(name: '/regver', page: () => const Regverif()),  // Halam// Halaman register
        GetPage(name: '/home', page: () => const Dashboard()),
        GetPage(name: '/pusatbantuan', page: () => const PusatBantuanPage()),
        GetPage(name: '/topup', page: () => const TopUpPage()),
        GetPage(name: '/editprofile', page: () => const EditProfile()),
      ],
    );
  }
}
