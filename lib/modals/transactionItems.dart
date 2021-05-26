import 'package:hive/hive.dart';
part 'transactionItems.g.dart';

@HiveType(typeId:0)
class Item extends HiveObject{
  @HiveField(0)
  String transactionType; //Expense or Income
  @HiveField(1)
  String categoryName;    //Categories such as Food, Shopping, etc..
  @HiveField(2)
  String transName;       //Item in a specific Category
  @HiveField(3)
  double amount;          //Amount spent or gained by this Transaction
  @HiveField(4)
  DateTime dateTime;      //Transaction Date

  Item({this.transactionType, this.categoryName, this.transName, this.amount, this.dateTime});
}