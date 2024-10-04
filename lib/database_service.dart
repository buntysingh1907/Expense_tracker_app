import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/models/expenses_model.dart';

class ExpenseRepository {
  final CollectionReference collection = FirebaseFirestore.instance.collection('expenses');

  Future<void> addExpense(Expensemodel expense) async {
    try {
      await collection.add(expense.toJson());
    } catch (e) {

    }
  }

  Future<void> deleteExpense(String id) async {
    try {
      await collection.doc(id).delete();
      print("Expense deleted successfully");
    } catch (e) {
      print("Error deleting expense: $e");
    }
  }

  Stream<List<Expensemodel>> getExpenses() {
    return collection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Expensemodel.fromJson(doc.data() as Map<String, dynamic>)).toList();
    });
  }
}
