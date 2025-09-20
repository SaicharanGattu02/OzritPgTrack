import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../Components/CommonTextFeild.dart';
import '../../Components/CustomAppButton.dart';
import '../../Components/CutomAppBar.dart';
import '../../utils/ImageUtils.dart';
import '../../utils/color_constants.dart';
import '../../utils/media_query_helper.dart';

class AadharVerification extends StatefulWidget {
  const AadharVerification({super.key});

  @override
  State<AadharVerification> createState() => _AadharVerificationState();
}

class _AadharVerificationState extends State<AadharVerification> {
  final TextEditingController aadharController = TextEditingController();
  File? _image;

  Future<void> _selectImage() async {
    final pickedImage = await ImagePickerHelper.pickImage(
      context,
      iconColor: primarycolor,
    );
    if (pickedImage != null) {
      setState(() => _image = pickedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar1(title: "Aadhar Verification", actions: []),
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
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
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
                          colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
                        ),
                      ),
                      child: Image.asset(
                        "assets/icons/aadhar.png",
                        color: Colors.white,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Title
                    const Text(
                      "Aadhar Verification",
                      style: TextStyle(
                        color: Color(0xff1F2937),
                        fontFamily: "Roboto",
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Enter Aadhaar details for verification",
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
                label: "Aadhaar Number",
                hint: "Enter 12-digit Aadhaar number",
                controller: aadharController,
                suffixIcon: Container(
                  padding: EdgeInsets.all(12),
                  child: Image.asset(
                    "assets/icons/aadhar.png",
                    color: Color(0xff9CA3AF),
                    fit: BoxFit.cover,

                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return "Please enter email address";
                //   }
                //   if (!RegExp(
                //     r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
                //   ).hasMatch(value.trim())) {
                //     return "Please enter a valid email";
                //   }
                //   return null;
                // },
              ),
              SizedBox(height: 16),
              Text(
                "Aadhar Front Photo",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight:  FontWeight.w500,
                  fontSize:  14,
                  color:  Color(0xff1F2937),
                ),
              ),
              SizedBox(height: 8),
              GestureDetector(
                onTap: _selectImage,
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(16),
                  color: const Color(0xffD8B4FE),
                  dashPattern: [8, 4],
                  child: Container(
                    height: SizeConfig.screenHeight * 0.14,
                    width: SizeConfig.screenWidth,
                    decoration: BoxDecoration(
                      color: const Color(0xffFAF5FF),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: _image != null
                        ? ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(
                        _image!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    )
                        : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/camera.png",
                          color: const Color(0xffC084FC),
                          fit: BoxFit.cover,
                          width: 28,
                          height: 28,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Take front photo",
                          style: TextStyle(
                            color: Color(0xff9333EA),
                            fontFamily: "Roboto",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
               SizedBox(height: 16),
              Align(alignment: Alignment.center,
                child: SizedBox(
                  height: 40,
                  width: SizeConfig.screenWidth * 0.45,
                  child: CustomAppButton1(
                    text: "Take Front Photo",
                    onPlusTap: _selectImage,
                  ),
                ),
              ),SizedBox(height: 16),
              Text(
                "Aadhar Back Photo",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight:  FontWeight.w500,
                  fontSize:  14,
                  color:  Color(0xff1F2937),
                ),
              ),
              SizedBox(height: 8),
              GestureDetector(
                onTap: _selectImage,
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(16),
                  color: const Color(0xffD8B4FE),
                  dashPattern: [8, 4],
                  child: Container(
                    height: SizeConfig.screenHeight * 0.14,
                    width: SizeConfig.screenWidth,
                    decoration: BoxDecoration(
                      color: const Color(0xffFAF5FF),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: _image != null
                        ? ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(
                        _image!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    )
                        : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/camera.png",
                          color: const Color(0xffC084FC),
                          fit: BoxFit.cover,
                          width: 28,
                          height: 28,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Take Back photo",
                          style: TextStyle(
                            color: Color(0xff9333EA),
                            fontFamily: "Roboto",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
               SizedBox(height: 16),
              Align(alignment: Alignment.center,
                child: SizedBox(
                  height: 40,
                  width: SizeConfig.screenWidth * 0.45,
                  child: CustomAppButton1(
                    text: "Take Back Photo",
                    onPlusTap: _selectImage,
                  ),
                ),
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
              if (_image != null) {
              } else {
                context.push("/emergency_details");
              }
            },
          ),
        ),
      ),
    );
  }
}
