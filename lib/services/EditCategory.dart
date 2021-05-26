import 'Card_Data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:moneymanagementapp/utilities/constants.dart';

class EditCategory extends StatefulWidget {
  final int position;
  final String prevName;
  final String cat;
  EditCategory({this.position, this.prevName, this.cat});
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
        decoration: kcontainerDeco,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Edit Category Details", style: kdropDownTextStyle.copyWith(decoration: TextDecoration.underline),),
            SizedBox(height: 80,),
            TextField(
              onChanged: (value){categoryTitle = value;},
              decoration: kTextFieldDecoration.copyWith(hintText: 'Edit Category Name',),
            ),
            SizedBox(height: 20,),
            FlatButton(
                  onPressed: (){
                    Provider.of<CardData>(context, listen: false).editToList("$categoryTitle", (widget.cat == "Expense"? true : false), widget.position, widget.prevName);
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
