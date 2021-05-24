import 'package:moneymanagementapp/screens/transactions_Page.dart';
import 'package:moneymanagementapp/services/Card_Data.dart';

import '../utilities/cardDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../utilities/cardview.dart';
import '../utilities/constants.dart';
import 'package:provider/provider.dart';
import 'package:moneymanagementapp/services/AddCategory.dart';


class LoadingScreen extends StatefulWidget {
  static String id="mainPage";
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with TickerProviderStateMixin {

  ScrollController scrollController;
  ScrollController scrollController2;
  var cardIndex = 0;
  var currentColor = Color(0xffE8816D);
  AnimationController animationController;
  AnimationController animationController2;

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
    scrollController2= new ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    //print("build");
    return Scaffold(
      appBar: new AppBar(
        title: new Text("WALLET", style: TextStyle(fontSize: 16.0),),
        backgroundColor: Color(0xffE8816D),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(child: Icon(Icons.account_circle),),
          ),
        ],
        elevation: 0.0,
      ),
      floatingActionButton: new FloatingActionButton(
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
      ),
      backgroundColor: Color(0xffE8816D),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: ListView(
            children: <Widget>[
              Container(
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
              ),
              SizedBox(height: 20,),
              Text("Expense", style: kcategoryTextStyle,),
              Container(
                //padding: EdgeInsets.all(8),
                height: 250,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: Provider.of<CardData>(context, listen: true).cardsList.length,
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, position) {
                    return GestureDetector(
                      onTap: (){
                        print("hello world");
                        Navigator.pushNamed(context, TransactionsScreen.id);
                        },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8, bottom: 8.0, top: 8.0),
                        child: Card(
                          child: CardDetails(cardList: Provider.of<CardData>(context, listen: true).cardsList, position: position,),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                        ),
                      ),
                      onHorizontalDragEnd: (details) {
                        animationController = AnimationController(duration: Duration(milliseconds: 500), vsync: this,);
                        if(details.velocity.pixelsPerSecond.dx > 0 && cardIndex>0) {
                          cardIndex--;
                        }
                        else if(cardIndex<Provider.of<CardData>(context,listen: false).cardsList.length){
                          cardIndex++;
                        }
                        setState(() {
                          scrollController.animateTo((cardIndex)*256.0, duration: Duration(milliseconds: 200), curve: Curves.fastOutSlowIn);
                        });
                        animationController.forward( );
                      },
                    );
                  },
                ),
              ),
              Text("Incomes", style: kcategoryTextStyle,),
              Container(
                height: 250,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: Provider.of<CardData>(context, listen: true).incomeList.length,
                  controller: scrollController2,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, position) {
                    return GestureDetector(
                      onTap: (){
                        print("hello world");
                        Navigator.pushNamed(context, TransactionsScreen.id);
                        },
                      child: Padding(
                        padding: const EdgeInsets.only(right:8.0, bottom: 8.0, top: 8.0),
                        child: Card(
                          child: CardDetails(cardList: Provider.of<CardData>(context, listen: true).incomeList, position: position,),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                        ),
                      ),
                      onHorizontalDragEnd: (details) {
                        animationController2 = AnimationController(
                          duration: Duration(milliseconds: 500),
                          vsync: this,
                        );
                        if(details.velocity.pixelsPerSecond.dx > 0 && cardIndex>0) {
                          cardIndex--;
                        }
                        else if(cardIndex<Provider.of<CardData>(context,listen: false).incomeList.length){
                          cardIndex++;
                        }
                        setState(() {
                          scrollController2.animateTo((cardIndex)*256.0, duration: Duration(milliseconds: 200), curve: Curves.fastOutSlowIn);
                        });
                        animationController2.forward();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(),
    );
  }
}

