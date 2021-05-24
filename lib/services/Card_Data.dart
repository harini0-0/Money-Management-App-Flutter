import 'package:flutter/material.dart';
import 'package:moneymanagementapp/utilities/cardview.dart';

class CardData extends ChangeNotifier{
  var cardsList = [CardItemModel("Food & Restaurants", Icons.fastfood, 9, 0.83),CardItemModel("Shopping", Icons.shop, 12, 0.24),CardItemModel("Entertainment", Icons.movie, 7, 0.32)];
  var incomeList =[CardItemModel("Gift Vouchers", Icons.wallet_giftcard, 9, 0.83),CardItemModel("Salary", Icons.money, 9, 0.83),];

  void addToList(String categoryName, bool transType){
    if(transType ==true){
      cardsList.add(CardItemModel(categoryName, Icons.dashboard_customize, 0, 0));
      notifyListeners();
    }
    else {
      incomeList.add(CardItemModel("$categoryName", Icons.dashboard_customize, 0, 0));
      notifyListeners();
    }
  }
}