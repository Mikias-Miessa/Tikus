import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tkus/components/deliveryWidget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> banners = [];
  var isLoading = true; // Added variable to track loading state

  @override
  void initState() {
    super.initState();
    postData();
  }

  void postData() async {
    var url =
        Uri.parse('https://staging.tikusdelivery.com/api/guest/listRestaurant');

    try {
      var response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'pageNumber': 1,
          }));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          banners = data['banners'];
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
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
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
                                fontSize: 34,
                                color: Color(0xFF11C56B),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 200.0,
                          child: PageView.builder(
                            itemCount: banners.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Image.network(
                                banners[index]['bannerImage'],
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                      ],
                    )
                  : Text(
                      'No data available',
                      style: TextStyle(fontSize: 20),
                    ),
        ],
      ),
    );
  }
}
