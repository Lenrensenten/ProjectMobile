import 'package:flutter/material.dart';
import 'package:projectmobile/presentation/Logreg/startpage.dart';

class ProfileMenu {
  static void showProfileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent, // Transparan agar lebih menarik
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
                leading: const Icon(Icons.settings, color: Colors.white),
                title: const Text('Settings',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Aksi untuk Settings
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.help_center, color: Colors.white),
                title: const Text('Pusat Bantuan',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Aksi untuk Pusat Bantuan
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.reviews, color: Colors.white),
                title:
                    const Text('Ulasan', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Aksi untuk Ulasan
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.favorite, color: Colors.white),
                title: const Text('Wishlist',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Aksi untuk Wishlist
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.white),
                title: const Text('Log Out',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Aksi untuk Log Out
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StartPage()));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}