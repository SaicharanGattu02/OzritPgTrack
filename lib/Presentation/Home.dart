import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ozritpgpaytrack/utils/media_query_helper.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, String>> hostelers = [
    {'name': 'K. Ramu', 'phone': '8186071802', 'room': '101'},
    {'name': 'M. Kiran', 'phone': '8186071802', 'room': '102'},
    {'name': 'S. Sravan', 'phone': '8186071802', 'room': '103'},
    {'name': 'A. Rohit', 'phone': '8186071802', 'room': '104'},
    {'name': 'P. Sai', 'phone': '8186071802', 'room': '105'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: SizeConfig.screenWidth,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFEBEBFD), Color(0xFFEFEFFD)],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Image & Button
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      "assets/images/hostel image.png",
                      fit: BoxFit.cover,
                      width: SizeConfig.screenWidth,
                      height: SizeConfig.screenHeight * 0.2,
                    ),
                  ),
                  Positioned(
                    top: SizeConfig.screenHeight * 0.12,
                    left: SizeConfig.screenWidth * 0.25,
                    child: Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {
                          context.push("/new_hostler_details");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                        child: Text(
                          '+ Add Hosteler',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            color: Color(0xff9333EA),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Quick Stats
              Text(
                "Quick Stats",
                style: TextStyle(
                  color: Color(0xff374151),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  fontFamily: 'Roboto',
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _statCard(
                      '87',
                      'Active Hostelers',
                      "assets/icons/hostler_person.png",
                      Color(0xffDCFCE7),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _statCard(
                      '13',
                      'Pending Payments',
                      "assets/icons/pending-payments.png",
                      Color(0xffFFEDD5),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Financial Overview
              Text(
                "Financial Overview",
                style: TextStyle(
                  color: Color(0xff374151),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  fontFamily: 'Roboto',
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _statCard(
                      '₹2,600',
                      'Pending Money',
                      "assets/icons/currency.png",
                      Color(0xffFEE2E2),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _statCard(
                      '₹25,000',
                      'Expected Money',
                      "assets/icons/graph.png",
                      Color(0xffDBEAFE),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              _statCard(
                '₹25,000',
                'Received This Month',
                "assets/icons/check.png",
                Color(0xffDCFCE7),
                fullWidth: true,
              ),
              SizedBox(height: 16),
              // Recent Activity
              Text(
                "Recent Activity",
                style: TextStyle(
                  color: Color(0xff374151),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  fontFamily: 'Roboto',
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _statCard(
                      '2,600',
                      'New Joiners',
                      "assets/icons/newjoiners.png",
                      Color(0xffDCFCE7),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _statCard(
                      '25,000',
                      'Left PG',
                      "assets/icons/leftpg.png",
                      Color(0xffF3E8FF),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(
                'Hostelers',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff374151),
                ),
              ),
              SizedBox(height: 8),
              // Scrollable Hostelers List
              SizedBox(
                height: SizeConfig.screenHeight * 0.35, // Adjust height
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: hostelers.length,
                  itemBuilder: (context, index) {
                    final hosteler = hostelers[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 12),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(""),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      hosteler['name']!,
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff1F2937),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      hosteler['phone']!,
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff4B5563),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Room ${hosteler['room']}',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff6B7280),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      '02 Sharing',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff4B5563),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statCard(
    String value,
    String label,
    String icon,
    Color bgColor, {
    bool fullWidth = false,
  }) {
    return Container(
      width: fullWidth ? double.infinity : null,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff1F2937),
                ),
              ),
              Text(
                label,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff4B5563),
                ),
              ),
            ],
          ),
          Container(
            height: 32,
            width: 32,
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
            child: Image.asset(icon, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
