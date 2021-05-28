import 'dart:ffi';

import 'constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:moneymanagementapp/services/Card_Data.dart';

class BalanceCard extends StatefulWidget {
  @override
  _BalanceCardState createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
//      onLongPress: (){
//        double newAmt=0.0;
//        return showDialog<void>(
//          context: context,
//          barrierDismissible: false, // user must tap button!
//          builder: (BuildContext context) {
//            return AlertDialog(
//              title: const Text('Balance insufficient'),
//              content: SingleChildScrollView(
//                child: ListBody(
//                  children: <Widget>[
//                    TextField(
//                      onChanged: (value){
//                        newAmt = double.parse("$value");
//                        },
//                      keyboardType: TextInputType.number,
//                      decoration: kTextFieldDecoration.copyWith(
//                        hintText: 'Enter Amount',
//                        hintStyle: TextStyle(color: Colors.black54),
//                      ),
//                    //onChanged: (value){return "";},
//                    ),
//                  ],
//                ),
//              ),
//              actions: <Widget>[
//                TextButton(
//                  child: const Text('Ok'),
//                  onPressed: () {
//                    setState(() {
//                      Provider.of<CardData>(context,listen: false).refreshAmount(num: newAmt, context: this.context);
//                    });
//                    Navigator.of(context).pop();
//                  },
//                ),
//              ],
//            );
//          },
//        );
//      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 7.0, right: 7.0),
        height: 230,
        decoration: kcardHolderStyle,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Card Holder",
                  style: kcardHolderNameTextStyle,
                ),
                SizedBox(height: 20,),
                Text("Balance",
                  style: kcardBalanceHeadingTextStyle,
                ),
                Text("${Provider.of<CardData>(context).counter}", style: TextStyle(color: Colors.black54, fontSize: 20,),),
              ],
            ),
            Icon(Icons.account_circle, color: Colors.white,size: 120,)
          ],
        ),
      ),
    );
  }
}
