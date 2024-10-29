import 'package:flutter/material.dart';

class CategoryMenu {
  static void showCategoryMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: Color(0xFF677D86),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.shopping_bag, color: Colors.white),
                title: const Text('Aksesoris',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Aksi untuk Aksesoris
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.shopping_bag, color: Colors.white),
                title: const Text('Pakaian Dalam',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Aksi untuk Pakaian Dalam
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.shopping_bag, color: Colors.white),
                title: const Text('Perangkat Sholat',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Aksi untuk Perangkat Sholat
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.shopping_bag, color: Colors.white),
                title:
                    const Text('Mukena', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Aksi untuk Mukena
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.shopping_bag, color: Colors.white),
                title:
                    const Text('Sarung', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Aksi untuk Sarung
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.shopping_bag, color: Colors.white),
                title: const Text('Alas Kaki',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Aksi untuk Alas Kaki
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}