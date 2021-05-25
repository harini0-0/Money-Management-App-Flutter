import 'package:flutter/material.dart';
import 'package:moneymanagementapp/utilities/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'Card_Data.dart';
class EditCategory extends StatefulWidget {
  final int position;
  final String prevName;
  EditCategory({this.position, this.prevName});
  @override
  _EditCategoryState createState() => new _EditCategoryState();
}

class _EditCategoryState extends State<EditCategory> {
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
        decoration: BoxDecoration(
          color: Color(0xff303030),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Edit Category Details", style: kdropDownTextStyle.copyWith(decoration: TextDecoration.underline),),
            SizedBox(height: 60,),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: [
//                Text("Transaction Type: ", style: GoogleFonts.libreBaskerville(textStyle: TextStyle(fontSize: 20, color: Colors.white)),),
//                SizedBox(width: 20,),
//                DropdownButton(
//                    items: <String>["Expense","Incomes"]
//                        .map<DropdownMenuItem<String>>((String value) {
//                          return DropdownMenuItem<String>(
//                            value: value,
//                            child: Text(value, style: GoogleFonts.libreBaskerville(textStyle: TextStyle(fontSize: 20, color: Colors.brown)),),
//                          );
//                        }).toList(),
//                  value: dropdownValue,
//                  onChanged: (value){
//                      setState(() {
//                        dropdownValue=value;
//                      });
//                      },
//                ),
//              ],
//            ),
            SizedBox(height: 20,),
            TextField(
              onChanged: (value){categoryTitle = value;
              print(categoryTitle);},
              decoration: kTextFieldDecoration.copyWith(hintText: 'Edit Category Name',),
            ),
            SizedBox(height: 20,),
            FlatButton(
                  onPressed: (){
                    print("this: ${categoryTitle.toString()}");
                    Provider.of<CardData>(context, listen: false).editToList("$categoryTitle", (dropdownValue == "Expense"? true : false), widget.position, widget.prevName);
                    Navigator.pop(context);
                    },
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  color: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Edit Category", style: kdropDownTextStyle,),
                  )
            ),
          ],
        ),
      ),
    );
  }
}
