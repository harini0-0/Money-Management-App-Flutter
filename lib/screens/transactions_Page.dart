import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneymanagementapp/utilities/transDetails.dart';
import 'package:moneymanagementapp/utilities/constants.dart';
import 'package:moneymanagementapp/utilities/AddTransactionFAB.dart';
import 'package:moneymanagementapp/modals/categoryItems.dart';
import 'package:moneymanagementapp/modals/transactionItems.dart';
import 'package:moneymanagementapp/services/Card_Data.dart';

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
    return FutureBuilder(
      future: Hive.openBox(itemBoxName),
      builder:  (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString(), style: TextStyle(fontSize: 20),);
          }
          else{
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black,
                title: Center(child: Text(widget.category.categoryName, style: GoogleFonts.kaushanScript(textStyle: TextStyle(color: Color(0xffE8816D), fontSize: 40)),)),
              ),
              backgroundColor: Colors.black12,
              floatingActionButton: AddTransactionFAB(widget: widget),
              body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                    child: WatchBoxBuilder(
                    box: Hive.box(itemBoxName),
                    builder: (context, categoryBox){
                      int totLength=0;
                      for(int i=0;i<categoryBox.length;i++){
                        Item item = categoryBox.getAt(i);
                        if(item.categoryName==widget.category.categoryName){
                          totLength++;
                        }
                      }
                      return ListView.builder(
                        itemCount: totLength,
                        itemBuilder: (context, position) {
                          Provider.of<CardData>(context, listen: false).transList.clear();
                          for(int i=0;i<categoryBox.length;i++){
                            Item item = categoryBox.getAt(i);
                            if(item.categoryName==widget.category.categoryName){
                              Provider.of<CardData>(context).addToTransList(item);
                            }
                          }
                          return Card(
                            color: Color(0xffE8816D),
                            child: TransDetails(
                              transList: Provider.of<CardData>(context).transList,
                              position: position,
                              deleteTransCallBack: (String transName, int position){
                                  Provider.of<CardData>(context, listen:false).deduction(categoryBox.get(transName));
                                  Provider.of<CardData>(context,listen: false).incomeList.remove(Provider.of<CardData>(context,listen: false).incomeList[position]);
                                  categoryBox.delete(transName);
                                },
                            ),
                          );
                        },
                      );
                    }
                    )
                  )
              ),
            );
          }
        } else
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
      },
    );
  }
}
