import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moneymanagementapp/modals/categoryItems.dart';
import 'package:hive/hive.dart';
import 'package:moneymanagementapp/utilities/constants.dart';
import 'package:moneymanagementapp/services/AddTransaction.dart';
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
    return FutureBuilder(
      future: Hive.openBox(itemBoxName),
      builder:  (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            print("reached build2");
            return Text(snapshot.error.toString(), style: TextStyle(fontSize: 20),);
          }
          else{
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black,
                title: Center(child: Text(widget.category.categoryName, style: GoogleFonts.kaushanScript(textStyle: TextStyle(color: Color(0xffE8816D), fontSize: 40)),)),
              ),
              backgroundColor: Colors.black12,
              floatingActionButton: FloatingActionButton(
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
              ),
              body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                    child: WatchBoxBuilder(
                    box: Hive.box(itemBoxName),
                    builder: (context, categoryBox){
                      for(int i=0;i<categoryBox.length;i++){

                      }
                      return ListView.builder(
                        itemCount: 2,
                        itemBuilder: (context, position) {
                          return Card();
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
