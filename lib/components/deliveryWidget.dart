import 'package:flutter/material.dart';

class DeliveryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      height: 90.0,
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
                  'Deliver to',
                  style: TextStyle(
                    fontFamily: 'Poppins',
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
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
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
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1.0,
                  blurRadius: 1.0,
                  offset: Offset(0, 1),
                ),
              ],
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: Color(0xFFD9D9D9)),
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
