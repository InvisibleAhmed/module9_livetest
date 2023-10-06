/*Kazi Shahed Ahmed
Flutter Batch : 4
Module - 9 : LiveTest
 */

import 'package:flutter/material.dart';

void main() {
  runApp(SizeSelectorApp());
}

class SizeSelectorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Size Selector App',
      home: SizeSelectorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SizeSelectorScreen extends StatefulWidget {
  @override
  _SizeSelectorScreenState createState() => _SizeSelectorScreenState();
}

class _SizeSelectorScreenState extends State<SizeSelectorScreen> {
  String selectedSize = ''; // To store the selected size

  void _updateSelectedSize(String newSize) {
    // Update the selected size and show a Snackbar
    setState(() {
      selectedSize = newSize;
    });
    final snackBar = SnackBar(
      content: Text('Selected Size: $newSize'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Function to create a SizeButton
  Widget _buildSizeButton(String size) {
    return MouseRegion(
      onEnter: (_) {
        // Change button color on hover
        setState(() {
          selectedSize = size;
        });
      },
      onExit: (_) {
        // Reset button color when not hovered
        setState(() {
          selectedSize = '';
        });
      },
      child: ElevatedButton(
        onPressed: () {
          _updateSelectedSize(size);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            size == selectedSize ? Colors.orange: Colors.grey,
          ),
        ),
        child: Text(size),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Size Selector'),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildSizeButton('S'),
            _buildSizeButton('M'),
            _buildSizeButton('L'),
            _buildSizeButton('XL'),
            _buildSizeButton('XXL'),
            _buildSizeButton('XXXL'),
          ],
        ),
      ),
    );
  }
}
