import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneymanagementapp/modals/transactionItems.dart';
import 'package:moneymanagementapp/services/Card_Data.dart';
import 'package:moneymanagementapp/utilities/constants.dart';

class AddTransaction extends StatefulWidget {
  AddTransaction({this.categoryName, this.transactionType});
  final String categoryName,transactionType;
  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> with TickerProviderStateMixin{
  String transTitle;
  double transAmount=0;
  DateTime transDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: transDate,
        firstDate: DateTime(2010),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != transDate)
      setState(() {
        transDate = pickedDate;
      });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        height: 550,
        decoration: BoxDecoration(
          color: Color(0xffE8816D),
          borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        child: Column(
          children: <Widget>[
            Text("New TransactionDetails", style: kdropDownTextStyle.copyWith(decoration: TextDecoration.underline),),
            SizedBox(height: 50,),
            TextField(
              onChanged: (value){transTitle = "$value";},
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter new Transaction',
                  hintStyle: TextStyle(color: Colors.black54),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              onChanged: (value){transAmount = double.parse("$value");},
              keyboardType: TextInputType.number,
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter Amount',
                hintStyle: TextStyle(color: Colors.black54),
              ),
            ),
            SizedBox(height: 30),
            Text("${transDate.day}-${transDate.month}-${transDate.year}",
              style: GoogleFonts.kaushanScript(textStyle: TextStyle(fontSize: 30)),
            ),
            RaisedButton(
              onPressed: () => _selectDate(context),
              child: Text('Select date'),
            ),
            SizedBox(height: 25,),
            FlatButton(
              onPressed: (){
                Provider.of<CardData>(context, listen: false).addNewTransaction(Item(
                    transactionType: widget.transactionType,
                    categoryName: widget.categoryName,
                    amount: transAmount,
                    dateTime: transDate,
                    transName: transTitle,
                  ));
                Provider.of<CardData>(context, listen: false).getAllData();
                Navigator.pop(context);
              },
              color: Colors.grey,
              //style: ButtonStyle(side: BorderSide(width: 16.0, color: Colors.lightBlue.shade50),
              child: Text("Add Transaction", style: TextStyle(fontSize: 20),),

            )
          ],
        ),
      ),
    );
  }
}