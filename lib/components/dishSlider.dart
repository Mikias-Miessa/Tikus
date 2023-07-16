import 'package:flutter/material.dart';

class DishSlider extends StatefulWidget {
  final List<dynamic> dishes;

  DishSlider({required this.dishes});

  @override
  _DishSliderState createState() => _DishSliderState();
}

class _DishSliderState extends State<DishSlider> {
  List<bool> isFavoriteList = [];
  List<int> counterList = [];

  @override
  void initState() {
    super.initState();
    // Initialize the favorite state for each dish
    isFavoriteList = List<bool>.filled(widget.dishes.length, false);
    counterList = List<int>.filled(widget.dishes.length, 0);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: widget.dishes.asMap().entries.map((entry) {
            final index = entry.key;
            final dish = entry.value;
            bool isFavorite = isFavoriteList[index];

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 0.2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  width: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          dish['image'],
                          height: 88,
                          width: 122,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              dish['name'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(189, 87, 87, 87),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isFavorite = !isFavorite;
                                isFavoriteList[index] = isFavorite;
                              });
                            },
                            child: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              size: 16,
                              color: isFavorite ? Colors.red : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.local_restaurant,
                                size: 10,
                                color: Color(0xFFFBB910),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '${dish['outlet']}',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xFFFBB910),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(63, 17, 197, 107),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 2,
                                  left: 6,
                                  right: 6,
                                  top: 2,
                                ),
                                child: Text(
                                  '${dish['price'].toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 13, 156, 85),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              ' ETB ',
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF939393),
                              ),
                            ),
                          ),
                          SizedBox(width: 4),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                            padding: EdgeInsets.all(2),
                            child: Icon(
                              Icons.add,
                              size: 12,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
