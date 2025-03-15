import 'package:flutter/material.dart';
import 'package:flutter_quiz/enum/category.dart';
import 'package:flutter_quiz/models/expense.dart';
import 'package:flutter_quiz/Expense/expenses_list.dart';
import 'package:flutter_quiz/Expense/new_expene.dart';

//import 'package:flutter/widgets.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 90.60,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Flutter Course1',
      amount: 99.60,
      date: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: 'Flutter Course2',
      amount: 100.60,
      date: DateTime.now(),
      category: Category.work,
    ),
  ];


// void _addNewExpense() {
//   showDialog(
//     context: context,
//     builder: (ctx) {
//       return AlertDialog(
//         title: const Text('Add New Expense'),
//         content:const Column(
//           mainAxisSize: MainAxisSize.min, // Ensures the modal fits its content
//           children: [
//             TextField(
//               decoration:  InputDecoration(
//                 labelText: 'Title',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//              SizedBox(height: 10),
//             TextField(
//               decoration:  InputDecoration(
//                 labelText: 'Amount',
//                 border: OutlineInputBorder(),
//               ),
//               keyboardType: TextInputType.number,
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(ctx).pop(); // Close the popup
//             },
//             child: const Text('Cancel'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               // Save logic here
//               Navigator.of(ctx).pop(); // Close the popup
//             },
//             child: const Text('Save'),
//           ),
//         ],
//       );
//     },
//   );
// }




 void _addNewExpense() {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // To make the modal height dynamic
    builder: (ctx) => NewExpense( addExpense: onAddExpense,),
    
  );
}
 void onAddExpense(Expense expense){
  setState(() {
     registeredExpenses.add(expense); 
  });

 }

  @override
  Widget build(context) {
  return Scaffold(
          appBar: AppBar(
          title: const Text('Expense Tracker'),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0, top: 4.0), // Adjust the padding here,
              child: IconButton(
                icon: const Icon(Icons.add,  size: 30, color: Colors.white,),
                tooltip: 'Create Expense',
                onPressed: _addNewExpense, // Calls the add expense function
                        
              ),
            ),
          ],
        ),
          body: Column(
            children: [
              // const Text('Hello world'),
              // const SizedBox(height: 20),
              Expanded(
                child: ExpensesList(
                    registeredExpenses), // Pass data to ExpensesList
              ),
            ],
          ),
        );
    
  }
}
