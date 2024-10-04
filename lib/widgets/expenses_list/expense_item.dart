import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class expenseitem extends StatelessWidget{
  const expenseitem(this.expensed,{super.key});
    final expense expensed;
@override
  Widget build(context){
    return Card(
               child:Padding(
                 padding: const EdgeInsets.symmetric(
                   horizontal: 15,
                   vertical: 13
                 ),
                 child:Column(
                   children: [ Text(expensed.title),
                     const SizedBox(height: 11,),
                     Row(
                       children: [
                         Text('\$${expensed.amount.toString()}'),
                         const Spacer(),
                            Row(children:[
                             Icon(categoryicons[expensed.categoryy]),
                             const SizedBox(width: 7,),
                             Text(expensed.formatteddate),
                            ],),
                       ],
                     ),
                   ],
                 ),
               )
    );
  }

}