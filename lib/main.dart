import 'package:flutter/material.dart';
import 'package:moneymanagementapp/screens/loading_page.dart';
import 'package:provider/provider.dart';
import 'screens/loading_page.dart';
import 'screens/transactions_Page.dart';
import 'services/Card_Data.dart';
void main() =>  runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>CardData(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          primaryColor: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute : LoadingScreen.id,
        routes: {
          LoadingScreen.id: (context)=> LoadingScreen(),
          TransactionsScreen.id: (context)=>TransactionsScreen(),
        },
      ),
    );
  }
}

