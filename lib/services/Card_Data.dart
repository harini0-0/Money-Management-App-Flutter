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
  List<Item> transList =[];
  List<CardItemModel> cardsList = [];
  List<CardItemModel> incomeList =[];
  double get counter => totalAmount;
  double get expCounter => totalExpense;
  double get inmCounter => totalIncome;
//  void refreshAmount({double num=0.0,context})async{
//    print("refreshed amt");
//    var boxTrans = Hive.box("TotalAmount");
//    double checker= totalExpense-totalIncome;
//    if(checker>0 && num<checker)
//      return showDialog<void>(
//      context: context,
//      barrierDismissible: false, // user must tap button!
//      builder: (BuildContext context) {
//        return AlertDialog(
//          title: const Text('Balance insufficient'),
//          content: SingleChildScrollView(
//            child: ListBody(
//              children: const <Widget>[
//                Text('Update not possible. Please try again with sufficient Balance'),
//              ],
//            ),
//          ),
//          actions: <Widget>[
//            TextButton(
//              child: const Text('Ok'),
//              onPressed: () {
//                Navigator.of(context).pop();
//              },
//            ),
//          ],
//        );
//      },
//    );
//    if(num!=0)
//      boxTrans.put("Amount",num);
//
//    //refresh();
//  }
  void refresh({double num=0.0}){
    print("refreshed");
    var boxTrans = Hive.box("TotalAmount");
    var boxCat = Hive.box(catBoxName);
    totalAmount=boxTrans.get("Amount");
    double total=0;
    double expense=0;
    double income=0;
    for(int i=0;i<boxCat.length;i++){
      CategoryItem item2 =boxCat.getAt(i);
      if(item2.transactionType=="Expense") {
        total -= item2.amount;
        expense+= item2.amount;
        print("exp-${item2.amount}");
      }
      else{
        total+=item2.amount;
        income+=item2.amount;
        print("inc -$income");
      }
    }
//    if(expense<0)
//      expense*=-1;
//    if(income<0)
//      income*=-1;
    //total = expense-income;
//    if(total<0)
//      total*=-1;
    totalAmount+=total;
    totalExpense=expense;
    totalIncome=income;
    print("$total");
    //getAllData();
    //boxTrans.put("Amount",25000.0);
    displayData();
  }
  void getAllData(){
    var boxTrans = Hive.box(itemBoxName);
//    expenseData.clear();
//    incomeData.clear();
    chart1.clear();
    for(int i=0;i<boxTrans.length;i++){
      Item item = boxTrans.getAt(i);
      int date =(item.dateTime.month*10000)+ item.dateTime.year;
      if(item.transactionType=="Expense") {
        //print("this amt :$date- ${item.dateTime.month}");
        double value = chart1[date] ;
        if(value!=null)
          chart1[date] = (item.amount)+value;
        else
          chart1[date] = (item.amount);
      //print(chart1);
      }
      else{
        double value = chart2[date] ;
        if(value!=null)
          chart2[date] = (item.amount)+value;
        else
          chart2[date] = (item.amount);
      }
    }
  }
  void displayData(){
    var boxTrans = Hive.box(catBoxName);

    for(int i=0;i<boxTrans.length;i++){
      CategoryItem item2 = boxTrans.getAt(i);
      //print("${item2.transactionType}-${item2.categoryName}-${item2.amount}-${item2.quantity}");
    }
    if(Hive.isBoxOpen(itemBoxName)){
      var boxCat = Hive.box(itemBoxName);
      for(int i=0;i<boxCat.length;i++){
        Item item2 =boxCat.getAt(i);
        //print("${item2.categoryName}-${item2.transactionType}-${item2.transName}-${item2.amount}");
      }
    }
  }
  void addToList(String categoryName, bool transType) {
    var boxTrans = Hive.box(catBoxName);
    if(transType ==true){
      CategoryItem item2 = CategoryItem(categoryName: categoryName, transactionType: "Expense");
      print("adding to List: ${item2.categoryName}");
      //cardsList.add(CardItemModel(item2.categoryName, Icons.dashboard_customize,0 ,0));
      boxTrans.put(item2.categoryName, item2);
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
  void addNewTransaction(Item item){
    var boxTrans = Hive.box(itemBoxName);
    var boxCat = Hive.box(catBoxName);
    CategoryItem item2 =boxCat.get(item.categoryName);
    item2.amount += item.amount;
    item2.quantity += 1;
    item2.save();
    boxTrans.put(item.transName, item);
//    boxCat.put(item2.categoryName, item2);
    refresh();
    notifyListeners();
  }
  void addToTransList(Item item){
    transList.add(item);
    //print("Translist refresh action: ${item.amount}");
  }
  void deduction(Item item){
    var boxCat = Hive.box(catBoxName);
    CategoryItem hello=boxCat.get(item.categoryName);
    hello.amount= hello.amount - item.amount;
    hello.quantity = hello.quantity -1;
    hello.save();
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


//dirty code
//deduction func
//    print("deduction happening");
//    print("before deduction amt of categ: ${boxCat.get(item.categoryName).amount}");
//double nowamt =boxCat.get(item.categoryName).amount;
//    nowamt -=item.amount;
//    int qty = boxCat.get(item.categoryName).quantity -1 ;
//    boxCat.put(item.categoryName, CategoryItem(transactionType: item.transactionType, categoryName: item.categoryName, amount: nowamt, quantity: qty));
//    boxCat.get(item.categoryName).amount -= item.amount;
//    boxCat.get(item.categoryName).quantity -= 1;
//print("after deduction amt of categ: ${boxCat.get(item.categoryName).amount}");

//editToList
//    var boxTrans = Hive.box(catBoxName);
//    var boxCat = Hive.box(itemBoxName);
//    CategoryItem item = boxTrans.get(previousName);
//    CardItemModel adder = CardItemModel(categoryName, Icons.dashboard_customize, 0, 0);
//    item.categoryName=categoryName;
//    item.save();
//    for(int i=0;i<boxCat.length;i++){
////      CategoryItem item2 = CategoryItem(categoryName: categoryName, transactionType: "Expense");
////      boxTrans.put(categoryName, item2);
////      boxTrans.delete(previousName);
//      if(position!=null)
//        cardsList[position]=adder;
//      notifyListeners();
//
//    if {
//      CategoryItem item2 = CategoryItem(categoryName: categoryName, transactionType: "Incomes");
//      boxTrans.put(categoryName, item2);
//      incomeList[position]=adder;
//      boxTrans.delete(previousName);
//      notifyListeners();
//    }