import 'package:flutter/material.dart';
import 'package:moneymanagementapp/screens/transactions_Page.dart';
import 'package:moneymanagementapp/services/AddTransaction.dart';

class AddTransactionFAB extends StatelessWidget {
  const AddTransactionFAB({Key key, @required this.widget,});
  final TransactionsScreen widget;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (){
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context)=> SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: AddTransaction(categoryName: widget.category.categoryName,transactionType: widget.category.transactionType,),
            ),
          ),
        );
      },
      backgroundColor: Color(0xffE8816D),
      child: Icon(Icons.add, color: Colors.black54,),
    );
  }
}
