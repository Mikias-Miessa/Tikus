import 'package:flutter/material.dart';

class DeliveryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      height: 80.0,
      padding: EdgeInsets.symmetric(horizontal: 26.0, vertical: 20),
      color: Color(0xFFFBFBFB),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Delivered to',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0,
                    color: Color(0xFF575757),
                  ),
                ),
                SizedBox(height: 4.0),
                Row(
                  children: [
                    Text(
                      '12th Street, Wosen Grocery',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Color(0xFF575757),
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 16.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 8.0),
          Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: Colors.grey),
            ),
            child: Center(
              child: Icon(
                Icons.check,
                color: Color.fromARGB(255, 255, 255, 255),
                size: 24.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
