import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/setting_controller.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final SettingsController controller = Get.put(SettingsController());

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
          Obx (() => ListTile(
            leading: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                radius: 30,
                backgroundImage: controller.userProfileImage.value.isNotEmpty
                    ? NetworkImage(controller.userProfileImage.value)
                    : null,
                child: controller.userProfileImage.value.isEmpty
                    ? const Icon(Icons.person)
                    : null,
              ),
            ),
            title: Text(controller.userName.value),
            subtitle: Text(controller.userBio.value),
            trailing: GestureDetector(
              child: const Icon(Icons.edit),
              onTap: () {
                Get.toNamed('/editprofile');
              },
            ),
          )),
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
            subtitle: const Text('Bahasa Indonesia', style: TextStyle(color: Colors.grey)),
            trailing: DropdownButton(
              value: 'Bahasa Indonesia',
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
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}
