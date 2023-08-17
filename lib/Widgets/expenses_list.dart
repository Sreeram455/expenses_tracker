import 'package:expenses_tracker/model/expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:expenses_tracker/Widgets/expenses_item.dart';
import 'package:expenses_tracker/expenses.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget{
  const ExpensesList({super.key,required this.expenses,required this.onRemoveExpense});
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;
  Widget build(context){

    return ListView.builder(itemCount:expenses.length,itemBuilder:(ctx,index) =>
        Dismissible(key:ValueKey(expenses[index]) ,background:Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.65),
          margin:EdgeInsets.symmetric(horizontal: Theme.of(context).cardTheme.margin!.horizontal)
        ), child: ExpenseItem(expenses[index]),
        onDismissed: (directon){onRemoveExpense(expenses[index]);},));



  }
}
// we use listview.builder in place of column because list view is scrollable and  another main
//advantage listview.builder is it only stores data that displays at the screen
//unseen data will be get automatically when we scroll up
//thats why we use listview.builder in place of listview