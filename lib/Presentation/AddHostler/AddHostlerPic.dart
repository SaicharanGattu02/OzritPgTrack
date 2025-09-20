import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ozritpgpaytrack/Components/CustomAppButton.dart';
import 'package:ozritpgpaytrack/Components/CutomAppBar.dart';
import '../../utils/ImageUtils.dart';
import '../../utils/color_constants.dart';
import '../../utils/media_query_helper.dart';

class AddHostlerPic extends StatefulWidget {
  const AddHostlerPic({super.key});

  @override
  State<AddHostlerPic> createState() => _AddHostlerPicState();
}

class _AddHostlerPicState extends State<AddHostlerPic> {
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
      appBar: CustomAppBar1(title: "Add Photo", actions: []),
      body: SingleChildScrollView(
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
                    "assets/icons/camera.png",
                    color: Colors.white,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Take Photo",
                  style: TextStyle(
                    color: Color(0xff1F2937),
                    fontFamily: "Roboto",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Click to capture photo with camera",
                  style: TextStyle(
                    color: Color(0xff4B5563),
                    fontFamily: "Roboto",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 16),

                // Dotted Border + Image Preview
                GestureDetector(
                  onTap: _selectImage,
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(16),
                    color: const Color(0xffD8B4FE),
                    dashPattern: [8, 4],
                    child: Container(
                      height: SizeConfig.screenHeight * 0.25,
                      width: double.infinity,
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
                                  width: 40,
                                  height: 40,
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  "Tap to take photo",
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
                const SizedBox(height: 20),
                SizedBox(
                  height: 40,
                  width: SizeConfig.screenWidth * 0.35,
                  child: CustomAppButton1(
                    text: "Take Photo",
                    onPlusTap: _selectImage,
                  ),
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
              if (_image != null) {
              } else {
                context.push("/add_mobile_number");
              }
            },
          ),
        ),
      ),
    );
  }
}
