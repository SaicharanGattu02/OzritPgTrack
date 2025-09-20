import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../Components/CommonTextFeild.dart';
import '../../Components/CustomAppButton.dart';
import '../../Components/CutomAppBar.dart';
import '../../utils/media_query_helper.dart';

class EmergencyDetails extends StatefulWidget {
  const EmergencyDetails({super.key});

  @override
  State<EmergencyDetails> createState() => _EmergencyDetailsState();
}

class _EmergencyDetailsState extends State<EmergencyDetails> {
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController officeAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar1(title: "Emergency Details", actions: []),
      body: SingleChildScrollView(
        child: Container(
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
            children: [
              Container(
                width: SizeConfig.screenWidth,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFFEF4444), Color(0xFF764BA2)],
                        ),
                      ),
                      child: Image.asset(
                        "assets/icons/emergency_details.png",
                        color: Colors.white,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Emergency Details",
                      style: TextStyle(
                        color: Color(0xff1F2937),
                        fontFamily: "Roboto",
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Add emergency contact & address information",
                      style: TextStyle(
                        color: Color(0xff4B5563),
                        fontFamily: "Roboto",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              CommonTextField1(
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "+91",
                        style: TextStyle(
                          color: Color(0xff4B5563),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        width: 1,
                        height: 24,
                        color: const Color(0xffD1D5DB),
                      ),
                    ],
                  ),
                ),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                label: "Father's Mobile Number",
                hint: "Enter 10-digit mobile number",
                controller: mobileController,
              ),
              SizedBox(height: 10),
              CommonTextField1(
                maxLines: 4,
                label: "Permanent Address",
                hint: "Enter your permanent home address",
                controller: addressController,
              ),
              SizedBox(height: 10),
              CommonTextField1(
                maxLines: 4,
                label: "Office Address",
                hint: "Enter your office/workplace address",
                controller: addressController,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
          child: CustomAppButton1(
            text: "Next",
            onPlusTap: () {
              context.push("/room_details");
            },
          ),
        ),
      ),
    );
  }
}
