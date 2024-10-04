import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
const uuid=Uuid();
enum Category{ food,travel,leisure,work }
final formatter=DateFormat.yMd();
const categoryicons={
  Category.food:Icons.lunch_dining,
  Category.travel:Icons.flight_takeoff_rounded,
  Category.leisure:Icons.movie_filter_outlined,
  Category.work:Icons.work_history_outlined,
};

class Expensemodel {
  String? titleExpense;
  String? amountExpense;
  DateTime?  dateExpense;
  String? typeExpense;
  String? idExpense;

  Expensemodel(
      {this.titleExpense,
        this.amountExpense,
        this.dateExpense,
        this.typeExpense,
        }):idExpense=uuid.v4();

  Expensemodel.fromJson(Map<String, dynamic> json) {
    titleExpense = json['titleExpense'];
    amountExpense = json['amountExpense'];
    dateExpense = json['dateExpense'];
    typeExpense = json['typeExpense'];
    idExpense = json['idExpense'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titleExpense'] = this.titleExpense;
    data['amountExpense'] = this.amountExpense;
    data['dateExpense'] = this.dateExpense;
    data['typeExpense'] = this.typeExpense;
    data['idExpense'] = this.idExpense;
    return data;
  }
  String  get formatteddate{
    return formatter.format(dateExpense!);
  }
}