import 'package:flutter/material.dart';
import '../message/message.dart';
import '../notification/notifikasi.dart';
import '../transaksi/traksaksi.dart';
import '../cart/keranjang.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Dashboard createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
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
                      child: const Row(
                        children: [
                          SizedBox(width: 12),
                          Icon(Icons.search, size: 20),
                          SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText:
                                    'Baju kekinian', // Placeholder sesuai gambar
                              ),
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
                    onPressed: () {},
                    icon: const Icon(Icons.person, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
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
                    Icon(Icons.wallet_travel,
                        color: Colors.white, size: 24), // Ikon dompet
                    SizedBox(width: 8), // Jarak antara ikon dan teks
                    Text(
                      '0 Poin', // Menampilkan saldo poin sesuai gambar
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Bayar'),
                    ),
                    const SizedBox(width: 4),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Top Up'),
                    ),
                    const SizedBox(width: 4),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Lainnya'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
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
                    color: Colors.redAccent, // Warna sesuai dengan gambar
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
                    color: Colors.orangeAccent, // Warna sesuai dengan gambar
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text('Lagi Populer',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
          // Featured Products
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  // Produk Promo 1
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Image.asset('assets/promo_baju1.png',
                              height: 180), // Gambar produk
                          const SizedBox(height: 8),
                          const Text('Promo Baju Kekinian!!'),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset('assets/promo_baju2.png',
                              height: 180), // Gambar produk
                          const SizedBox(height: 8),
                          const Text(
                            'Baju yang awet sampai \nke Masa tua', // Membagi teks menjadi dua baris
                            textAlign: TextAlign
                                .center, // Menjaga teks agar tetap rapi di tengah
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Disko button moved to body
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0), // Jarak atas dan bawah
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          255, 0, 255, 0), // Warna sesuai dengan gambar
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child:
                          Text('Disko', style: TextStyle(color: Colors.white)),
                    ),
                  ),
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
                // Baranda
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.home, color: Colors.white),
                    ),
                    const Text('Baranda',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
                // Notifikasi
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
                      icon:
                          const Icon(Icons.notifications, color: Colors.white),
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
                      icon: const Icon(Icons.list, color: Colors.white),
                    ),
                    const Text('Transaksi',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
                // Kategori
                Column(
                  children: [
                    IconButton(
                        onPressed: () {},
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
