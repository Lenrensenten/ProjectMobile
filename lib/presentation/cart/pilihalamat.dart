import 'package:flutter/material.dart';

class PilihAlamat extends StatefulWidget {
  const PilihAlamat({super.key});

  @override
  _PilihAlamatState createState() => _PilihAlamatState();
}

class _PilihAlamatState extends State<PilihAlamat> {
  String? selectedAddress;

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
                    'Pilih Alamat',
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
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(color: Color(0xFF677D86)),
                  child: ListTile(
                    title: const Text('Rumah - Anna Isabela', style: TextStyle(color: Colors.white),),
                    onTap: () {
                      setState(() {
                        selectedAddress = 'Rumah - Anna Isabela';
                      });
                      Navigator.pop(context, selectedAddress); // Return selected address
                    },
                  ),
                ),
                const SizedBox(height: 4.0,),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(color: Color(0xFF677D86)),
                  child: ListTile(
                    title: const Text('Kantor - Anna Isabela', style: TextStyle(color: Colors.white),),
                    onTap: () {
                      setState(() {
                        selectedAddress = 'Kantor - Anna Isabela';
                      });
                      Navigator.pop(context, selectedAddress); // Return selected address
                    },
                  ),
                ),
                const SizedBox(height: 4.0,),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(color: Color(0xFF677D86)),
                  child: ListTile(
                    title: const Text('Tempat Lain', style: TextStyle(color: Colors.white),),
                    onTap: () {
                      setState(() {
                        selectedAddress = 'Tempat Lain';
                      });
                      Navigator.pop(context, selectedAddress); // Return selected address
                    },
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}