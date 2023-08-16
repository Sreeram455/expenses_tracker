import 'package:expenses_tracker/model/expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:expenses_tracker/Widgets/expenses_item.dart';

class ExpensesList extends StatelessWidget{
  const ExpensesList({super.key,required this.expenses});
  final List<Expense> expenses;
  Widget build(context){
    return ListView.builder(itemCount:expenses.length,itemBuilder:(ctx,index) => ExpenseItem(expenses[index]));



  }
}
// we use listview.builder in place of column because list view is scrollable and  another main
//advantage listview.builder is it only stores data that displays at the screen
//unseen data will be get automatically when we scroll up
//thats why we use listview.builder in place of listview