import 'package:flutter/material.dart';
import 'package:moneymanagementapp/services/AddCategory.dart';
class AddCategoryFAB extends StatelessWidget {
  const AddCategoryFAB({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new FloatingActionButton(
      child: Icon(Icons.category, color: Color(0xffE8616D),),
      backgroundColor: Color(0xffFFC0A4),
      onPressed:(){
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context)=> SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: AddCategory(),
            ),
          ),
        );
      },
    );
  }
}
