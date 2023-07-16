import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CuisineSlider extends StatelessWidget {
  final List<dynamic> cuisines;

  CuisineSlider({required this.cuisines});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cuisines.length,
        itemBuilder: (BuildContext context, int index) {
          final String image = cuisines[index]['image'];

          if (image.toLowerCase().endsWith('.svg')) {
            return buildSvgImage(image, cuisines[index]['name']);
          } else {
            return buildNetworkImage(image, cuisines[index]['name']);
          }
        },
      ),
    );
  }

  Widget buildSvgImage(String imageUrl, String name) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(4.0),
            child: SvgPicture.network(
              imageUrl,
              placeholderBuilder: (BuildContext context) =>
                  CircularProgressIndicator(),
              width: 52, // Adjust the size as needed
              height: 52,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            name,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
              color: Color(0xFF575757),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNetworkImage(String imageUrl, String name) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(4.0),
            child: ClipOval(
              child: Image.network(
                imageUrl,
                width: 60, // Adjust the size as needed
                height: 60,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  );
                },
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return Text('Failed to load image');
                },
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            name,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
              color: Color(0xFF575757),
            ),
          ),
        ],
      ),
    );
  }
}
