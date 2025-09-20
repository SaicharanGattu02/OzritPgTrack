import 'package:flutter/material.dart';

import '../../Components/CutomAppBar.dart';
import '../../utils/media_query_helper.dart';

class RoomDetails extends StatefulWidget {
  const RoomDetails({super.key});

  @override
  State<RoomDetails> createState() => _RoomDetailsState();
}

class _RoomDetailsState extends State<RoomDetails> {
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
            ],
          ),
        ),
      ),
    );
  }
}
