import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:moneymanagementapp/utilities/cardview.dart';
import 'package:moneymanagementapp/utilities/constants.dart';
import 'package:moneymanagementapp/modals/categoryItems.dart';
import 'package:moneymanagementapp/modals/transactionItems.dart';

class CardData extends ChangeNotifier {
  static double totalAmount;
  List<Item> transList =[];
  List<CardItemModel> cardsList = [];
  List<CardItemModel> incomeList =[];
  double get counter => totalAmount;
  void refresh(){
    var boxTrans = Hive.box("TotalAmount");
    var boxCat = Hive.box(catBoxName);
    totalAmount=boxTrans.get("Amount");
    double total=0;
    for(int i=0;i<boxCat.length;i++){
      CategoryItem item2 =boxCat.getAt(i);
      if(item2.transactionType=="Expense")
        total-=item2.amount;
      else{
        total+=item2.amount;
      }
    }
    totalAmount+=total;
    boxTrans.put("Amount",totalAmount);
  }
  void addToList(String categoryName, bool transType) {
    var boxTrans = Hive.box(catBoxName);
    if(transType ==true){
      CategoryItem item2 = CategoryItem(categoryName: categoryName, transactionType: "Expense");
      boxTrans.put(item2.categoryName, item2);
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
    notifyListeners();
  }
  void addToTransList(Item item){
    transList.add(item);
  }
  void deduction(Item item){
    var boxCat = Hive.box(catBoxName);
    boxCat.get(item.categoryName).amount -= item.amount;
    boxCat.get(item.categoryName).quantity -= 1;
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
    refresh();
    notifyListeners();
  }
}