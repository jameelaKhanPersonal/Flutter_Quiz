import 'package:flutter/material.dart';
import 'package:flutter_quiz/enum/category.dart';
import 'package:flutter_quiz/models/expense.dart';
import 'package:intl/intl.dart';



extension ExpenseCategoryExtension on Category {
  String get displayName {
    switch (this) {
      case Category.food:
        return 'Food';
      case Category.travel:
        return 'Travel';
      case Category.work:
        return 'work';
    }
  }
}

class NewExpense extends StatefulWidget {
  const NewExpense(  {super.key, required this.addExpense});

final void Function(Expense expense) addExpense;
  @override
  State<StatefulWidget> createState() {
    return NewExpenseState();
  }
}

class NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  DateTime? _selectedDate;
  Category? _selectedCategory;

  // Extension to provide display names for enum values

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(now.year - 1, now.month, now.day),
      lastDate: now,
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

void _submitExpenseData(){
  final enteredAmount=double.tryParse(_amountController.text) ;
  final amountIsValid=enteredAmount==null|| enteredAmount<=0;
if(_titleController.text.trim().isEmpty ||amountIsValid)
{
showDialog(context: context, builder: (ctx)=> 
AlertDialog(
title:  const Text('Invalid Input'),
content:  const Text('make sure valid Input'),
actions: [
  TextButton(onPressed:(){
     Navigator.pop(ctx);
     
  } ,
  child: const Text('Ok'))
],
),);
return;
}
else{
  widget.addExpense(Expense(title: _titleController.text, amount: enteredAmount, date: _selectedDate!, category: _selectedCategory!));
   //Navigator.pop(ctx);
}
}

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        // Adjusts the bottom padding for the on-screen keyboard
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Makes the modal height dynamic
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Add New Expense',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            maxLength: 50,
            controller: _titleController,
            decoration: const InputDecoration(
              labelText: 'Title',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Amount',
              prefixText: '\$',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Category Dropdown
              Expanded(
                child: Row(
                  children: [
                    const Text(
                      'Category:',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: DropdownButton<Category>(
                        value: _selectedCategory,
                        isExpanded:
                            true, // Ensures dropdown takes available space
                        items: Category.values.map((Category category) {
                          return DropdownMenuItem<Category>(
                            value: category,
                            child: Text(category.displayName),
                          );
                        }).toList(),
                        onChanged: (Category? value) {
                          setState(() {
                            _selectedCategory = value;
                          });
                        },
                        hint: const Text('Select Category'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                  width: 10), // Spacing between dropdown and date picker
              // Date Picker
             // const Spacer(),
              Expanded(
                child: Row(
                 children: [
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No Date Selected'
                            : DateFormat('dd/MM/yyyy').format(_selectedDate!),
                            overflow: TextOverflow.ellipsis,
                      ),
                    ),
                 
                    IconButton(
                      onPressed: _pickDate,
                      icon: const Icon(Icons.calendar_today),
                      tooltip: 'Pick a date',
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                 _submitExpenseData;
                  // Handle the "Save" action here
                  Navigator.of(context).pop(); // Close the modal
                },
                child: const Text('Close'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                _submitExpenseData();
                  // Handle the "Save" action here
                  //Navigator.of(context).pop(); // Close the modal
                },
                child: const Text('Save Expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
