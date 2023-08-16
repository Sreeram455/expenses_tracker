import 'package:flutter/material.dart';
class NewExpense extends StatefulWidget{
  const NewExpense({super.key});
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
  @override
  void dispose(){
    _titleController.dispose;
    _amountController.dispose;
  super.dispose();
  }
  @override
  Widget build(context){
    return   Padding(padding: const EdgeInsets.all(16),
    child:Column(children: [
      TextField(
      controller:_titleController,
      maxLength: 30,
      decoration: const InputDecoration(
        label: Text('Title')
      ),
      keyboardType: TextInputType.text,),
      TextField(
        controller:_amountController,
        maxLength: 30,
        decoration: const InputDecoration(
          prefixText: '\$',
            label: Text('Amount')
        ),
        keyboardType: TextInputType.number,),
      Row(children: [
        ElevatedButton(onPressed:(){print(_titleController.text);
          print(_amountController.text);}, child: const Text('Save Expenses')),
        TextButton(onPressed:(){},child:const Text('cancel'))
      ],

      )


    ]));
  }
}