import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _selectedLanguage = 'Bahasa Indonesia';
  String _userName = 'Loading...';
  String _userBio = 'Loading...';
  String? _userProfileImage;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      final user = FirebaseAuth.instance.currentUser; // Mendapatkan UID pengguna yang sedang login
      if(user != null){
        final userData = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        final data = userData.data();// Mengambil dokumen pengguna dari Firestore
        if (data != null) {
          _userName = data['name'] ?? 'Unknown User'; // Mengambil nama pengguna
          _userBio = data['bio'] ?? 'No bio available'; // Mengambil bio pengguna
          _userProfileImage = data['profileImageUrl']; // Mengambil URL gambar profil

        } else {
          print('User document does not exist.');
        }
      }
    } catch (e) {
      print('Error fetching user data: $e'); // Menampilkan pesan kesalahan jika gagal
      setState(() {
        _userName = 'Failed to load user'; // Menampilkan pesan kesalahan di UI
        _userBio = 'Please try again later'; // Menampilkan pesan kesalahan di UI
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Pengaturan Akun', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF607D8B),
        elevation: 1,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.chat_bubble_outline, color: Colors.white),
                onPressed: () {},
              ),
              Positioned(
                right: 11,
                top: 11,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6F6F6),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                radius: 30,
                backgroundImage: _userProfileImage != null ? NetworkImage(_userProfileImage!) : null,
                child: _userProfileImage == null ? const Icon(Icons.person) : null, // Icon jika tidak ada gambar profil
              ),
            ),
            title: Text(_userName), // Menampilkan nama pengguna
            subtitle: Text(_userBio), // Menampilkan bio pengguna
            trailing: GestureDetector(
              child: const Icon(Icons.edit),
              onTap: () {
                Get.toNamed('/editprofile');
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Akun Saya', style: TextStyle(color: Colors.grey)),
          ),
          ListTile(
            onTap: () {},
            title: const Text('Keamanan & Akun'),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
          ),
          ListTile(
            onTap: () {},
            title: const Text('Alamat Saya'),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
          ),
          ListTile(
            onTap: () {},
            title: const Text('Kartu / Rekening Bank'),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Pengaturan', style: TextStyle(color: Colors.grey)),
          ),
          ListTile(
            onTap: () {},
            title: const Text('Pengaturan Chat'),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
          ),
          ListTile(
            onTap: () {},
            title: const Text('Pengaturan Notifikasi'),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
          ),
          ListTile(
            title: const Text('Bahasa / Language'),
            subtitle: Text(_selectedLanguage, style: const TextStyle(color: Colors.grey)),
            trailing: DropdownButton(
              value: _selectedLanguage,
              items: const [
                DropdownMenuItem(
                  value: 'Bahasa Indonesia',
                  child: Text('Bahasa Indonesia'),
                ),
                DropdownMenuItem(
                  value: 'English',
                  child: Text('English'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedLanguage = value as String;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
