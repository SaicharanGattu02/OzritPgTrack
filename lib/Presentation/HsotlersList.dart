import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ozritpgpaytrack/Components/CutomAppBar.dart';

class HostelersList extends StatefulWidget {
  const HostelersList({super.key});

  @override
  State<HostelersList> createState() => _HostelersListState();
}

class _HostelersListState extends State<HostelersList> {
  @override
  Widget build(BuildContext context) {
    final tabs = ["All", "Active", "Left", "Paid", "Pending", "Overdue"];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: CustomAppBar1(title: "Hostelers", actions: [],color: Colors.white,),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                style: TextStyle(fontFamily: 'Roboto'),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.search),
                  hintText: 'Search hostelers...',
                  hintStyle: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Tabs
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: tabs.map((e) {
                  bool isSelected = e == "All";
                  return Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF6C63FF)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Text(
                      e,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),
            // Stats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatCard("78", "Active"),
                _buildStatCard("2", "Pending"),
                _buildStatCard("1", "Overdue"),
              ],
            ),
            const SizedBox(height: 16),
            // Hosteler List
            Column(children: List.generate(5, (index) => _buildHostelerCard())),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String number, String label) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              number,
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(fontFamily: 'Roboto', color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHostelerCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(
              'images/profile Img.png',
            ), // sample image
          ),
           SizedBox(width: 12),
          Expanded(
            child: GestureDetector(onTap: () {
              context.push("/hostler_details");
            },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(
                    "Rahul Kumar",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "9876543210  ·  Room 201",
                    style: TextStyle(fontFamily: 'Roboto', color: Colors.grey),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "2 sharing  ·  ₹15,000",
                    style: TextStyle(fontFamily: 'Roboto', color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              _buildStatusChip("Active", Colors.green.shade100, Colors.green),
              const SizedBox(height: 6),
              _buildStatusChip("Paid", Colors.blue.shade100, Colors.blue),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(String text, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Roboto',
          color: textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
