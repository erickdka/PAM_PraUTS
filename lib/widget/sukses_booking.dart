import 'package:flutter/material.dart';
import 'package:rental_mobil/HomePage.dart';

class SuksesBooking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Icon(
        Icons.check,
        size: 75,
        color: Colors.green,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Sukses Booking",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Container(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) {
                  return HomePage();
                }), (route) => false);
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "OK",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
