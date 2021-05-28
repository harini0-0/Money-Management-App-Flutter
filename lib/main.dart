import 'dart:io';

import 'package:flutter/material.dart';
import 'package:moneymanagementapp/screens/Statistics_Page.dart';
import 'package:moneymanagementapp/screens/loading_page.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';
import 'screens/loading_page.dart';
import 'modals/transactionItems.dart';
import 'utilities/constants.dart';
import 'screens/transactions_Page.dart';
import 'modals/categoryItems.dart';
import 'services/Card_Data.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.registerAdapter(ItemAdapter());
  Hive.registerAdapter(CategoryItemAdapter());
  Hive.init(appDocumentDir.path);
  Hive.openBox("TotalAmount");
  //print("hhi");
  //Hive.deleteFromDisk();
  return  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<List<Box>> _openBox() async {
    await Hive.openBox(itemBoxName);
    //Hive.box(itemBoxName).clear();
  }
  @override
  void initState(){
    _openBox();
    super.initState();
  }
  @override
  void dispose() {
    var boxTrans = Hive.box("TotalAmount");
    boxTrans.put("Amount",Provider.of<CardData>(context).counter);
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>CardData(),
      child: MaterialApp(
        title: 'Flutter Demo',
        home : FutureBuilder(
          future: Hive.openBox(catBoxName,),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                print("reached build");
                return Text(snapshot.error.toString());
              }
              else {
                //Hive.box(catBoxName).clear();
                Provider.of<CardData>(context, listen: false).refresh();
                return LoadingScreen();
              }
            } else
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
          },
        ),
      ),
    );
  }
}

