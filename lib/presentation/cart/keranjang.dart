import 'package:flutter/material.dart';
import 'package:projectmobile/presentation/message/message.dart';
import 'checkoutpage.dart';

class Keranjang extends StatefulWidget {
  const Keranjang({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Keranjang createState() => _Keranjang();
}

class _Keranjang extends State<Keranjang> {
  // Sample data for cart items
  final List<Map<String, dynamic>> cartItems = [
    {
      'title': 'Racing Jersey Warna Hitam...',
      'image':
          'assets/racing_jersey.png', // Ganti dengan asset image yang sesuai
      'price': 100000,
      'quantity': 1,
    },
    {
      'title': 'Kaos Kasual Never Give Up...',
      'image': 'assets/kaos_kasual.png', // Ganti dengan asset image yang sesuai
      'price': 75000,
      'quantity': 1,
    },
    {
      'title': 'Kaos Kasual Bahan Cotton...',
      'image': 'assets/kaos_cotton.png', // Ganti dengan asset image yang sesuai
      'price': 90000,
      'quantity': 1,
    },
  ];

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, top: 16.0, bottom: 16.0, right: 4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  'Keranjang',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Ubah',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                IconButton(
                  padding: const EdgeInsets.only(right: 16.0),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Message()));
                  },
                  icon: const Icon(Icons.message, color: Colors.white),
                ),
              ],
            ),
          ),

          // Main content (Cart items)
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blue, width: 1), // Border
                  ),
                  child: Row(
                    children: [
                      // Product Image
                      Image.asset(
                        item['image'],
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 16),
                      // Product details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item['title'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8),
                            Text('Rp ${item['price']}',
                                style: const TextStyle(color: Colors.black)),
                          ],
                        ),
                      ),
                      // Quantity
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.remove),
                          ),
                          Text('${item['quantity']}'),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
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
            ), // Warna footer
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total Rp0',
                      style: TextStyle(color: Colors.white)),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const CheckoutPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Warna tombol
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Checkout (0)',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}