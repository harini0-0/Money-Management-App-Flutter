import 'package:flutter/material.dart';
import 'package:moneymanagementapp/services/Card_Data.dart';
import 'package:provider/provider.dart';
import 'cardview.dart';
import 'constants.dart';
import 'package:moneymanagementapp/services/EditCategory.dart';

class CardDetails extends StatelessWidget {
  CardDetails({
    @required this.cardList,
    this.position,
    this.deleteCallback,
    this.cat,
  });
  final cat;
  final Function deleteCallback;
  final List<CardItemModel> cardList;
  final int position;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: new NetworkImage(imageUrls[position%(imageUrls.length)])
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(cardList[position].icon, color: Color(0xffE8816D)),
                Row(
                  children: [
                    GestureDetector(
                      onTap:(){
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context)=> SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                              child: Container(
                                height: 330,
                                child: EditCategory(cat: cat, position: position, prevName: cardList[position].cardTitle,),
                              ),
                            ),
                          ),
                        );
                      },
                      child: Icon(Icons.edit, color: Colors.redAccent,),
                    ),
                    GestureDetector(
                        onTap: (){
                          deleteCallback(cardList[position].cardTitle, position);
                        },child: Icon(Icons.delete, color: Colors.red,)),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Text("${cardList[position].transactions} Transactions", style: TextStyle(color: Colors.grey),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Text("${cardList[position].cardTitle}", style: kcardcategoryTypeStyle,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LinearProgressIndicator(value: cardList[position].taskCompletion,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}