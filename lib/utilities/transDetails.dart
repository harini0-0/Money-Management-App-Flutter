import 'package:flutter/material.dart';
import 'package:moneymanagementapp/modals/transactionItems.dart';


class TransDetails extends StatelessWidget {
  TransDetails({this.transList, this.position});
  final int position;
  final List<Item> transList ;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 100,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text("${transList[position].transName}"),
            trailing: Text("${transList[position].amount}"),
          ),
          Row(
            children: [
              Text("${transList[position].dateTime}"),
              GestureDetector(child: Icon(Icons.delete,color: Colors.red,),)
            ],
          ),
        ],
      ),
    );
  }
}
