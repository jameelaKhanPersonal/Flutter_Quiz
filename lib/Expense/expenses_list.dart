import 'package:flutter/material.dart';
import 'package:flutter_quiz/Expense/expenses_item.dart';
import 'package:flutter_quiz/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(this.expenseList, {super.key});
   final List<Expense> expenseList;
  @override
  Widget build( context) {
   return ListView.builder(
    itemCount: expenseList.length,
    itemBuilder: (context, index)=>ExpensesItem(expenseList[index])
   );
  }

 
}

