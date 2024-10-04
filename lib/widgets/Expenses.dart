import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/bottom_modal.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_list.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
State<Expenses> createState(){
return _ExpensesState();
 }
}
class _ExpensesState extends State<Expenses>{
  final List<expense> _registeredexpenses=[];
 void _openaddexpenseoverlay(){
    showModalBottomSheet(
       useSafeArea: true,
       isScrollControlled: true,
       context: context,
       builder: (ctx) { //in this context hold information for whole widget and ctx hold information for that bottom sheet;
         return bottommodal(onaddexpense: _addallexpense,);
       });
       }
void _addallexpense(expense expensefrombottom){
   setState(() {
     _registeredexpenses.add(expensefrombottom);
   });
}
void _removexpense(expense removedbysliding){
   final expenseindex=_registeredexpenses.indexOf(removedbysliding);
   setState(() {
     _registeredexpenses.remove(removedbysliding);
   });
   ScaffoldMessenger.of(context).clearSnackBars();
   ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
           duration: const Duration(seconds: 3) ,
           content:const Text("Expense Deleted"),
           action:
           SnackBarAction(
             label:"undo",
           onPressed:(){
               setState(() {
                 _registeredexpenses.insert(expenseindex,removedbysliding);//here insert will add that expense at the same index from where it is removed intead of add
               });
           }
       ),
       )
   );
}
  @override
  Widget build(context){
   Widget maincontent=const Center(child:Text("No expense Yet, Try to add some!!") ,);
   if(_registeredexpenses.isNotEmpty){
     maincontent=ExpenseList(expensess:_registeredexpenses,onremovexpense: _removexpense);
   }
return Scaffold(
  appBar: AppBar(
    title: const Text("My Expenses"),
    actions: [
      IconButton(
          onPressed:
          _openaddexpenseoverlay,
          icon:const Icon(Icons.add)),
    ],
  ),
  body: Column(
    children:[
    const Padding(
      padding:  EdgeInsets.all(16.0),
      child: Text("My List Of Expenses!!"),
    ),
      Expanded(child:maincontent) ,
    ],
  ),
);
  }
}