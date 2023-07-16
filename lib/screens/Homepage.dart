import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tkus/components/deliveryWidget.dart';
import 'package:tkus/components/bannerSlider.dart';
import 'package:tkus/components/cuisineSlider.dart';
import 'package:tkus/components/dishSlider.dart';
import 'package:tkus/components/restaurantList.dart';
import 'package:tkus/components/navigationWidget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> banners = [];
  List<dynamic> cuisines = [];
  List<dynamic> dishes = [];
  List<dynamic> restaurants = [];
  var isLoading = true;

  @override
  void initState() {
    super.initState();
    postData();
  }

  void postData() async {
    var url = Uri.parse(
        'https://production.tikusdelivery.com/api/guest/listRestaurant');

    try {
      var response = await http.post(
        url,
        body: jsonEncode({
          'pageNumber': 1,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);
        setState(() {
          banners = data['banners'];
          cuisines = data['cuisines'];
          dishes = data['dishes'];
          restaurants = data['listRestaurants'];
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Request failed with exception: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBFBFB),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30),
                isLoading
                    ? CircularProgressIndicator()
                    : banners != null
                        ? Column(
                            children: [
                              SizedBox(
                                height: 70,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 26.0, vertical: 22),
                                  child: Text(
                                    'Good Morning, Sol',
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Color(0xFF11C56B),
                                    ),
                                  ),
                                ),
                              ),
                              BannerSlider(banners: banners),
                              SizedBox(height: 30),
                              CuisineSlider(cuisines: cuisines),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 16.0,
                                    top: 8.0,
                                    right: 16.0,
                                    bottom: 8.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Breakfast | Lunch | Dinner',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Color(0xFF575757),
                                    ),
                                  ),
                                ),
                              ),
                              DishSlider(dishes: dishes),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 16.0,
                                    top: 8.0,
                                    right: 16.0,
                                    bottom: 0.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Near Me',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Color(0xFF575757),
                                    ),
                                  ),
                                ),
                              ),
                              RestaurantListWidget(restaurants: restaurants)
                            ],
                          )
                        : Text(
                            'No data available',
                            style: TextStyle(fontSize: 20),
                          ),
              ],
            ),
          ),
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              color: Colors.white,
              child: DeliveryWidget(),
            ),
          ),
          NavigationWidget(),
        ],
      ),
    );
  }
}
