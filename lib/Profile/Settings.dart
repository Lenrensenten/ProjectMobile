import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _selectedLanguage = 'Bahasa Indonesia';

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