//
// import 'package:expense_tracker/models/expense.dart';
// import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
// import 'package:flutter/cupertino.dart';
// class ExpenseList extends StatelessWidget{
//   ExpenseList({super.key,required this.expensess,required this.onremovexpense});
//   final List<expense> expensess;
//   final void Function(expense expense) onremovexpense;
//   @override
//  Widget build(context){
//     return ListView.builder(itemCount:expensess.length,itemBuilder:(context,index){
//       return Dismissible(key:ValueKey(expensess[index]),
//             background:Container(color:CupertinoColors.systemGrey3.withOpacity(0.85),),
//             onDismissed:(direction){
//           onremovexpense(expensess[index]);
//             } ,
//             child:expenseitem(expensess[index]),
//         );
//
//       },);
//   }
// }