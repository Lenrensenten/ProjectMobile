import 'package:flutter/material.dart';
import 'package:projectmobile/presentation/message/message.dart';
import 'package:projectmobile/widget/menubarang.dart';

class ProductDetailPage extends StatelessWidget {
  final String productName;
  final String productDescription;
  final int productPrice;
  final String productImage;
  final String productMaterial;
  final String productDesign;
  final String productAdvantage;
  final String productCare;
  final List<String> productSizes;
  final int productStock;

  const ProductDetailPage({
    super.key,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productImage,
    required this.productMaterial,
    required this.productDesign,
    required this.productAdvantage,
    required this.productCare,
    required this.productSizes,
    required this.productStock,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          productName,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
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
        ),
      ),
      body: SingleChildScrollView(
        // Tambahkan SingleChildScrollView di sini
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .start, // Atur CrossAxisAlignment agar teks berada di kiri
            children: [
              Center(
                child: Container(
                  width: 500,
                  height: 200,
                  decoration: const BoxDecoration(
                    border: Border.symmetric(
                        horizontal: BorderSide(color: Colors.black)),
                  ),
                  child: Image.asset(
                    productImage,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                productName,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Rp. $productPrice',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Deskripsi Produk',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                productDescription,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'Keunggulan Produk',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                productAdvantage,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'Cara Merawat',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                productCare,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'Ukuran',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                productSizes.join(', '),
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
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
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(5), // Optional
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Message()));
                },
                icon: const Icon(Icons.message, color: Colors.white),
              ),
            ),
            GestureDetector(
              onTap: () {
                MenuBarang.showBarangMenu(
                  context,
                  productName,
                  productImage,
                  productPrice,
                );
              },
              child: Container(
                width: 150,
                height: 50,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(5), // Optional
                  color: Colors.white,
                ),
                child: const Text(
                  'Beli Sekarang',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                MenuBarang.showBarangMenu(
                  context,
                  productName,
                  productImage,
                  productPrice,
                );
              },
              child: Container(
                width: 150,
                height: 50,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(5), // Optional
                  color: const Color(0x00ffbe3f),
                ),
                child: const Text(
                  '+Keranjang',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}