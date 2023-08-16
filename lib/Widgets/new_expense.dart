import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expenses_tracker/model/expense.dart';
class NewExpense extends StatefulWidget{
  const NewExpense({super.key,required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;
  @override
  State<NewExpense>createState(){
    return _NewExpenseState();
  }
}
class _NewExpenseState extends State<NewExpense>{
  // var _enteredtitle='';
  // void _savetitleinput(String inputvalue){
  //   _enteredtitle=inputvalue;
  // }

  final _titleController=TextEditingController();
  final _amountController=TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory=Category.Leisure;
  @override
  void dispose(){
    _titleController.dispose;
    _amountController.dispose;
  super.dispose();
  }

  @override
  Widget build(context){
    void _submitexpense(){
      final enteredAmount=double.tryParse(_amountController.text);//tryparse('hello')=null,tryparse(22)=22
      final amountIsInvalid=enteredAmount==null || enteredAmount<=0;
      if(_titleController.text.trim().isEmpty || amountIsInvalid || _selectedDate==null){
        showDialog(context: context, builder: (ctx)=> AlertDialog(title:const  Text('Invalid input'),
            content:const Text('Please make sure you enter all values of title,amount,date'),
      actions: [TextButton(onPressed: (){Navigator.pop(context);}, child: const Text('Okay'))],));
        return;// we use return we dont wanna execute below lines if aboue if condition is true
      //otherwise it also stores error data
      }
      widget.onAddExpense(Expense(title: _titleController.text, amount:enteredAmount, date: _selectedDate!,
          category: _selectedCategory));//! means we tell dart it is not empty
      Navigator.pop(context);
    }

    void _presentdatepicker() async{
      final pickedDate=await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(DateTime.now().year-1,DateTime.now().month,
      DateTime.now().day), lastDate: DateTime.now());
      //we do this because we want to update the date according to date today
      setState(() {
        _selectedDate=pickedDate;
      });
    }

    return   Padding(padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
    child:Column(children: [
      TextField(
      controller:_titleController,
      maxLength: 30,
      decoration: const InputDecoration(
        label: Text('Title')
      ),
      keyboardType: TextInputType.text,),
      Row(
        children: [
          Expanded(
            child: TextField(
              controller:_amountController,
              maxLength: 30,
              decoration: const InputDecoration(
                prefixText: '\$',
                  label: Text('Amount')
              ),
              keyboardType: TextInputType.number,),
          ),
          Expanded(child:Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Text(_selectedDate==null ? 'No date Selected': formatter.format(_selectedDate!),),
              IconButton(onPressed: _presentdatepicker, icon: const Icon(Icons.calendar_month))

          ],))
        ],
      ),
      const SizedBox(height: 20,),
      Row(children: [
          DropdownButton(value:_selectedCategory,
            items: Category.values.map((category)=>DropdownMenuItem(value:category,
            child:Text(
            category.name.toUpperCase()))).toList(),
            onChanged: (value){
          if(value==null){
            return;
          }
          setState(() {
            _selectedCategory=value;
          });
            }),
        const Spacer(),
        ElevatedButton(onPressed:_submitexpense, child: const Text('Save Expenses')),
        TextButton(onPressed:(){Navigator.pop(context);},child:const Text('cancel'))//we use navigator.pop to come back to home screen

      ],

      )


    ]));
  }
}