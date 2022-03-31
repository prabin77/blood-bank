import 'package:blood_bank/homepage.dart';
import 'package:blood_bank/provider/blood_bank_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => BloodBankProvider(),
    child: MaterialApp(
      home: HomePage(),
    ),
  ));
}
