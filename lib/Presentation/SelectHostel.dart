import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ozritpgpaytrack/Components/CutomAppBar.dart';

class SelectHostel extends StatelessWidget {
  final List<Map<String, String>> hostels = [
    {
      'name': 'PRIYANKA MENS PG',
      'location': 'Kondapur, Hyderabad',
      'image': 'assets/images/hostel image.png',
    },
    {
      'name': 'KINGS MENS PREMIUM PG',
      'location': 'Old town, Hyderabad',
      'image': 'assets/images/hostel image.png',
    },
    {
      'name': 'RAMANA LADIES PG',
      'location': 'Madhapur, Hyderabad',
      'image': 'assets/images/hostel image.png',
    },
    {
      'name': 'SRI HARSHA MENS PG',
      'location': 'Gachibowli, Hyderabad',
      'image': 'assets/images/hostel image.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(
        0xffECECFD,
      ), // Light grey background for the screen
      appBar: CustomAppBar1(title: 'Select Hostels', actions: [],color: Colors.white,),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Hostels',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xffDEDEDE)),
                ),
                prefixIcon: Icon(Icons.search, color: Color(0xff5E6167)),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: hostels.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(onTap: () {
                    context.push("/dashboard");
                  },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(12),
                              child: Image.asset(
                                hostels[index]['image']!,

                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 12),
                            // Hostel Name and Location
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  hostels[index]['name']!,
                                  style: TextStyle(
                                    color: Color(0xff121111),
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Roboto',
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  hostels[index]['location']!,
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff666666),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
