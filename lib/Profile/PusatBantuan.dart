import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PusatBantuanPage(),
    );
  }
}

class PusatBantuanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: const Color(0xFF607D8B),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Navigasi kembali ke halaman sebelumnya
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Pusat Bantuan',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height,
          child: Column(
            children: [
              Container(
                color: const Color(0xFF607D8B),
                padding: const EdgeInsets.all(16),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    hintText: 'Cari',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'FAQ',
                            style: TextStyle(
                                color: Colors.grey[800], fontSize: 18),
                          ),
                          Text(
                            'Lihat semuanya',
                            style: TextStyle(color: Colors.grey[800]),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Wrap(
                        spacing: 8,
                        children: [
                          Chip(
                            label: Text('Penawaran & Hadiah'),
                            backgroundColor: Colors.white,
                          ),
                          Chip(
                            label: Text('Pembayaran'),
                            backgroundColor: Colors.white,
                          ),
                          Chip(
                            label: Text('Pesanan & Pengiriman'),
                            backgroundColor: Colors.white,
                          ),
                          Chip(
                            label: Text('Informasi'),
                            backgroundColor: Colors.white,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: ListView(
                          children: [
                            Text(
                              '[Pesanan Dan Pengiriman] Bagaimana cara mengetahui estimasi waktu pengiriman pesanan?',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              '[Pesanan Dan Pengiriman] Di mana saya melihat status pesanan saya?',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              '[Pesanan Dan Pengiriman] Apakah saya dapat membatalkan pesanan saya?',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              '[Keamanan Akun] Bagaimana cara menjaga keamanan akun saya?',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Lihat lebih banyak',
                            style: TextStyle(color: Color(0xFF212121)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: const Color(0xFF607D8B),
                padding: const EdgeInsets.all(16),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'HUBUNGI KAMI',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.chat, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          'Chat Sekarang',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.phone, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          'Telepon Kami',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}