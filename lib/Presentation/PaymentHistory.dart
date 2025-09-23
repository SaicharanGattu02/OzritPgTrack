import 'package:flutter/material.dart';
import 'package:ozritpgpaytrack/Components/CutomAppBar.dart';

import '../utils/media_query_helper.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({super.key});

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar1(
        title: "Payment  History",
        actions: [
          Container(
            padding: EdgeInsets.only(right: 10),
            child: Image.asset(
              "assets/icons/filter.png",
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
      body: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFEBEBFD), Color(0xFFEFEFFD)],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            // Icon Container
                            Container(
                              height: 46,
                              width: 46,
                              decoration: BoxDecoration(
                                color: Color(0xffE8EBF2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.currency_rupee,
                                size: 24,
                                color: Color(0xff0D121C),
                              ),
                            ),
                            SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "₹1,200",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Roboto",
                                    color: Color(0xff0D121C),
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "12 Sep 2025",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff4F6996),
                                  ),
                                ),
                              ],
                            ),

                            const Spacer(),

                            // Green dot
                            Container(
                              height: 14,
                              width: 14,
                              decoration: const BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                      );
                    }, childCount: 10),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
