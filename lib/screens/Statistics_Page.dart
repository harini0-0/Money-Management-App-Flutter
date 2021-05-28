import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:moneymanagementapp/services/Card_Data.dart';
import 'package:moneymanagementapp/utilities/constants.dart';
import 'package:moneymanagementapp/modals/transactionItems.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class StatisticScreen extends StatefulWidget {
  @override
  _StatisticScreenState createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {


  final List<int> typechecker =[10,20,30,4];

  final List<String> typechecker2 = ['a','b','c','d'];

//  void getAllData(BuildContext context){
//    var boxTrans = Hive.box(itemBoxName);
//    double expense = Provider.of<CardData>(context).expCounter;
//    double income = Provider.of<CardData>(context).inmCounter;
//    for(int i=0;i<boxTrans.length;i++){
//      Item item = boxTrans.getAt(i);
//      if(item.transactionType=="Expense") {
//        expenseData.add(StatData("${item.dateTime.month}-${item.dateTime.year}", (item.amount/expense)*100.0));
//      }
//      else{
//        incomeData.add(StatData("${item.dateTime.month}-${item.dateTime.year}", (item.amount/income)*100.0));
//      }
//    }
//  }
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    //getAllData(context);
    return Scaffold(
        body: Center(
            child: Container(
                child: SfCircularChart(
                    annotations: <CircularChartAnnotation>[
                      CircularChartAnnotation(
                          widget: Container(
                              child: PhysicalModel(
                                  child: Container(),
                                  shape: BoxShape.circle,
                                  elevation: 10,
                                  shadowColor: Colors.white,
                                  color: const Color.fromRGBO(230, 230, 230, 1)))),
                      CircularChartAnnotation(
                          widget: Container(
                              child: const Text('20',
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 25))))
                    ],
                    series: <CircularSeries>[
                      DoughnutSeries<int, String>(
                          dataSource: chart1.keys.toList(),
                          xValueMapper: (int data, _) => chart1[data].toString(),
                          yValueMapper: (int data, _) => chart1[data], // Radius of doughnut
                          radius: '50%'
                      )
                    ]
                )
            )
        )
    );
  }
}

