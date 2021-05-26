import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:moneymanagementapp/utilities/cardview.dart';
import 'package:moneymanagementapp/utilities/constants.dart';
import 'package:moneymanagementapp/modals/categoryItems.dart';
import 'package:moneymanagementapp/modals/transactionItems.dart';

//var boxTrans = Hive.openBox(catBoxName);

class CardData extends ChangeNotifier {
  List<Item> transList =[];
  List<CardItemModel> cardsList = [];
  List<CardItemModel> incomeList =[];

  void addToList(String categoryName, bool transType) {
    var boxTrans = Hive.box(catBoxName);
    CardItemModel adder = CardItemModel(categoryName, Icons.dashboard_customize, 0, 0);
    if(transType ==true){
      print("hi1");
      CategoryItem item2 = CategoryItem(categoryName: categoryName, transactionType: "Expense");
      boxTrans.put(item2.categoryName, item2);
      print(boxTrans.get(item2.categoryName));
      //cardsList.add(adder);
      //print("hi2");
      notifyListeners();
    }
    else {
      CategoryItem item2 = CategoryItem(categoryName: categoryName, transactionType: "Incomes");
      boxTrans.put(item2.categoryName, item2);
      //incomeList.add(adder);
      notifyListeners();
    }
  }
  void editToList(String categoryName, bool transType, int position, String previousName) {
    var boxTrans = Hive.box(catBoxName);
    CardItemModel adder = CardItemModel(categoryName, Icons.dashboard_customize, 0, 0);
    if(transType ==true){
      print("hi3");
      CategoryItem item2 = CategoryItem(categoryName: categoryName, transactionType: "Expense");
      boxTrans.put(categoryName, item2);
      print(boxTrans.get(categoryName));
      boxTrans.delete(previousName);
      cardsList[position]=adder;
      print("hi4");
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
    boxTrans.put(item.transName, item);
    print("${boxTrans.get(item.transName)}:  ${boxTrans.get(item.transName).transName} -- ${boxTrans.length}");
  }
  void listGetterIncomes(String categoryName){
    CardItemModel adder = CardItemModel(categoryName, Icons.dashboard_customize, 0, 0);
    incomeList.add(adder);
    notifyListeners();
  }
  void addToTransList(Item item){
    transList.add(item);
  }
}


//CardItemModel("Food & Restaurants", Icons.fastfood, 9, 0.83),CardItemModel("Shopping", Icons.shop, 12, 0.24),CardItemModel("Entertainment", Icons.movie, 7, 0.32)
//CardItemModel("Gift Vouchers", Icons.wallet_giftcard, 9, 0.83),CardItemModel("Salary", Icons.money, 9, 0.83),