import 'package:expenses_tracker/Widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expenses_tracker/model/expense.dart';
import 'package:expenses_tracker/Widgets/expenses_list.dart';
class Expenses extends StatefulWidget{
  const Expenses({super.key});
  @override
  State<Expenses>createState(){
    return _ExpensesState();
  }
}
class _ExpensesState extends State<Expenses>{
  @override
  final List<Expense> _registeredExpenses=[
    Expense(title:'flutter course',
    amount: 200,
    date: DateTime.now(),
    category: Category.Work),
    Expense(title: 'cinema', amount: 200, date: DateTime.now(), category:Category.Leisure)

  ];
  void _openAddExpenses(){
    showModalBottomSheet(context: context, builder:
    (ctx)=> const NewExpense());
  }
  @override
  Widget build(context){
    return  Scaffold(
        appBar: AppBar(title: Text('Expense Tracker'),
            actions: [IconButton(onPressed:_openAddExpenses, icon: Icon(Icons.add))]),
        body: Column(children: [const Text("Graphs",style: TextStyle(color: Colors.amberAccent),),
     Expanded(child:ExpensesList(expenses: _registeredExpenses,))]//here two columns are there so we use expandes one in expenses and other in
      //expenses list if two columns are present then flutter will be confused so we use expanded

    ));
  }
}