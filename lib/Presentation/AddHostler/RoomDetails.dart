import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ozritpgpaytrack/Components/InfoRow.dart';
import 'package:ozritpgpaytrack/utils/color_constants.dart';
import '../../Components/CommonChoiceChip.dart';
import '../../Components/CommonTextFeild.dart';
import '../../Components/CustomAppButton.dart';
import '../../Components/CutomAppBar.dart';
import '../../utils/media_query_helper.dart';

class RoomDetails extends StatefulWidget {
  const RoomDetails({super.key});

  @override
  State<RoomDetails> createState() => _RoomDetailsState();
}

class _RoomDetailsState extends State<RoomDetails> {
  final TextEditingController joiningDateController = TextEditingController();
  final List<String> sharing = [
    '1 Sharing',
    '2 Sharing',
    '3 Sharing',
    '4 Sharing',
    '5 Sharing',
  ];

  final ValueNotifier<int> _selectedSharingType = ValueNotifier<int>(0);
  final ValueNotifier<int> _selectedFloor = ValueNotifier<int>(1);
  final ValueNotifier<int> _selectedBed = ValueNotifier<int>(1);
  final ValueNotifier<int> _selectedRoom = ValueNotifier<int>(106);
  final ValueNotifier<bool> _isAC = ValueNotifier<bool>(true);
  final ValueNotifier<String> selectedPayment = ValueNotifier<String>("cash");
  final TextEditingController cashController = TextEditingController(text: "0");
  final TextEditingController upiController = TextEditingController();
  final TextEditingController transactionIdController = TextEditingController();
  final ValueNotifier<bool> cashSelected = ValueNotifier<bool>(true);
  final ValueNotifier<bool> upiSelected = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar1(title: "Room Details", actions: []),
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
              // Joining Date Container
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
                            ),
                          ),
                          child: Image.asset(
                            "assets/icons/calender.png",
                            color: Colors.white,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          "Joining Date",
                          style: TextStyle(
                            color: Color(0xff1F2937),
                            fontFamily: "Roboto",
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    CommonDateField(
                      hint: "select joining date",
                      controller: joiningDateController,
                      suffixIcon: Container(
                        padding: EdgeInsets.all(10),
                        child: Image.asset(
                          "assets/icons/calender.png",
                          color: Color(0xff1F2937),
                          width: 16,
                          height: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Sharing Type
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
                            ),
                          ),
                          child: Image.asset(
                            "assets/icons/sharingPersons.png",
                            color: Colors.white,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          "Select Sharing Type",
                          style: TextStyle(
                            color: Color(0xff1F2937),
                            fontFamily: "Roboto",
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
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

              // Rooms & Floors
              Container(
                width: SizeConfig.screenWidth,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
                            ),
                          ),
                          child: Image.asset(
                            "assets/icons/Home.png",
                            color: Colors.white,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          "Select Room",
                          style: TextStyle(
                            color: Color(0xff1F2937),
                            fontFamily: "Roboto",
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        ValueListenableBuilder<bool>(
                          valueListenable: _isAC,
                          builder: (context, value, child) {
                            return Row(
                              children: [
                                Switch(
                                  value: value,
                                  onChanged: (v) => _isAC.value = v,
                                  activeColor: const Color(0xFF8000FF),
                                  activeTrackColor: const Color(0xFFD1C4E9),
                                  inactiveThumbColor: Colors.grey,
                                  inactiveTrackColor: const Color(0xFFE0E0E0),
                                ),
                                const Text(
                                  "AC",
                                  style: TextStyle(
                                    color: Color(0xff4B5563),
                                    fontFamily: "Roboto",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    const Text(
                      "Floors",
                      style: TextStyle(
                        color: Color(0xff374151),
                        fontFamily: "Roboto",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 50,
                      child: ValueListenableBuilder<int>(
                        valueListenable: _selectedFloor,
                        builder: (context, selectedFloorValue, child) {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 6,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            itemBuilder: (context, index) {
                              final floorNumber = index + 1;
                              final isSelected =
                                  selectedFloorValue == floorNumber;
                              return GestureDetector(
                                onTap: () => _selectedFloor.value = floorNumber,
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: isSelected
                                          ? [
                                              Color(0xFF667EEA),
                                              Color(0xFF764BA2),
                                            ]
                                          : [
                                              Color(0xFFF3F4F6),
                                              Color(0xFFE5E7EB),
                                            ],
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "$floorNumber",
                                      style: TextStyle(
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.black,
                                        fontFamily: "Roboto",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 20),
                    const Text(
                      "Rooms",
                      style: TextStyle(
                        color: Color(0xff374151),
                        fontFamily: "Roboto",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),

                    ValueListenableBuilder<int>(
                      valueListenable: _selectedRoom,
                      builder: (context, selectedRoomValue, child) {
                        return GridView.count(
                          crossAxisCount: 4,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 16,
                          childAspectRatio: 1.2,
                          children: List.generate(12, (index) {
                            final roomNumber = 100 + (index + 1);
                            final isOccupied = [
                              101,
                              103,
                              104,
                              105,
                              107,
                              108,
                            ].contains(roomNumber);
                            final isSelected = selectedRoomValue == roomNumber;

                            return GestureDetector(
                              onTap: () {
                                if (!isOccupied)
                                  _selectedRoom.value = roomNumber;
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: isSelected
                                            ? [
                                                const Color(0xFF22C55E),
                                                const Color(0xFF16A34A),
                                              ]
                                            : isOccupied
                                            ? [
                                                const Color(0xFFF3F4F6),
                                                const Color(0xFFE5E7EB),
                                              ]
                                            : [
                                                const Color(0xFFF0FDF4),
                                                const Color(0xFFDCFCE7),
                                              ],
                                      ),
                                      border: Border.all(
                                        color: isOccupied || isSelected
                                            ? Colors.transparent
                                            : const Color(0xffBBF7D0),
                                        width: 2,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "$roomNumber",
                                          style: TextStyle(
                                            color: isSelected
                                                ? Colors.white
                                                : isOccupied
                                                ? Color(0xff9CA3AF)
                                                : Color(0xff6B7280),
                                            fontFamily: "Roboto",
                                            fontSize: 14,
                                            fontWeight: isSelected
                                                ? FontWeight.w700
                                                : FontWeight.w600,
                                          ),
                                        ),
                                        Container(
                                          width: 8,
                                          height: 8,
                                          decoration: BoxDecoration(
                                            color: isSelected
                                                ? Colors.white
                                                : isOccupied
                                                ? Color(0xff9CA3AF)
                                                : Color(0xffD1D5DB),
                                            borderRadius: BorderRadius.circular(
                                              100,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (isOccupied)
                                    Positioned(
                                      top: 4,
                                      right: 18,
                                      child: Icon(
                                        Icons.lock,
                                        size: 16,
                                        color: Color(0xff9CA3AF),
                                      ),
                                    ),
                                ],
                              ),
                            );
                          }),
                        );
                      },
                    ),

                    const SizedBox(height: 16),
                    Text(
                      "Rooms -${101}",
                      style: TextStyle(
                        color: Color(0xff374151),
                        fontFamily: "Roboto",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 60,
                      child: ValueListenableBuilder<int>(
                        valueListenable: _selectedBed,
                        builder: (context, selectedFloorValue, child) {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            // physics: BouncingScrollPhysics(),
                            itemCount: 6,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            itemBuilder: (context, index) {
                              final floorNumber = index + 1;
                              final isSelected =
                                  selectedFloorValue == floorNumber;
                              final isOccupied = [3, 6].contains(floorNumber);
                              return GestureDetector(
                                onTap: () {
                                  if (!isOccupied)
                                    _selectedBed.value = floorNumber;
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 12),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: isSelected
                                          ? [
                                              const Color(0xFF22C55E),
                                              const Color(0xFF16A34A),
                                            ]
                                          : isOccupied
                                          ? [
                                              const Color(0xFFF3F4F6),
                                              const Color(0xFFE5E7EB),
                                            ]
                                          : [
                                              const Color(0xFFF0FDF4),
                                              const Color(0xFFDCFCE7),
                                            ],
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/icons/Bed.png",
                                        width: 20,
                                        height: 20,
                                      ),
                                      Text(
                                        "$floorNumber",
                                        style: TextStyle(
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.black,
                                          fontFamily: "Roboto",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.circle, color: Color(0xFFDCFCE7), size: 12),
                        SizedBox(width: 4),
                        Text(
                          "Available",
                          style: TextStyle(
                            color: Color(0xff374151),
                            fontFamily: "Roboto",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 16),
                        Icon(Icons.circle, color: Color(0xffE5E7EB), size: 12),
                        SizedBox(width: 4),
                        Text(
                          "Occupied",
                          style: TextStyle(
                            color: Color(0xff374151),
                            fontFamily: "Roboto",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 16),
                        Icon(Icons.circle, color: Color(0xFF4CAF50), size: 12),
                        SizedBox(width: 4),
                        Text(
                          "Selected",
                          style: TextStyle(
                            color: Color(0xff374151),
                            fontFamily: "Roboto",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                width: SizeConfig.screenWidth,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
                            ),
                          ),
                          child: Image.asset(
                            "assets/icons/bill_summary.png",
                            color: Colors.white,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          "Bill Summary",
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
                    InfoRow(label: "Monthly Rent", value: "₹15,000"),
                    SizedBox(height: 12),
                    InfoRow(label: "Security Deposit", value: "₹15,000"),
                    SizedBox(height: 12),
                    InfoRow(
                      label: "Maintenance Charges\nNon-refundable",
                      value: "₹15,000",
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Amount",
                          style: TextStyle(
                            color: Color(0xff1F2937),
                            fontFamily: "Roboto",
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "₹23,000",
                          style: TextStyle(
                            color: Color(0xff9333EA),
                            fontFamily: "Roboto",
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
                            ),
                          ),
                          child: Image.asset(
                            "assets/icons/payment.png",
                            color: Colors.white,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          "Payment Mode",
                          style: TextStyle(
                            color: Color(0xff1F2937),
                            fontFamily: "Roboto",
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Cash Option
                    ValueListenableBuilder<bool>(
                      valueListenable: cashSelected,
                      builder: (context, selected, child) {
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: () => cashSelected.value = !selected,
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: selected
                                        ? primarycolor
                                        : Colors.grey,
                                    width: 2,
                                  ),
                                ),
                                child: selected
                                    ? Center(
                                        child: Container(
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: primarycolor,
                                          ),
                                        ),
                                      )
                                    : null,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "Cash",
                              style: TextStyle(
                                color: Color(0xff374151),
                                fontFamily: "Roboto",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            SizedBox(
                              height: 52,
                              width: 150,
                              child: CommonTextField1(
                                controller: cashController,
                                hint: "Enter Amount",
                                prefixIcon: Icon(
                                  Icons.currency_rupee,
                                  size: 16,
                                  color: Color(0xff4B5563),
                                ),
                                // enabled: selected,
                              ),
                            ),
                          ],
                        );
                      },
                    ),

                    const SizedBox(height: 8),

                    // UPI Option
                    ValueListenableBuilder<bool>(
                      valueListenable: upiSelected,
                      builder: (context, selected, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () => upiSelected.value =
                                      !selected, // ✅ Correct toggle
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: selected
                                            ? primarycolor
                                            : Colors.grey,
                                        width: 2,
                                      ),
                                    ),
                                    child: selected
                                        ? Center(
                                            child: Container(
                                              width: 10,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: primarycolor,
                                              ),
                                            ),
                                          )
                                        : null,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  "UPI",
                                  style: TextStyle(
                                    color: Color(0xff374151),
                                    fontFamily: "Roboto",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Spacer(),
                                SizedBox(
                                  height: 52,
                                  width: 150,
                                  child: CommonTextField1(
                                    controller: upiController,
                                    hint: "Enter UPI ID",
                                    prefixIcon: const Icon(
                                      Icons.currency_rupee,
                                      size: 16,
                                      color: Color(0xff4B5563),
                                    ),
                                    // enabled: selected,
                                  ),
                                ),
                              ],
                            ),

                            // Transaction ID field for UPI
                            if (selected) ...[
                              const SizedBox(height: 8),
                              CommonTextField1(
                                controller: transactionIdController,
                                hint: "Enter Transaction ID",
                                prefixIcon: const Icon(
                                  Icons.confirmation_num,
                                  size: 16,
                                  color: Color(0xff4B5563),
                                ),

                                // enabled: true,
                              ),
                            ],
                          ],
                        );
                      },
                    ),
                  ],
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
            text: "Done",
            onPlusTap: () {
              context.pushReplacement('/dashboard');
            },
          ),
        ),
      ),
    );
  }
}
