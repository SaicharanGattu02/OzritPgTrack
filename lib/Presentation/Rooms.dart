import 'package:flutter/material.dart';

import '../Components/CommonChoiceChip.dart';
import '../Components/CutomAppBar.dart';
import '../utils/media_query_helper.dart';

class Rooms extends StatefulWidget {
  const Rooms({super.key});

  @override
  State<Rooms> createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {
  final List<String> sharing = [
    'All Floors',
    'Floor 01',
    'Floor 02',
    'Floor 03',
    'Floor 04',
    'Floor 05',
    'Floor 06',
  ];

  final ValueNotifier<int> _selectedSharingType = ValueNotifier<int>(0);

  final List<Map<String, dynamic>> roomData = [
    {
      'number': '101',
      'status': 'occupied',
      'ac': 'AC',
      'sharing': 2,
      'rent': 15000,
      'occupants': ['Ram', 'Kiran'],
    },
    {
      'number': '102',
      'status': 'available',
      'ac': 'Non-AC',
      'sharing': 3,
      'rent': 12000,
      'occupants': ['Ravi', 'Raja'],
    },
    // Add more rooms as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar1(title: "Rooms", actions: []),
      body: Container(
        width: SizeConfig.screenWidth,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFEBEBFD), Color(0xFFEFEFFD)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: _buildSummaryCard(
                    "12",
                    "Total",
                    Color(0xffFFFFFF).withOpacity(0.9),
                    Color(0xffFFFFFF).withOpacity(0.9),
                    Color(0xffF1F2937),
                    Color(0xff4B5563),
                    Color(0xffFFFFFF),
                  ),
                ),
                Expanded(
                  child: _buildSummaryCard(
                    "5",
                    "Available",
                    Color(0xffF0FDF4),
                    Color(0xffDCFCE7),
                    Color(0xff15803D),
                    Color(0xff16A34A),
                    Color(0xffBBF7D0),
                  ),
                ),
                Expanded(
                  child: _buildSummaryCard(
                    "6",
                    "Occupied",
                    Color(0xffFFEF2F2),
                    Color(0xffFEE2E2),
                    Color(0xffB91C1C),
                    Color(0xffDC2626),
                    Color(0xffFECACA),
                  ),
                ),
                Expanded(
                  child: _buildSummaryCard(
                    "6",
                    "Maintenance",
                    Color(0xffFFF7ED),
                    Color(0xffFFEDD5),
                    Color(0xffC2410C),
                    Color(0xffEA580C),
                    Color(0xffFED7AA),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Sharing Type
            Container(
              width: SizeConfig.screenWidth,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Filter by Floor",
                    style: TextStyle(
                      color: Color(0xff374151),
                      fontFamily: "Roboto",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 12),
                  ValueListenableBuilder<int>(
                    valueListenable: _selectedSharingType,
                    builder: (context, value, child) {
                      return Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: List.generate(sharing.length, (i) {
                          final selected = i == value;
                          return CustomChoiceChip(
                            label: sharing[i],
                            selected: selected,
                            onSelected: (isSelected) {
                              _selectedSharingType.value = i;
                            },
                          );
                        }),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "All Rooms",
                  style: TextStyle(
                    color: Color(0xff1F2937),
                    fontFamily: "Roboto",
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "${roomData.length} rooms",
                  style: TextStyle(
                    color: Color(0xff1F2937),
                    fontFamily: "Roboto",
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Rooms Grid
            Expanded(
              child: GridView.builder(
                itemCount: roomData.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final data = roomData[index];
                  final occupants = (data['occupants'] as List<String>?) ?? [];

                  return Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          data['status'] == 'occupied'
                              ? Color(0xFFFFF7F5)
                              : Color(0xFFF0FDF4),
                          Color(0xFFEFEFFD),
                        ],
                      ),
                      border: Border.all(
                        color: data['status'] == 'occupied'
                            ? Color(0xFFFEE2E2)
                            : Color(0xFFD1FAE5),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.bottomCenter,
                                  colors: data['status'] == 'occupied'
                                      ? [Color(0xFFEF4444), Color(0xFFDC2626)]
                                      : [Color(0xFF10B981), Color(0xFF059669)],
                                ),
                              ),
                              child: Text(
                                data['number'].toString(),
                                style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontFamily: "Roboto",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              data['status'].toString(),
                              style: TextStyle(
                                color: Color(0xff4B5563),
                                fontFamily: "Roboto",
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Spacer(),
                            Text(
                              data['ac'].toString(),
                              style: TextStyle(
                                color: Color(0xff6B7280),
                                fontFamily: "Roboto",
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Sharing",
                              style: TextStyle(
                                color: Color(0xff4B5563),
                                fontFamily: "Roboto",
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "${data['sharing']} sharing",
                              style: TextStyle(
                                color: Color(0xff1F2937),
                                fontFamily: "Roboto",
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Rent",
                              style: TextStyle(
                                color: Color(0xff4B5563),
                                fontFamily: "Roboto",
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "₹${data['rent']}",
                              style: TextStyle(
                                color: Color(0xff9333EA),
                                fontFamily: "Roboto",
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Occupants (${occupants.length})",
                          style: TextStyle(
                            color: Color(0xff4B5563),
                            fontFamily: "Roboto",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(
    String count,
    String label,
    Color color1,
    Color color2,
    Color textColor,
    Color titleColor,
    Color borderColor,
  ) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [color1, color2],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            count,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              fontFamily: "Roboto",
              color: textColor,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontFamily: "Roboto",
              color: titleColor,
            ),
          ),
        ],
      ),
    );
  }
}
