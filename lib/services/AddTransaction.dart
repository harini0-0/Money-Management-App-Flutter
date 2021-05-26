import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneymanagementapp/modals/transactionItems.dart';
import 'package:moneymanagementapp/services/Card_Data.dart';
//import 'package:moneymanagementapp/services/Trans_Data.dart';
import 'package:moneymanagementapp/utilities/constants.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
//import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';

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
              onChanged: (value){transTitle = "$value";
              print(transTitle);},
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter new Transaction',
                  hintStyle: TextStyle(color: Colors.black54),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              onChanged: (value){
                transAmount = double.parse("$value");
                print(transAmount);
              },
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
            FlatButton(
                onPressed: (){
                  Provider.of<CardData>(context, listen: false).listGetterExpense(
                    Item(
                      transactionType: widget.transactionType,
                      categoryName: widget.categoryName,
                      amount: transAmount,
                      dateTime: transDate,
                      transName: transTitle,
                    ));
                  Navigator.pop(context);
                },
                child: Text("Add Transaction"),
            )
          ],
        ),
      ),
    );
  }
}
//
//class DateSelector extends StatefulWidget {
//  @override
//  _DateSelectorState createState() => _DateSelectorState();
//}
//
//class _DateSelectorState extends State<DateSelector> {
//  _DateSelectorState({this.transDate});
//  DateTime transDate;
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: DatePickerWidget(
//        onChange: (value, int){
//          transDate=value;
//          print(transDate);
//        },
//        onCancel: (){Navigator.pop(this.context);},
//      ),
//    );
//  }
//}
