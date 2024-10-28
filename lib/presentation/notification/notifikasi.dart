import 'package:flutter/material.dart';
import 'package:projectmobile/presentation/cart/keranjang.dart';
import 'package:projectmobile/presentation/transaksi/traksaksi.dart';
import 'package:projectmobile/widget/kategori.dart';
import 'package:projectmobile/widget/profilemenu.dart';
import '../dashboard/dashboard.dart';
import '../message/message.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NotificationPage createState() => _NotificationPage();
}

class _NotificationPage extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header dengan teks Notifikasi menggantikan search bar
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Teks 'Notifikasi' menggantikan search bar
                  const Text(
                    'Notifikasi',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  // Icon Keranjang
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Keranjang()));
                    },
                    icon: const Icon(Icons.shopping_cart, color: Colors.white),
                  ),
                  // Icon Pesan
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Message()));
                    },
                    icon: const Icon(Icons.message, color: Colors.white),
                  ),
                  // Akun Profil
                  IconButton(
                    onPressed: () {
                      ProfileMenu.showProfileMenu(context);
                    },
                    icon: const Icon(Icons.person, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          // Main content for notifications
          const Expanded(
            child: Center(
              child: Text(
                'Belum ada notifikasi',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          // Footer (same as in Dashboard)
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Baranda
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const Dashboard())); // Kembali ke Dashboard
                      },
                      icon: const Icon(Icons.home, color: Colors.white),
                    ),
                    const Text('Baranda',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
                // Notifikasi (active state, no action needed)
                Column(
                  children: [
                    IconButton(
                      onPressed: () {}, // Stay on Notification page
                      icon: const Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    ),
                    const Text('Notifikasi',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
                // Transaksi
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Transaksi()));
                      },
                      icon: const Icon(Icons.history, color: Colors.white),
                    ),
                    const Text('Transaksi',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
                // Kategori
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        CategoryMenu.showCategoryMenu(context);
                      },
                      icon: const Icon(Icons.category, color: Colors.white),
                    ),
                    const Text('Kategori',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}