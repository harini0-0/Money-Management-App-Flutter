# Money Management App

A new Flutter application based on a wallet app, which includes hive db and provider State Management

##Demo Video & Explanation

https://user-images.githubusercontent.com/66105380/120023172-0e2dfc00-c00b-11eb-87b5-71ba98a7dd9d.mp4
<br>
(0.0) - App Loads <br>
(0.00 - 0.30) - Display of all the Categories and Items  <br>
(0.31 - 1.23) - Addition of XEntertainment custom category and Transaction items in it. Reflection of these transaction in the final Balance.  <br>
                Initial Balance - Rs 25450.0  <br>
                Final Balance - Rs 25050.0  <br>
(1.24 - 2.16) - Addition of New Custom Category "Online" and editing the category name from "Online" to "Online Items". Addition of new Transactions to this category but displays an Alert Popup for Transactions which costs more than the Balance amount ie insufficient Balance. Readded transaction  <br>
                Initial Balance - Rs 25050.0 <br>
                Final Balance - Rs 22050.0 <br>
(2.17 - 2.29) - Reflection in Statistics page and each item explodes on Tap <br>
(2.30 - 2:42) - Deletion of a Transaction in Gift Vouchers and Reflection of the same in Statistics Page. <br>
                Initial Balance - Rs 22050.0 <br>
                Final Balance - Rs 21050.0 <br>
(2:43 - 3:01) - Deletion of a Whole Category and Reflection Of the same in Statistics Page. <br>
                Initial Balance - Rs 21050.0 <br>
                Final Balance - Rs 21310.0 <br>
(3:02 - 3:36) - Addition of new Custom category in Incomes, "Pocket Money" and new Transaction in this category. <br>
(3:36 - 3:46) - Reflection of the transactiosn in Statistics page and Balance, Exit App. <br>
                

## List of Implemented Features
- Add, Delete, Edit Custom Categories
- Add new Transactions to any Category
- Delete existing Transactions
- Automatic reflection of Addition or deletion of Transaction in the Balance Amount
- Statistics Page on Monthly Expenses and Incomes
- Shows Alert for insufficient Balance for a Transaction
- Explode items on Tap
- Smooth UI using Flutter & Dart
- Flutter-Hive for Backend & Provider for StateManagement

## List of Non-Implemented Features
- User input for Balance in Cardholder
- Login/SignUp Page

##List of Known Bugs
- Error while editing the category name with many items

##References Used
- https://stackoverflow.com
- https://pub.dev/packages
- https://resocoder.com/2019/09/30/hive-flutter-tutorial-lightweight-fast-database/
- https://medium.com/flutterdevs
- https://github.com
- https://flutter.dev/docs

##Operating System
Windows 10, Android Studio


- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

