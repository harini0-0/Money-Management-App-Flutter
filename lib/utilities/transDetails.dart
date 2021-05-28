import 'package:flutter/material.dart';
import 'package:moneymanagementapp/modals/transactionItems.dart';

class TransDetails extends StatelessWidget {
  TransDetails({this.transList, this.position, this.deleteTransCallBack});
  final int position;
  final List<Item> transList ;
  final Function deleteTransCallBack;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 100,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              "${transList[position].transName}",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
            ),
            trailing: Text(
              "Rs ${transList[position].amount}",
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Date: ${transList[position].dateTime.day}-${transList[position].dateTime.month}-${transList[position].dateTime.year}",
                style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
              ),
              GestureDetector(
                onTap: (){print(position);deleteTransCallBack(transList[position].transName, position);},
                child: Icon(Icons.delete,color: Colors.red,),
              )
            ],
          ),
        ],
      ),
    );
  }
}
