import 'constants.dart';
import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 7.0, right: 7.0),
      height: 230,
      decoration: kcardHolderStyle,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Card Holder",
                style: kcardHolderNameTextStyle,
              ),
              SizedBox(height: 20,),
              Text("Balance",
                style: kcardBalanceHeadingTextStyle,
              ),
              Text("23000", style: TextStyle(color: Colors.black54, fontSize: 20,),),
            ],
          ),
          Icon(Icons.account_circle, color: Colors.white,size: 120,)
        ],
      ),
    );
  }
}
