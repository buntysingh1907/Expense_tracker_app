import 'package:expense_tracker/expense_maintain_bloc.dart';
import 'package:expense_tracker/models/expenses_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';


class BottomModals extends StatefulWidget {
  BottomModals({Key? key}) : super(key: key);

  @override
  _BottomModalState createState() => _BottomModalState();
}

class _BottomModalState extends State<BottomModals> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category? _selectedCategory;

  void _datePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _toSubmitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty || amountInvalid || _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text("Invalid inputs"),
            content: const Text("Please make sure a valid Title, Amount, Date and Category was entered"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text("Okay"),
              ),
            ],
          );
        },
      );
      return;
    }
    final newExpense = Expensemodel(
      titleExpense: _titleController.text,
      amountExpense: enteredAmount.toString(),
      dateExpense: _selectedDate!,
      typeExpense: _selectedCategory.toString(),
    );
    context.read<ExpenseBloc>().add(AddExpense(newExpense));
   // Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
        padding: const EdgeInsets.fromLTRB(17, 55, 17, 17),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              maxLength: 51,
              decoration: const InputDecoration(label: Text("Title")),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    maxLength: 51,
                    decoration: const InputDecoration(
                      prefixText: "\$",
                      label: Text("Amount"),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const SizedBox(width: 15),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        _selectedDate == null ? "No Date Selected"
                            :DateFormat.yMd().format(_selectedDate!),
                      ),
                      IconButton(
                        onPressed: _datePicker,
                        icon: const Icon(Icons.calendar_month_rounded),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                DropdownButton(
                  value: _selectedCategory,
                  items: Category.values.map((Categorys) {
                    return DropdownMenuItem(
                      value: Categorys,
                      child: Text(Categorys.name.toString()),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCategory = value;
                    });
                  },
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
                OutlinedButton(
                  onPressed: _toSubmitExpenseData,
                  child: const Text("Save Expense"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
