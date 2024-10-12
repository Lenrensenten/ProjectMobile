import 'package:flutter/material.dart';

class TopupWidget extends StatefulWidget {
  @override
  _TopupWidgetState createState() => _TopupWidgetState();
}

class _TopupWidgetState extends State<TopupWidget> {
  TextEditingController _controller = TextEditingController(); // Controller untuk input field

  void _updateAmount(String amount) {
    setState(() {
      _controller.text = amount;
    });
  }

  void _clearInput() {
    setState(() {
      _controller.clear();
    });
  }

  void _deleteLastCharacter() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _controller.text = _controller.text.substring(0, _controller.text.length - 1);
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header Section
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromRGBO(70, 70, 70, 1),
                  width: 1,
                ),
                gradient: LinearGradient(
                  begin: Alignment(0.0, -0.2),
                  end: Alignment(7.35, 0.0),
                  colors: [
                    Color.fromRGBO(103, 125, 134, 1),
                    Color.fromRGBO(25, 30, 32, 1),
                  ],
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 17,
                    left: 20,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context); // Kembali ke halaman sebelumnya
                      },
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                  Positioned(
                    top: 17,
                    left: 65,
                    child: Text(
                      'Top up',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inria Serif',
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left: 73,
                    child: Text(
                      'Instan',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inria Serif',
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left: 223,
                    child: Text(
                      'Metode lain',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inria Serif',
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Outer Container wrapping input and amount options
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey, width: 1.5),
              ),
              child: Column(
                children: [
                  _buildTopupInput(),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildAmountOption('20,000'),
                      _buildAmountOption('50,000'),
                      _buildAmountOption('100,000'),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildAmountOption('150,000'),
                      _buildAmountOption('300,000'),
                      _buildAmountOption('500,000'),
                    ],
                  ),
                ],
              ),
            ),

            Spacer(),

            // Footer Section
            SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, -1),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Top up dengan',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        PopupMenuButton<String>(
                          icon: Icon(Icons.more_horiz, color: Colors.grey, size: 24),
                          onSelected: (value) {
                            if (value == 'option1') {
                              // Tindakan untuk opsi 1
                            } else if (value == 'option2') {
                              // Tindakan untuk opsi 2
                            }
                          },
                          itemBuilder: (BuildContext context) {
                            return [
                              PopupMenuItem<String>(
                                value: 'option1',
                                child: Text('alfa'),
                              ),
                              PopupMenuItem<String>(
                                value: 'option2',
                                child: Text('indo'),
                              ),
                            ];
                          },
                        ),
                      ],
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Konfirmasi & Top Up Rp ${_controller.text.isEmpty ? '0' : _controller.text}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.arrow_forward, color: Colors.black),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopupInput() {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Rp.0',
                border: InputBorder.none,
              ),
              style: TextStyle(
                fontFamily: 'Inika',
                fontSize: 18,
              ),
              onChanged: (text) {
                setState(() {});
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.clear, color: Colors.red),
            onPressed: _clearInput,
          ),
          IconButton(
            icon: Icon(Icons.backspace, color: Colors.grey),
            onPressed: _deleteLastCharacter,
          ),
        ],
      ),
    );
  }

  Widget _buildAmountOption(String amount) {
    return InkWell(
      onTap: () => _updateAmount(amount),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        child: Center(
          child: Text(
            amount,
            style: TextStyle(
              fontFamily: 'Inika',
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
