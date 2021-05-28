import 'Card_Data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneymanagementapp/utilities/constants.dart';


class AddCategory extends StatefulWidget {
  @override
  _AddCategoryState createState() => new _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  String dropdownValue;
  @override
  void initState(){
    super.initState();
    dropdownValue = "Expense";
  }
  @override
  Widget build(BuildContext context) {
    String categoryTitle;
    return Container(
      color: Color(0xff6A3B33),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        decoration: kcontainerDeco,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("New Category Details", style: kdropDownTextStyle.copyWith(decoration: TextDecoration.underline),),
            SizedBox(height: 60,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Transaction Type: ", style: GoogleFonts.libreBaskerville(textStyle: TextStyle(fontSize: 20, color: Colors.white)),),
                SizedBox(width: 20,),
                DropdownButton(
                    items: <String>["Expense","Incomes"]
                        .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: GoogleFonts.libreBaskerville(textStyle: TextStyle(fontSize: 20, color: Colors.brown)),),
                          );
                        }).toList(),
                  value: dropdownValue,
                  onChanged: (value){
                      setState(() {
                        dropdownValue=value;
                      });
                      },
                ),
              ],
            ),
            SizedBox(height: 20,),
            TextField(
              style: TextStyle(color: Colors.white, fontSize: 20),
              onChanged: (value){categoryTitle = value;},
              decoration: kTextFieldDecoration.copyWith(hintText: 'Enter new Category', ),
            ),
            SizedBox(height: 20,),
            FlatButton(
                  onPressed: (){
                    print("$categoryTitle");
                    Provider.of<CardData>(context, listen: false).addToList("$categoryTitle", (dropdownValue == "Expense"? true : false));
                    Navigator.pop(context);
                    },
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  color: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Add Category", style: kdropDownTextStyle,),
                  )
            ),
          ],
        ),
      ),
    );
  }
}
