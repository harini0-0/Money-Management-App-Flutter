import 'package:hive/hive.dart';
//import 'package:flutter/material.dart';
part 'categoryItems.g.dart';


@HiveType(typeId:0)
class CategoryItem extends HiveObject{
  @HiveField(0)
  String transactionType; //Expense or Income
  @HiveField(1)
  String categoryName;    //Categories such as Food, Shopping, etc..
  @HiveField(2)
  double amount;          //Amount spent or gained by this Transaction
  @HiveField(4)
  int quantity;      //Transaction Date

  CategoryItem({this.transactionType="", this.categoryName="", this.amount=0, this.quantity=0});
}