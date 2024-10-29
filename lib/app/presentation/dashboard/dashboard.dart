import 'package:flutter/material.dart';
import 'package:projectmobile/app/presentation/item/detailproduk.dart';
import 'package:projectmobile/app/widget/kategori.dart';
import '../message/chat_screen.dart';
import '../notification/notifikasi.dart';
import '../transaksi/traksaksi.dart';
import '../cart/keranjang.dart';
import '../../widget/profilemenu.dart';
import '../../widget/showsearchhistory.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  _Dashboard createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  List<String> searchHistory = [
    "Baju kekinian",
    "Celana jeans",
    "Jaket kulit",
    "Sepatu sneaker",
    "Topi stylish"
  ]; // Daftar search history

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
                  // Search Bar
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 12),
                          const Icon(Icons.search, size: 20),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText:
                                    'Baju kekinian', // Placeholder sesuai gambar
                              ),
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => ShowSearchHistory(
                                        searchHistory: searchHistory));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
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
                    }, // Tampilkan menu saat ditekan
                    icon: const Icon(Icons.person, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),
          // Wallet Balance (Poin Section)
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              color: const Color(0xFF677D86),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    // Ikon Dompet
                    Icon(Icons.wallet_travel, color: Colors.white, size: 24),
                    SizedBox(width: 8),
                    Text(
                      '0 Poin',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_upward),
                            iconSize: 15,
                            onPressed: () {},
                          ),
                        ),
                        Text("Bayar", style: TextStyle(color: Colors.white, fontSize: 12),),
                      ],
                    ),
                    const SizedBox(width: 8),
                    Column(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.wallet),
                            iconSize: 15,
                            onPressed: () {Get.toNamed('/topup');},
                          ),
                        ),
                        const Text("Top Up", style: TextStyle(color: Colors.white, fontSize: 12),),
                      ],
                    ),
                    const SizedBox(width: 4),
                    Column(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.more_horiz),
                            iconSize: 15,
                            onPressed: () {},
                          ),
                        ),
                        Text("Lainnya", style: TextStyle(color: Colors.white, fontSize: 12),),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Horizontal Categories
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                // Promo button
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text('Promo', style: TextStyle(color: Colors.white)),
                  ),
                ),
                // Lagi Populer button
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text('Lagi Populer',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                // Diskon button
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 108, 255, 133),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child:
                        Text('Diskon', style: TextStyle(color: Colors.white)),
                  ),
                ),
                // Murah Mampus button
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 247, 97, 247),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text('Murah Mampus',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          // Featured Products
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
              child: ListView(
                children: [
                  // Produk Promo 1
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 180,
                        child: Column(
                          children: [
                            IconButton(onPressed: (){}, icon: Image.asset('assets/promo_baju1.png', height: 170),),
                            const SizedBox(height: 8),
                            const Text('Promo Baju Kekinian!!'),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 180,
                        child: Column(
                          children: [
                            IconButton(onPressed: (){}, icon: Image.asset('assets/promo_baju2.png', height: 170),),
                            const SizedBox(height: 8),
                            const Text(
                              'Baju yang awet sampai ke Masa tua',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(height: 16),
                  // Tambahan produk jika ada
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.home, color: Colors.white)),
                    const Text('Beranda',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const NotificationPage()));
                        },
                        icon: const Icon(Icons.notifications,
                            color: Colors.white)),
                    const Text('Notifikasi',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Transaksi()));
                        },
                        icon: const Icon(Icons.history, color: Colors.white)),
                    const Text('Transaksi',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          CategoryMenu.showCategoryMenu(context);
                        },
                        icon: const Icon(Icons.category, color: Colors.white)),
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
