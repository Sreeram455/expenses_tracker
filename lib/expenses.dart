import 'package:expenses_tracker/Widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expenses_tracker/model/expense.dart';
import 'package:expenses_tracker/Widgets/expenses_list.dart';
import 'package:expenses_tracker/Widgets/chart/chart.dart';
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
  void _addExpense(Expense expense){
    setState(() {
      _registeredExpenses.add(expense);
    });
  }
  void _removeExpense(Expense expense){
    final expenseIndex=_registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();// we do this because we dont want any delay when we delete two or three expenses
    //simultaneously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: const Text('Expense delted'),
        duration: const Duration(seconds: 5),
      action: SnackBarAction(label: 'undo',
      onPressed: (){
        setState(() {
          _registeredExpenses.insert(expenseIndex,expense);
        });
      },),)

    );
  }
  void _openAddExpenses(){
    showModalBottomSheet(isScrollControlled:true,context: context, builder:
    (ctx)=> NewExpense(onAddExpense: _addExpense,));
  }

  @override
  Widget build(context){
    Widget maincontent=const Center(child: Text('No expenses found try to add some'),);
    if(_registeredExpenses.isNotEmpty){
      maincontent=ExpensesList(expenses: _registeredExpenses,onRemoveExpense: _removeExpense,);
    }
    return  Scaffold(
        appBar: AppBar(title: const Text('Expense Tracker'),
            actions: [IconButton(onPressed:_openAddExpenses, icon: const Icon(Icons.add))]),
        body: Column(children: [Chart(expenses:_registeredExpenses),
     Expanded(child:maincontent)]//here two columns are there so we use expandes one in expenses and other in
      //expenses list if two columns are present then flutter will be confused so we use expanded

    ));
  }
}