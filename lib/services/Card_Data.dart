import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:moneymanagementapp/utilities/cardview.dart';
import 'package:moneymanagementapp/utilities/constants.dart';
import 'package:moneymanagementapp/modals/categoryItems.dart';
import 'package:moneymanagementapp/modals/transactionItems.dart';

class CardData extends ChangeNotifier {
  static double totalAmount;
  static double totalExpense;
  static double totalIncome;
  static Map<int, double> chart2={};
  List<Item> transList =[];
  List<CardItemModel> cardsList = [];
  List<CardItemModel> incomeList =[];
  double get counter => totalAmount;
  double get expCounter => totalExpense;
  double get inmCounter => totalIncome;
  Map<int, double> get charter => chart2;
  void refresh(){
    print("print");
    var boxTrans = Hive.box("TotalAmount");
    var boxCat = Hive.box(catBoxName);
    //boxTrans.put("Amount",25000.0);
    totalAmount=boxTrans.get("Amount");
    double total=0;
    double expense=0;
    double income=0;
    for(int i=0;i<boxCat.length;i++){
      CategoryItem item2 =boxCat.getAt(i);
      if(item2.transactionType=="Expense") {
        total -= item2.amount;
        expense+= item2.amount;
        print("expense: ${item2.amount}");
      }
      else{
        total+=item2.amount;
        income+=item2.amount;
        print("income: $income");
      }
    }
    totalAmount+=total;
    totalExpense=expense;
    totalIncome=income;
    //getAllData();
  }
//  void getAllData()async{
//    var boxTrans = await Hive.openBox(itemBoxName);
//    expenseData.clear();
//    incomeData.clear();
//    for(int i=0;i<boxTrans.length;i++){
//      Item item = boxTrans.getAt(i);
//      if(item.transactionType=="Expense") {
//        int date =(item.dateTime.month*1000)+ item.dateTime.year;
//        print("this amt :$date- ${item.amount}");
//        double value = chart1[date] ;
//        //chart1.remove(date);
//        if(chart1.isNotEmpty == false)
//          chart1[date] = (item.amount);
//        else
//          chart1[date] = (item.amount)+value;
//        //expenseData.add();
//        print("this amt :$date- ${chart1[date]}");
//      }
//      else{
//        //incomeData.add(StatData("${item.dateTime.month}-${item.dateTime.year}", (item.amount/totalIncome)*100.0));
//      }
//    }
//  }
  void addToList(String categoryName, bool transType) {
    var boxTrans = Hive.box(catBoxName);
    if(transType ==true){
      CategoryItem item2 = CategoryItem(categoryName: categoryName, transactionType: "Expense");
      print("got in: ${item2.categoryName}");
      //cardsList.add(CardItemModel(item2.categoryName, Icons.dashboard_customize,0 ,0));
      boxTrans.put(item2.categoryName, item2);
      //boxTrans.delete(categoryName);
      //boxTrans.put(categoryName, item2);
      print(boxTrans.get(item2.categoryName).categoryName);
      notifyListeners();
    }
    else {
      CategoryItem item2 = CategoryItem(categoryName: categoryName, transactionType: "Incomes");
      boxTrans.put(item2.categoryName, item2);
      notifyListeners();
    }
    refresh();
  }
  void editToList(String categoryName, bool transType, int position, String previousName) {
    var boxTrans = Hive.box(catBoxName);
    CardItemModel adder = CardItemModel(categoryName, Icons.dashboard_customize, 0, 0);
    if(transType ==true){
      CategoryItem item2 = CategoryItem(categoryName: categoryName, transactionType: "Expense");
      boxTrans.put(categoryName, item2);
      boxTrans.delete(previousName);
      if(position!=null)
        cardsList[position]=adder;
      notifyListeners();
    }

    else {
      CategoryItem item2 = CategoryItem(categoryName: categoryName, transactionType: "Incomes");
      boxTrans.put(categoryName, item2);
      incomeList[position]=adder;
      boxTrans.delete(previousName);
      notifyListeners();
    }
  }
  void listGetterExpense(Item item){
    var boxTrans = Hive.box(itemBoxName);
    var boxCat = Hive.box(catBoxName);
    boxCat.get(item.categoryName).amount += item.amount;
    boxCat.get(item.categoryName).quantity += 1;
    boxTrans.put(item.transName, item);
    refresh();
    notifyListeners();
  }
  void addToTransList(Item item){
    transList.add(item);
  }
  void deduction(Item item){
    print("here");
    var boxCat = Hive.box(catBoxName);
    boxCat.get(item.categoryName).amount -= item.amount;
    boxCat.get(item.categoryName).quantity -= 1;
    print("amt: ${boxCat.get(item.categoryName).amount}");
    refresh();
  }
  void deleteSameCategoryItems(String categoryName){
    var boxTrans = Hive.box(itemBoxName);
    var boxCat = Hive.box(catBoxName);
    for(int i=0;i<boxTrans.length;i++){
      Item item = boxTrans.getAt(i);
      if(item.categoryName==categoryName){
        boxCat.get(item.categoryName).amount -= item.amount;
        boxCat.get(item.categoryName).quantity -= 1;
        boxTrans.delete(item.transName);
      }
    }
    //refresh();
    notifyListeners();
  }
}