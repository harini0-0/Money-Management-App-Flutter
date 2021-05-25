import 'package:flutter/material.dart';
import 'package:moneymanagementapp/modals/categoryItems.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionsScreen extends StatefulWidget {
  static String id = "transactionsPage";
  final CategoryItem category;
  TransactionsScreen({this.category});

  @override
  _TransactionsScreenState createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: ListView(
            children: <Widget>[
              Center(child: Text(widget.category.categoryName, style: GoogleFonts.kaushanScript(textStyle: TextStyle(color: Color(0xffE8816D), fontSize: 50)),)),
            ],
          ),
        )
      ),
    );
  }
}
