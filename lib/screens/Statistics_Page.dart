import 'package:flutter/material.dart';
import 'package:moneymanagementapp/services/Card_Data.dart';
import 'package:moneymanagementapp/utilities/constants.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:google_fonts/google_fonts.dart';

class StatisticScreen extends StatefulWidget {
  @override
  _StatisticScreenState createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  //final List<int> typechecker =[10,20,30,4];
  //final List<String> typechecker2 = ['a','b','c','d'];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<CardData>(context, listen: false).getAllData();
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Center(
                child: Text(
              "Statistics",
              style: GoogleFonts.kaushanScript(
                  textStyle: TextStyle(color: Color(0xffE8816D), fontSize: 40)),
            )),
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "Monthly Expenses",
                textAlign: TextAlign.left,
                style: GoogleFonts.kaushanScript(
                    textStyle: TextStyle(
                  color: Color(0xffF67280),
                  fontSize: 30,
                )),
              ),
              Expanded(
                child: Container(
                    color: Colors.black,
                    child:
                        SfCircularChart(annotations: <CircularChartAnnotation>[
                      CircularChartAnnotation(
                        widget: Container(
                          child: PhysicalModel(
                            child: Container(
                              height: 83,
                              width: 83,
                              child: Center(child: Text("")),
                            ),
                            shape: BoxShape.circle,
                            elevation: 15,
                            shadowColor: Colors.black,
                            borderRadius: BorderRadius.circular(220),
                            color: Colors.white30,
                          ),
                        ),
                      ),
                      CircularChartAnnotation(
                        widget: Container(
                          child: const Text(
                            '',
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 0.5),
                                fontSize: 25),
                          ),
                        ),
                      ),
                    ], series: <CircularSeries>[
                      DoughnutSeries<int, String>(
                        dataSource: chart1.keys.toList(),
                        xValueMapper: (int data, _) => data.toString(),
                        yValueMapper: (int data, _) => chart1[data],
                        dataLabelMapper: (int data, _) =>
                            "${months[(data ~/ 10000)]}-${data % 10000}", // Radius of doughnut
                        radius: '60%',
                        explode: true,
                        explodeGesture: ActivationMode.singleTap,
                        explodeOffset: "15%",
                        enableSmartLabels: true,
                        dataLabelSettings: DataLabelSettings(
                          isVisible: true,
                          labelAlignment: ChartDataLabelAlignment.bottom,
                          labelPosition: ChartDataLabelPosition.outside,
                          color: Colors.grey,
                          //borderColor: Colors.red,
                        ),
                      )
                    ])),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Monthly Income",
                textAlign: TextAlign.left,
                style: GoogleFonts.kaushanScript(
                    textStyle: TextStyle(
                  color: Color(0xffF67280),
                  fontSize: 30,
                )),
              ),
              Expanded(
                child: Container(
                    color: Colors.black,
                    child:
                        SfCircularChart(annotations: <CircularChartAnnotation>[
                      CircularChartAnnotation(
                        widget: Container(
                          child: PhysicalModel(
                            child: Container(
                              height: 83,
                              width: 83,
                              child: Center(child: Text("")),
                            ),
                            shape: BoxShape.circle,
                            elevation: 15,
                            shadowColor: Colors.black,
                            borderRadius: BorderRadius.circular(220),
                            color: Colors.white30,
                          ),
                        ),
                      ),
                      CircularChartAnnotation(
                        widget: Container(
                          child: const Text(
                            '',
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 0.5),
                                fontSize: 25),
                          ),
                        ),
                      ),
                    ], series: <CircularSeries>[
                      DoughnutSeries<int, String>(
                        dataSource: chart2.keys.toList(),
                        xValueMapper: (int data, _) => data.toString(),
                        yValueMapper: (int data, _) => chart2[data],
                        dataLabelMapper: (int data, _) =>
                            "${months[(data ~/ 10000)]}-${data % 10000}", // Radius of doughnut
                        radius: '60%',
                        explode: true,
                        explodeGesture: ActivationMode.singleTap,
                        explodeOffset: "15%",
                        enableSmartLabels: true,
                        dataLabelSettings: DataLabelSettings(
                          isVisible: true,
                          labelAlignment: ChartDataLabelAlignment.bottom,
                          labelPosition: ChartDataLabelPosition.outside,
                          color: Colors.grey,
                          //borderColor: Colors.red,
                        ),
                      )
                    ])),
              ),
            ],
          ))),
    );
  }
}
