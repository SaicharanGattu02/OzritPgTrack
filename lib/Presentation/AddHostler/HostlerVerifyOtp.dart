import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:ozritpgpaytrack/Components/CustomAppButton.dart';
import 'package:ozritpgpaytrack/Components/CutomAppBar.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../Components/CommonTextFeild.dart';
import '../../utils/color_constants.dart';
import '../../utils/media_query_helper.dart';

class HostlerVerifyOtp extends StatefulWidget {
  const HostlerVerifyOtp({super.key});

  @override
  State<HostlerVerifyOtp> createState() => _HostlerVerifyOtpState();
}

class _HostlerVerifyOtpState extends State<HostlerVerifyOtp> {
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _otpFocusNode = FocusNode();
  int _seconds = 30;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_otpFocusNode);
    });

    _startTimer();
  }

  @override
  void dispose() {
    _otpController.dispose();
    _otpFocusNode.dispose();
    super.dispose();
  }

  String? _validateOtp(String otp) {
    if (otp.length < 4) {
      return 'Please enter a 6-digit OTP';
    }
    if (!RegExp(r'^\d{6}$').hasMatch(otp)) {
      return 'OTP must contain only digits';
    }
    return null;
  }

  void _onOtpChanged(String otp) {
    if (_validateOtp(otp) == null && mounted) {
      _otpFocusNode.unfocus();
    }
  }

  void _startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
        _startTimer();
      }
    });
  }

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
      appBar: CustomAppBar1(title: "OTP Verification", actions: []),
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
                    "assets/icons/verify otp.png",
                    color: Colors.white,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                // Title
                const Text(
                  "Verify OTP",
                  style: TextStyle(
                    color: Color(0xff1F2937),
                    fontFamily: "Roboto",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Enter the 6-digit code sent to",
                  style: TextStyle(
                    color: Color(0xff4B5563),
                    fontFamily: "Roboto",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Text(
                      "+91 8179013372",
                      style: TextStyle(
                        color: Color(0xff9333EA),
                        fontFamily: "Roboto",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        context.pop();
                      },
                      icon: Icon(
                        Icons.edit_sharp,
                        color: primarycolor,
                        size: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                PinCodeTextField(
                  blinkWhenObscuring: true,
                  autoUnfocus: true,
                  appContext: context,
                  controller: _otpController,
                  focusNode: _otpFocusNode,
                  backgroundColor: Colors.transparent,
                  length: 6,
                  onChanged: _onOtpChanged,
                  animationType: AnimationType.fade,
                  hapticFeedbackTypes: HapticFeedbackTypes.heavy,
                  cursorColor: primarycolor,
                  keyboardType: TextInputType.number,
                  enableActiveFill: true,
                  useExternalAutoFillGroup: true,
                  beforeTextPaste: (text) => true,
                  autoFocus: true,
                  autoDismissKeyboard: false,
                  showCursor: true,
                  pastedTextStyle: TextStyle(
                    color: Color(0xff111827),
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto',
                  ),
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(16),
                    fieldHeight: 42,
                    fieldWidth: 42,
                    fieldOuterPadding: EdgeInsets.only(right: 2),
                    activeFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    activeColor: primarycolor,
                    selectedColor: primarycolor,
                    inactiveColor: Color(0xff1F2937),
                    activeBorderWidth: 1.6,
                    selectedBorderWidth: 1.6,
                    inactiveBorderWidth: 1.1,
                  ),
                  textStyle: TextStyle(
                    color: textColor,
                    fontSize: 17,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  textInputAction: Platform.isAndroid
                      ? TextInputAction.none
                      : TextInputAction.done,
                ),
                SizedBox(height: 24),
                Text(
                  "Resend code in ($_seconds s)",
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xFF6B7280),
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
          child: CustomAppButton1(text: "Next", onPlusTap: () {
            context.push("/aadhar_verification");
          }),
        ),
      ),
    );
  }
}
