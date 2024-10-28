import 'package:flutter/material.dart';

class ShowSearchHistory extends StatefulWidget {
  final List<String> searchHistory;

  const ShowSearchHistory({super.key, required this.searchHistory});

  @override
  // ignore: library_private_types_in_public_api
  _ShowSearchHistoryState createState() => _ShowSearchHistoryState();
}

class _ShowSearchHistoryState extends State<ShowSearchHistory> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Pencarian'),
      ),
      body: Column(
        children: [
          Container(
            height: 40,
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
                    controller: _textController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Baju kekinian',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.searchHistory.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(widget.searchHistory[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        widget.searchHistory.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}