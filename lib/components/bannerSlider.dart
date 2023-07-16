import 'package:flutter/material.dart';

class BannerSlider extends StatefulWidget {
  final List<dynamic> banners;

  BannerSlider({required this.banners});

  @override
  _BannerSliderState createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    int initialPage = widget.banners.length *
        500; // Set initial page to a large value near the middle
    _pageController =
        PageController(initialPage: initialPage, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      child: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.banners.length *
            1000, // Set a large number for infinite loop
        itemBuilder: (BuildContext context, int index) {
          final int imageIndex =
              index % widget.banners.length; // Wrap around to the beginning

          return AnimatedBuilder(
            animation: _pageController,
            builder: (BuildContext context, Widget? child) {
              double value = 1.0;
              if (_pageController.position.haveDimensions) {
                value = _pageController.page! - index;
                value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
              }
              return Center(
                child: SizedBox(
                  height: Curves.easeOut.transform(value) *
                      170.0, // Adjust the maximum height as needed
                  width: Curves.easeOut.transform(value) *
                      320.0, // Adjust the maximum width as needed
                  child: child,
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.network(
                widget.banners[imageIndex]['bannerImage'],
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
