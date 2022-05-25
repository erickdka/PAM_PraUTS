import 'package:flutter/material.dart';

class IconCard extends StatelessWidget {
  final String judul;
  final String value;
  final IconData icon;

  const IconCard({this.judul, this.icon, this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              judul,
              style: TextStyle(color: Color(0xffbcc4cd), fontSize: 16),
            ),
            Icon(
              icon,
              size: 50,
            ),
            Text(
              value,
              style: TextStyle(fontSize: 18, color: Color(0xff090a0d)),
            )
          ],
        ),
      ),
    );
  }
}
