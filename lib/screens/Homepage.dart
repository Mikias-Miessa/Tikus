import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tkus/components/deliveryWidget.dart';
import 'package:tkus/components/bannerSlider.dart';
import 'package:tkus/components/cuisineSlider.dart';
import 'package:tkus/components/dishSlider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> banners = [];
  List<dynamic> cuisines = [];
  List<dynamic> dishes = [];
  var isLoading = true; // Added variable to track loading state

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
          isLoading = false;
        });
      } else {
        // Handle error
        setState(() {
          isLoading = false;
        });
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Request failed with exception: $e');
      setState(() {
        isLoading = false; // Set loading state to false in case of exception
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBFBFB),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            DeliveryWidget(),
            isLoading
                ? CircularProgressIndicator()
                : banners != null
                    ? Column(
                        children: [
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
                                left: 16.0, top: 8.0, right: 16.0, bottom: 8.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Breakfast | lunch | Dinner',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Color(0xFF575757),
                                ),
                              ),
                            ),
                          ),
                          DishSlider(dishes: dishes),
                        ],
                      )
                    : Text(
                        'No data available',
                        style: TextStyle(fontSize: 20),
                      ),
          ],
        ),
      ),
    );
  }
}
