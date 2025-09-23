import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ozritpgpaytrack/Components/CutomAppBar.dart';
import 'package:ozritpgpaytrack/Components/InfoRow.dart';

import '../Components/FilterButton.dart';
import '../utils/media_query_helper.dart';

class HostlerDetails extends StatefulWidget {
  const HostlerDetails({super.key});

  @override
  State<HostlerDetails> createState() => _HostlerDetailsState();
}

class _HostlerDetailsState extends State<HostlerDetails> {
  final ValueNotifier<String> selectedFilter = ValueNotifier<String>('Details');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar1(title: "HostlerDetails", actions: []),
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: SizeConfig.screenWidth,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Row(
                      spacing: 12,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(12),
                          child: Image.asset(
                            "assets/images/profile.png",
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          spacing: 4,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Ramu",
                              style: TextStyle(
                                color: Color(0xff1F2937),
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Roboto",
                              ),
                            ),
                            Text(
                              "16/07/2025",
                              style: TextStyle(
                                color: Color(0xff4B5563),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Roboto",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: _buildSummaryCard(
                            "101",
                            "Room",
                            Color(0xffFAF5FF),
                            Color(0xffF3E8FF),
                            Color(0xff7E22CE),
                            Color(0xff9333EA),
                          ),
                        ),
                        Expanded(
                          child: _buildSummaryCard(
                            "01",
                            "Floor",
                            Color(0xffEFF6FF),
                            Color(0xffDBEAFE),
                            Color(0xff1D4ED8),
                            Color(0xff2563EB),
                          ),
                        ),
                        Expanded(
                          child: _buildSummaryCard(
                            "23",
                            "Age",
                            Color(0xffF0FDF4),
                            Color(0xffDCFCE7),
                            Color(0xff15803D),
                            Color(0xff16A34A),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              ValueListenableBuilder<String>(
                valueListenable: selectedFilter,
                builder: (context, value, _) {
                  return Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF).withOpacity(0.95),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      children: [
                        Expanded(
                          child: FilterButton(
                            text: 'Details',
                            isSelected: value == 'Details',
                            onPressed: () => selectedFilter.value = 'Details',
                          ),
                        ),
                        Expanded(
                          child: FilterButton(
                            text: 'Billing',
                            isSelected: value == 'Billing',
                            onPressed: () => selectedFilter.value = 'Billing',
                          ),
                        ),
                        Expanded(
                          child: FilterButton(
                            text: 'Documents',
                            isSelected: value == 'Documents',
                            onPressed: () => selectedFilter.value = 'Documents',
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 16),

              ValueListenableBuilder<String>(
                valueListenable: selectedFilter,
                builder: (context, value, _) {
                  return Column(
                    children: [
                      if (selectedFilter.value == "Details") ...[
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF).withOpacity(0.95),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Row(
                                spacing: 16,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    width: 48,
                                    height: 48,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xFF667EEA),
                                          Color(0xFF764BA2),
                                        ],
                                      ),
                                    ),
                                    child: Image.asset(
                                      "assets/icons/hostler_person.png",
                                      color: Colors.white,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    "Personal Information",
                                    style: TextStyle(
                                      color: Color(0xff1F2937),
                                      fontFamily: "Roboto",
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              InfoRow(label: "Full Name", value: "Mani kanta"),
                              SizedBox(height: 8),
                              InfoRow(label: "Age", value: "23 years"),
                              SizedBox(height: 8),
                              InfoRow(
                                label: "Date of Birth",
                                value: "5/15/1999",
                              ),
                              SizedBox(height: 8),
                              InfoRow(
                                label: "Mobile Number",
                                value: "+91 8186071802",
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF).withOpacity(0.95),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Row(
                                spacing: 16,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    width: 48,
                                    height: 48,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xFF667EEA),
                                          Color(0xFF764BA2),
                                        ],
                                      ),
                                    ),
                                    child: Image.asset(
                                      "assets/icons/Home.png",
                                      color: Colors.white,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    "Room Information",
                                    style: TextStyle(
                                      color: Color(0xff1F2937),
                                      fontFamily: "Roboto",
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              InfoRow(label: "Room Number", value: "101"),
                              SizedBox(height: 8),
                              InfoRow(label: "Floor", value: "01"),
                              SizedBox(height: 8),
                              InfoRow(label: "Sharing Type", value: "Enabled"),
                              SizedBox(height: 8),
                              InfoRow(
                                label: "Joining Date",
                                value: "1/15/2024",
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF).withOpacity(0.95),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Row(
                                spacing: 16,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    width: 48,
                                    height: 48,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xFF667EEA),
                                          Color(0xFF764BA2),
                                        ],
                                      ),
                                    ),
                                    child: Image.asset(
                                      "assets/icons/emergency_details.png",
                                      color: Colors.white,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    "Emergency Contact",
                                    style: TextStyle(
                                      color: Color(0xff1F2937),
                                      fontFamily: "Roboto",
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              InfoRow(
                                label: "Father's Mobile",
                                value: "+91 9876543210",
                              ),
                              SizedBox(height: 8),
                              InfoRow(
                                label: "Permanent Address",
                                value: "Kavali, old town, Nellore (D). Ap",
                              ),
                              SizedBox(height: 8),
                              InfoRow(
                                label: "Office Address",
                                value:
                                    "Ozrit Ai Solutions, Gachibowli, Hyderabad, Telenagana",
                              ),
                            ],
                          ),
                        ),
                      ],
                      if (selectedFilter.value == "Billing") ...[
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF).withOpacity(0.95),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Row(
                                spacing: 16,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    width: 48,
                                    height: 48,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xFF667EEA),
                                          Color(0xFF764BA2),
                                        ],
                                      ),
                                    ),
                                    child: Image.asset(
                                      "assets/icons/bill_summary.png",
                                      color: Colors.white,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    "Current Bill",
                                    style: TextStyle(
                                      color: Color(0xff1F2937),
                                      fontFamily: "Roboto",
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              InfoRow(label: "Monthly Rent", value: "₹12,000"),
                              SizedBox(height: 8),
                              InfoRow(
                                label: "Security Deposit",
                                value: "₹5,000",
                              ),
                              SizedBox(height: 8),
                              InfoRow(label: "Maintenance", value: "₹3,000"),
                              SizedBox(height: 8),
                              Divider(color: Color(0xffE5E7EB), height: 2),
                              SizedBox(height: 8),
                              InfoRow1(
                                label: "Total Amount",
                                value: "₹20,000",
                                valueFontSize: 20,
                                valueFontWeight: FontWeight.w700,
                                labelColor: Color(0xff1F2937),
                                valueColor: Color(0xff9333EA),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF).withOpacity(0.95),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Row(
                                spacing: 16,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    width: 48,
                                    height: 48,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xFF667EEA),
                                          Color(0xFF764BA2),
                                        ],
                                      ),
                                    ),
                                    child: Image.asset(
                                      "assets/icons/payment.png",
                                      color: Colors.white,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    "Payment Details",
                                    style: TextStyle(
                                      color: Color(0xff1F2937),
                                      fontFamily: "Roboto",
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              InfoRow(label: "Payment Mode", value: "Cash"),
                              SizedBox(height: 8),
                              InfoRow(
                                label: "Next Due Date",
                                value: "2/15/2024",
                              ),
                              SizedBox(height: 8),
                              InfoRow(label: "Payment Status", value: "Paid"),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          width: SizeConfig.screenWidth,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF).withOpacity(0.95),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Payment Actions",
                                style: TextStyle(
                                  color: Color(0xff1F2937),
                                  fontFamily: "Roboto",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xFFF0FDF4),
                                      Color(0xFFDCFCE7),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/icons/collect_payment.png",
                                      width: 20,
                                      height: 20,
                                      fit: BoxFit.cover,
                                      color: Color(0xff16A34A),
                                    ),
                                    SizedBox(width: 12),
                                    Text(
                                      "Collect Payment",
                                      style: TextStyle(
                                        color: Color(0xff15803D),
                                        fontFamily: "Roboto",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.keyboard_arrow_right,
                                      size: 16,
                                      color: Color(0xff15803D),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xFFEFF6FF),
                                      Color(0xFFDBEAFE),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/icons/invoice.png",
                                      width: 20,
                                      height: 20,
                                      fit: BoxFit.cover,
                                      color: Color(0xff2563EB),
                                    ),
                                    SizedBox(width: 12),
                                    Text(
                                      "Generate Invoice",
                                      style: TextStyle(
                                        color: Color(0xff1D4ED8),
                                        fontFamily: "Roboto",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.keyboard_arrow_right,
                                      size: 16,
                                      color: Color(0xff2563EB),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  context.push("/payment_history");
                                },
                                child: Container(
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xFFFAF5FF),
                                        Color(0xFFF3E8FF),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/icons/payment_history.png",
                                        width: 20,
                                        height: 20,
                                        fit: BoxFit.cover,
                                        color: Color(0xff9333EA),
                                      ),
                                      SizedBox(width: 12),
                                      Text(
                                        "Payment History",
                                        style: TextStyle(
                                          color: Color(0xff7E22CE),
                                          fontFamily: "Roboto",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.keyboard_arrow_right,
                                        size: 16,
                                        color: Color(0xff9333EA),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      if (selectedFilter.value == "Documents") ...[
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF).withOpacity(0.95),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    width: 48,
                                    height: 48,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xFF667EEA),
                                          Color(0xFF764BA2),
                                        ],
                                      ),
                                    ),
                                    child: Image.asset(
                                      "assets/icons/aadhar.png",
                                      color: Colors.white,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    "Aadhaar Card",
                                    style: const TextStyle(
                                      color: Color(0xff1F2937),
                                      fontFamily: "Roboto",
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              InfoRow1(
                                label: "Aadhaar Number",
                                value: "8115 4637 70759",
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.asset(
                                          "assets/images/aadharFront.png",
                                          height: 80,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      const Text(
                                        "Front Side",
                                        style: TextStyle(
                                          color: Color(0xff4B5563),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Roboto",
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 20),
                                  Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.asset(
                                          "assets/images/aadharback.png",
                                          height: 80,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      const Text(
                                        "Back Side",
                                        style: TextStyle(
                                          color: Color(0xff4B5563),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Roboto",
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
          child: Row(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xffE8E8E8),
                    ),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 12),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    side: WidgetStateProperty.all(BorderSide.none),
                    // visualDensity: VisualDensity.compact,
                    elevation: MaterialStateProperty.all(0),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.call, color: Color(0xff333333)),
                  label: const Text(
                    "Call",
                    style: TextStyle(
                      color: Color(0xff050505),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Roboto",
                    ),
                  ),
                ),
              ),
              Expanded(
                child: OutlinedButton.icon(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xffE8E8E8),
                    ),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 12),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    side: WidgetStateProperty.all(BorderSide.none),
                    // visualDensity: VisualDensity.compact,
                    elevation: MaterialStateProperty.all(0),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.message, color: Color(0xff333333)),
                  label: const Text(
                    "Message",
                    style: TextStyle(
                      color: Color(0xff050505),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Roboto",
                    ),
                  ),
                ),
              ),
              Expanded(
                child: OutlinedButton.icon(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xffE8E8E8),
                    ),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 12),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    side: WidgetStateProperty.all(BorderSide.none),
                    // visualDensity: VisualDensity.compact,
                    elevation: MaterialStateProperty.all(0),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.edit, color: Color(0xff333333)),
                  label: const Text(
                    "Edit",
                    style: TextStyle(
                      color: Color(0xff050505),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Roboto",
                    ),
                  ),
                ),
              ),
            ],
          ),
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
