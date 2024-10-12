import 'package:flutter/material.dart';
// import '../cek_item/cek_item.dart'; // Halaman cek item untuk navigasi

class SearchBarWithHistory extends StatefulWidget {
  final List<String> searchHistory; // Daftar riwayat pencarian

  const SearchBarWithHistory({super.key, required this.searchHistory});

  @override
  _SearchBarWithHistoryState createState() => _SearchBarWithHistoryState();
}

class _SearchBarWithHistoryState extends State<SearchBarWithHistory> {
  TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<String> _filteredHistory = [];
  bool _showHistory = false;

  @override
  void initState() {
    super.initState();
    _filteredHistory = widget.searchHistory;
    _searchController.addListener(_onSearchChanged);
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      if (_searchController.text.isEmpty) {
        _filteredHistory = widget.searchHistory;
      } else {
        _filteredHistory = widget.searchHistory
            .where((history) => history
            .toLowerCase()
            .contains(_searchController.text.toLowerCase()))
            .toList();
      }
    });
  }

  void _onFocusChanged() {
    if (_focusNode.hasFocus) {
      setState(() {
        _showHistory = true; // Tampilkan history saat fokus
      });
    }
  }

  void hideHistory() {
    setState(() {
      _showHistory = false; // Sembunyikan history
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Ini untuk menyembunyikan history jika user menekan area di luar search bar
      onTap: () {
        hideHistory();
        FocusScope.of(context).unfocus(); // Menghilangkan fokus dari search bar
      },
      child: Stack(
        children: [
          Column(
            children: [
              // Search Bar
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    const Icon(Icons.search, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        focusNode: _focusNode,
                        controller: _searchController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Cari item di sini...',
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _searchController.clear();
                      },
                      icon: const Icon(Icons.clear, size: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (_showHistory && _filteredHistory.isNotEmpty)
            Positioned(
              top: 50, // Adjust this value as needed
              left: 0,
              right: 0,
              child: Container(
                margin: const EdgeInsets.only(top: 8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.3,
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _filteredHistory.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_filteredHistory[index]),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) =>
                        //         CekItemPage(searchQuery: _filteredHistory[index]),
                        //   ),
                        // );
                      },
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
