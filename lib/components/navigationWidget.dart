import 'package:flutter/material.dart';

class NavigationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15)),
            color: Color(0xFF414141),
          ),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NavigationIcon(
                icon: Icons.home_rounded,
                label: 'Home',
                textColor: Color(0xFFFBB910),
                iconColor: Color(0xFFFBB910),
              ),
              NavigationIcon(
                icon: Icons.search_outlined,
              ),
              NavigationIcon(icon: Icons.shopping_cart_outlined),
              NavigationIcon(
                icon: Icons.person_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationIcon extends StatelessWidget {
  final IconData icon;
  final String? label;
  final Color? textColor;
  final Color? iconColor;

  const NavigationIcon({
    required this.icon,
    this.label,
    this.textColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: iconColor ?? Colors.white,
        ),
        SizedBox(height: 4),
        if (label != null)
          Text(
            label!,
            style: TextStyle(
                fontFamily: 'Poppins', color: textColor ?? Colors.white),
          ),
      ],
    );
  }
}
