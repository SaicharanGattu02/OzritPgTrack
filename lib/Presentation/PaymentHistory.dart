import 'package:flutter/material.dart';
import 'package:ozritpgpaytrack/Components/CutomAppBar.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({super.key});

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar1(title: "Payment  History", actions: []),
    );
    
  }
}
