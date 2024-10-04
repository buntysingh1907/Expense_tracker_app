import 'package:bloc/bloc.dart';
import 'package:expense_tracker/database_service.dart';
import 'package:expense_tracker/models/expenses_model.dart';
part'expense_maintain_event.dart';
part'expense_maintain_state.dart';



class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  final ExpenseRepository repository;
//hii
  ExpenseBloc(this.repository) : super(ExpenseLoading()) {
    on<LoadExpenses>((event, emit) async {
      try {
        final expensesStream = repository.getExpenses();
        await emit.forEach(expensesStream, onData: (List<Expensemodel> expenses) {
          return ExpenseLoaded(expenses);
        });
      } catch (e) {
        emit(ExpenseError(e.toString()));
      }
    });

    on<AddExpense>((event, emit) async {
      try {
        await repository.addExpense(event.expense);
        add(LoadExpenses());
      } catch (e) {
        emit(ExpenseError(e.toString()));
      }
    });
    on<DeleteExpense>((event, emit) async {
      try {
        await repository.deleteExpense(event.id);
      } catch (e) {
        emit(ExpenseError(e.toString()));
      }
    });
  }
}
