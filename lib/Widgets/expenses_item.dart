import 'package:flutter/material.dart';
import 'package:expenses_tracker/model/expense.dart';
class ExpenseItem extends StatelessWidget{
   const ExpenseItem(this.expense,{super.key});
  final Expense expense;
  @override
  Widget build(context){
    return Card(child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(expense.title,style: Theme.of(context).textTheme.titleLarge),
          SizedBox(height: 30,),
          Row(
            children: [
              Text('\$${expense.amount.toStringAsFixed(2)}'),
              const Spacer(),

            Row(children: [
              Icon(CategoryIcons[expense.category]),
              const SizedBox(width:8),
              Text(expense.FormattedDate),
            ],)
        ],
          )
        ],
      ),
    ),);
  }
}