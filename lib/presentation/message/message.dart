import 'package:flutter/material.dart';
import 'package:projectmobile/widget/profilemenu.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Messages createState() => _Messages();
}

class _Messages extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, top: 16.0, bottom: 16.0, right: 4.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      'Chat',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            ProfileMenu.showProfileMenu(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Main
              const Expanded(
                  child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Content of the messages page
                    Text('Chat Messages'),
                    // You can add a listview to display messages here
                  ],
                ),
              )),
              // Empty Footer
              Container(),
            ],
          ),
          // Floating action button at bottom-right corner
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                // Handle action for new chat
              },
              backgroundColor: const Color(0xFF677D86).withOpacity(0.7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50), // Circular border
              ),
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}