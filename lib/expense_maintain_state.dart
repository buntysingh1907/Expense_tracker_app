part of 'expense_maintain_bloc.dart';


sealed class ExpenseState {}

class ExpenseLoading extends ExpenseState {}

class ExpenseLoaded extends ExpenseState {
  final List<Expensemodel> expenses;

   ExpenseLoaded(this.expenses);

  @override
  List<Object> get props => [expenses];
}

class ExpenseError extends ExpenseState {
  final String errors;
  ExpenseError(this.errors);
}

