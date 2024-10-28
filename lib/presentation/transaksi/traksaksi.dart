import 'package:flutter/material.dart';
import 'package:projectmobile/presentation/cart/keranjang.dart';
import 'package:projectmobile/presentation/notification/notifikasi.dart';
import 'package:projectmobile/widget/kategori.dart';
import 'package:projectmobile/widget/profilemenu.dart';
import '../dashboard/dashboard.dart';
import '../message/message.dart';

class Transaksi extends StatefulWidget {
  const Transaksi({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Transaksi createState() => _Transaksi();
}

class _Transaksi extends State<Transaksi> {
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Teks 'Transaksi'
                  const Text(
                    'Transaksi',
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
                          builder: (context) => const Message(),
                        ),
                      );
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
          const SizedBox(
            height: 16.0,
          ),

          Container(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            margin: const EdgeInsets.only(bottom: 16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari Transaksi',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(),
                ),
              ),
            ),
          ),
          // Section untuk Semua Status, Semua Produk, dan Semua Tanggal
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 16.0),
                  margin: const EdgeInsets.only(right: 16.0),
                  child: DropdownButton<String>(
                    hint: const Text('Semua Status'),
                    items: <String>['Status 1', 'Status 2', 'Status 3']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {},
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 16.0),
                  child: DropdownButton<String>(
                    hint: const Text('Semua Produk'),
                    items: <String>['Produk 1', 'Produk 2', 'Produk 3']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {},
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 16.0),
                  child: DropdownButton<String>(
                    hint: const Text('Semua Tanggal'),
                    items: <String>['Tanggal 1', 'Tanggal 2', 'Tanggal 3']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {},
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Main content for transactions
          const Expanded(
            child: Center(
              child: Text(
                'Belum ada transaksi',
                style: TextStyle(fontSize: 16),
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
                            builder: (context) => const Dashboard(),
                          ),
                        ); // Kembali ke Dashboard
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
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const NotificationPage()));
                      }, // Stay on Notification page
                      icon: const Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    ),
                    const Text('Notifikasi',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
                // Transaksi (active state, no action needed)
                Column(
                  children: [
                    IconButton(
                      onPressed: () {}, // Stay on Transaksi page
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