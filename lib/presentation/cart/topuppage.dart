import 'package:flutter/material.dart';

class TopUpPage extends StatefulWidget {
  const TopUpPage({super.key});

  @override
  _TopUpPageState createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  int selectedAmount = 0; // Menyimpan jumlah yang dipilih
  String selectedMethod = 'Instan'; // Menyimpan metode yang dipilih
  final TextEditingController _controller = TextEditingController(); // Controller untuk input field

  // Daftar nominal untuk top up
  final List<int> amounts = [20000, 50000, 100000, 150000, 300000, 500000];

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller when the widget is removed from the widget tree
    super.dispose();
  }

  void _updateAmount(int amount) {
    setState(() {
      selectedAmount = amount;
      _controller.text = 'Rp. $amount'; // Update the input field with the selected amount
    });
  }

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
                    'Top Up',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Menu Pilihan
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedMethod = 'Instan';
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 72.5, vertical: 10),
                  decoration: BoxDecoration(
                    color: selectedMethod == 'Instan' ? const Color(0xFF48585E) : const Color(0xFF677D86),
                  ),
                  child: const Text(
                    'Instan',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedMethod = 'Metode Lain';
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 10),
                  decoration: BoxDecoration(
                    color: selectedMethod == 'Metode Lain' ? const Color(0xFF48585E) : const Color(0xFF677D86),

                  ),
                  child: const Text(
                    'Metode Lain',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Konten berdasarkan pilihan metode
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: selectedMethod == 'Instan'
                  ? _buildInstantTopUp()
                  : _buildOtherMethods(),
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
                Text(
                  'Konfirmasi & Top Up\n${_controller.text.isEmpty ? 'Rp. 0' : _controller.text}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Aksi untuk mengkonfirmasi dan top up
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    backgroundColor: Colors.orange,
                  ),
                  child: const Text('Konfirmasi & Top Up',
                      style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInstantTopUp() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Masukkan Nominal:',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Rp.0',
            ),
            readOnly: true, // Make it read-only, user selects amount through buttons
          ),
          const SizedBox(height: 16),
          Center( // Center the buttons
            child: Wrap(
              spacing: 8.0,
              alignment: WrapAlignment.center, // Center the buttons within the Wrap
              children: amounts.map((amount) {
                return ElevatedButton(
                  onPressed: () => _updateAmount(amount),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedAmount == amount ? const Color(0xFF48585E) : const Color(0xFF677D86),
                  ),
                  child: Text('${amount / 1000} k', style: TextStyle(color: Colors.white),),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOtherMethods() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Pilih metode pembayaran lain:',
            style: TextStyle(fontWeight: FontWeight.bold)),
        // Tambahkan widget untuk metode lain di sini
        // Misalnya, bisa menggunakan ListTile untuk menampilkan metode pembayaran
        ListTile(
          leading: Icon(Icons.payment),
          title: Text('Transfer Bank'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          leading: Icon(Icons.wallet),
          title: Text('Dompet Digital'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        // Tambahkan metode pembayaran lain sesuai kebutuhan
      ],
    );
  }
}