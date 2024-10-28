import 'package:flutter/material.dart';
import 'package:projectmobile/presentation/cart/pilihalamat.dart';
import 'package:projectmobile/presentation/cart/topuppage.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String selectedShippingMethod = "Reguler"; // Contoh untuk memilih metode pengiriman
  String noteToSeller = ""; // Catatan untuk penjual
  String selectedAddress = 'Alamat belum dipilih'; // Untuk menyimpan alamat terpilih

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header
          // Header
          Container(
            height: 80,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF191E20), // Header color
                  Color(0xFF677D86), // Header color
                ],
                stops: [0.0, 0.6],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Checkout',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Address Selection
                  GestureDetector(
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PilihAlamat()),
                      );
                      if (result != null) {
                        setState(() {
                          selectedAddress = result; // Update the selected address
                        });
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Alamat pengiriman kamu',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.home, color: Colors.black54),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  selectedAddress,
                                  style: TextStyle(color: Colors.black54),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Produk
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Image.asset('assets/promo_baju1.png', width: 80, height: 80), // Ganti dengan gambar produk
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'TERLARIS Paket Bundlling 3 Pcs Ser...',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4),
                              Text('Bebas Pengembalian'),
                              Text('Variasi: Model XL'),
                              Text('1 x Rp151.990'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Voucher Toko
                  ListTile(
                    leading: const Icon(Icons.confirmation_num, color: Colors.black),
                    title: const Text('Voucher Toko'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // Logika pemilihan voucher
                    },
                  ),
                  // Metode Pengiriman
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Pilih metode pengiriman:',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        RadioListTile(
                          title: const Text('Reguler - JNE (Rp17.000)'),
                          subtitle: const Text('Estimasi Tiba 26 - 29 Sep'),
                          value: "Reguler",
                          groupValue: selectedShippingMethod,
                          onChanged: (value) {
                            setState(() {
                              selectedShippingMethod = value.toString();
                            });
                          },
                        ),
                        RadioListTile(
                          title: const Text('Express - J&T (Rp25.000)'),
                          subtitle: const Text('Estimasi Tiba 24 - 26 Sep'),
                          value: "Express",
                          groupValue: selectedShippingMethod,
                          onChanged: (value) {
                            setState(() {
                              selectedShippingMethod = value.toString();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Catatan untuk penjual
                  ListTile(
                    leading: const Icon(Icons.note_add, color: Colors.black),
                    title: TextField(
                      decoration: const InputDecoration(
                          hintText: 'Kasih catatan untuk penjual...'),
                      onChanged: (value) {
                        setState(() {
                          noteToSeller = value;
                        });
                      },
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                  const SizedBox(height: 16),
                  // Voucher
                  ListTile(
                    leading: const Icon(Icons.local_offer, color: Colors.red),
                    title: const Text('Voucher'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // Logika pemilihan voucher
                    },
                  ),
                  const SizedBox(height: 16),
                  // Metode Pembayaran
                  ListTile(
                    leading: const Icon(Icons.payment, color: Colors.black),
                    title: const Text('Pilih metode Pembayaran'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // Logika metode pembayaran
                    },
                  ),
                  const SizedBox(height: 16),
                  // Rincian Pembayaran
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Rincian Pembayaran',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 8),
                        Text('Subtotal untuk produk: Rp151.990'),
                        Text('Subtotal pengiriman: Rp17.000'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Footer
          Container(
            height: 80,
            padding: const EdgeInsets.all(12.0),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Pembayaran\nRp. 168.990',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TopUpPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    backgroundColor: Colors.orange,
                  ),
                  child: const Text('Buat Pesanan',
                      style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}