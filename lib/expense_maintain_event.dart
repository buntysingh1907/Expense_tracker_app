
part of 'expense_maintain_bloc.dart';


sealed class ExpenseEvent{}

class LoadExpenses extends ExpenseEvent {}

class AddExpense extends ExpenseEvent {
  final Expensemodel expense;

   AddExpense(this.expense);

  @override
  List<Object> get props => [expense];
}

class DeleteExpense extends ExpenseEvent {
  final String id;

   DeleteExpense(this.id);

  @override
  List<Object> get props => [id];
}
