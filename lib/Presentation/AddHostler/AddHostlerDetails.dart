import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:ozritpgpaytrack/Components/CustomAppButton.dart';
import 'package:ozritpgpaytrack/Components/CutomAppBar.dart';
import '../../Components/CommonTextFeild.dart';
import '../../utils/media_query_helper.dart';

class NewHostlerDetails extends StatefulWidget {
  const NewHostlerDetails({super.key});

  @override
  State<NewHostlerDetails> createState() => _NewHostlerDetailsState();
}

class _NewHostlerDetailsState extends State<NewHostlerDetails> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  DateTime? selectedDob;

  Future<void> _pickDateOfBirth(BuildContext context) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDob ?? DateTime(now.year - 18, now.month, now.day),
      firstDate: DateTime(1900),
      lastDate: now,
    );
    if (picked != null) {
      setState(() {
        selectedDob = picked;
        dobController.text = DateFormat('dd-MM-yyyy').format(picked);

        // Calculate age
        int age = now.year - picked.year;
        if (now.month < picked.month ||
            (now.month == picked.month && now.day < picked.day)) {
          age--;
        }
        ageController.text = age.toString();
      });
    }
  }

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter full name";
    }
    return null;
  }

  String? _validateAge(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter age";
    }
    final age = int.tryParse(value.trim());
    if (age == null || age <= 0 || age > 120) {
      return "Please enter a valid age";
    }
    return null;
  }

  String? _validateDob(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please select date of birth";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar1(title: "Add Hosteler", actions: []),
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
                    "assets/icons/newjoiners.png",
                    color: Colors.white,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "New Hosteler Details",
                  style: TextStyle(
                    color: Color(0xff1F2937),
                    fontFamily: "Roboto",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Please fill in the basic information",
                  style: TextStyle(
                    color: Color(0xff4B5563),
                    fontFamily: "Roboto",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 16),
                CommonTextField1(
                  label: "Full Name",
                  hint: "Enter full name",
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  validator: _validateName,
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () => _pickDateOfBirth(context),
                  child: AbsorbPointer(
                    child: CommonTextField1(
                      label: "Date of Birth",
                      hint: "Select DOB",
                      controller: dobController,
                      keyboardType: TextInputType.datetime,
                      suffixIcon: const Icon(Icons.calendar_month),
                      validator: _validateDob,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                CommonTextField1(
                  label: "Age",
                  hint: "Age",
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  isRead: true,
                  suffixIcon: const Icon(Icons.person),
                  validator: _validateAge,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 20),
          child: CustomAppButton1(
            text: "Next",
            onPlusTap: () {
              context.push('/add_hostler_pic');
            },
          ),
        ),
      ),
    );
  }
}
