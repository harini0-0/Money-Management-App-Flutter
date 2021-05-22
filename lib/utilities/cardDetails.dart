import 'package:flutter/material.dart';
import 'cardview.dart';
import 'constants.dart';
class CardDetails extends StatelessWidget {
  const CardDetails({
    Key key,
    @required this.cardsList,
    this.position,
  });

  final List<CardItemModel> cardsList;
  final int position;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: new NetworkImage(imageUrls[position%cardsList.length])
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
                Icon(cardsList[position].icon, color: Color(0xffE8816D)),
                Icon(Icons.more_vert, color: Colors.grey,),
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
                  child: Text("${cardsList[position].tasksRemaining} Items", style: TextStyle(color: Colors.grey),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Text("${cardsList[position].cardTitle}", style: kcardcategoryTypeStyle,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LinearProgressIndicator(value: cardsList[position].taskCompletion,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}