import 'package:flutter/material.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final List<Map<String, dynamic>> _wishlistItems = [
    {
      'name': 'Rucas T-Shirt',
      'price': 'Rp100.000',
      'image': 'assets/racing_jersey.png',
      'sold': '50+ Terjual • 2.4 rb',
      'cashback': true,
    },
    {
      'name': 'Jack Nicklaus Polo',
      'price': 'Rp100.000',
      'originalPrice': 'Rp250.000',
      'image': 'assets/kaos_kasual.png',
      'sold': '10+ Terjual • 2.4 rb',
      'cashback': false,
    },
    {
      'name': 'Uniqlo Training',
      'price': 'Rp150.000',
      'originalPrice': 'Rp100.000',
      'image': 'assets/kaos_cotton.png',
      'sold': '50+ Terjual • 2 rb',
      'cashback': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF607D8B),
        title: const Text('Wishlist', style: TextStyle(color: Colors.white)), // Set text color to white
        iconTheme: const IconThemeData(color: Colors.white), // Set icon color to white
      ),
      body: ListView.builder(
        itemCount: _wishlistItems.length,
        itemBuilder: (context, index) {
          final item = _wishlistItems[index];
          return Card(
            color: const Color(0xFF88959C), // Set background color of the card
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Product Image
                      Image.asset(
                        item['image'],
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['name'],
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  item['price'],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF212121),
                                  ),
                                ),
                                if (item['originalPrice'] != null) ...[
                                  const SizedBox(width: 8),
                                  Text(
                                    item['originalPrice'],
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              item['sold'],
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF212121),
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Color(0xFF212121)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('+ Keranjang'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tambah item baru ke wishlist
          showDialog(
            context: context,
            builder: (context) {
              String newItem = '';
              return AlertDialog(
                title: const Text('Tambah Item'),
                content: TextField(
                  onChanged: (value) {
                    newItem = value;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Masukkan item baru',
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Batal'),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _wishlistItems.add({
                          'name': newItem,
                          'price': 'Rp100.000',
                          'image': 'assets/kaos_kasual.png',
                          'sold': '0 Terjual',
                          'cashback': false,
                        });
                      });
                      Navigator.pop(context);
                    },
                    child: const Text('Simpan'),
                  ),
                ],
              );
            },
          );
        },
        backgroundColor: const Color(0xFF607D8B),
        child: const Icon(Icons.add, color: Colors.white), // Set icon color to white
      ),
    );
  }
}