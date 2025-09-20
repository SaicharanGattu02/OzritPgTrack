import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:ozritpgpaytrack/Components/CustomAppButton.dart';
import 'package:ozritpgpaytrack/Components/CustomSnackBar.dart';
import 'package:ozritpgpaytrack/Components/CutomAppBar.dart';
import '../../Components/CommonTextFeild.dart';
import '../../utils/media_query_helper.dart';

class AddMobileNumber extends StatefulWidget {
  const AddMobileNumber({super.key});

  @override
  State<AddMobileNumber> createState() => _AddMobileNumberState();
}

class _AddMobileNumberState extends State<AddMobileNumber> {
  final TextEditingController mobileController = TextEditingController();

  String? _validateMobile(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter mobile number";
    }
    if (!RegExp(r'^[6-9]\d{9}$').hasMatch(value.trim())) {
      return "Please enter a valid 10-digit mobile number";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar1(title: "Mobile Number", actions: []),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight * 0.8,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFEBEBFD), Color(0xFFEFEFFD)],
            ),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                // Icon circle
                Container(
                  padding: const EdgeInsets.all(20),
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
                    ),
                  ),
                  child: Image.asset(
                    "assets/icons/call.png",
                    color: Colors.white,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                // Title
                const Text(
                  "Enter Mobile Number",
                  style: TextStyle(
                    color: Color(0xff1F2937),
                    fontFamily: "Roboto",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "We'll send you an OTP for verification",
                  style: TextStyle(
                    color: Color(0xff4B5563),
                    fontFamily: "Roboto",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 16),

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
                  label: "Mobile Number",
                  hint: "Enter 10-digit mobile number",
                  controller: mobileController,
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
          child: CustomAppButton1(
            text: "Next",
            onPlusTap: () {
              final error = _validateMobile(mobileController.text);
              if (error != null) {
                CustomSnackBar1.show(context, error);
              }
              context.push("/hostler_verify_otp");
            },
          ),
        ),
      ),
    );
  }
}
