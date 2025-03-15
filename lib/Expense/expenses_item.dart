import 'package:flutter/material.dart';
import 'package:flutter_quiz/enum/category.dart';
import 'package:flutter_quiz/models/expense.dart';

class ExpensesItem extends StatelessWidget{
  const ExpensesItem(this.expenseData, {super.key});
final Expense expenseData;

 IconData getCategoryIcon(Category category) {
    switch (category) {
      case Category.food:
        return Icons.fastfood; // Icon for food
      case Category.travel:
        return Icons.flight_takeoff; // Icon for travel
      case Category.work:
        return Icons.work; 
   
    }
  }
  @override
  Widget build(BuildContext context) {
 
      return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title and Category
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                child: Text(
                  expenseData.category.name[0].toUpperCase(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(
                expenseData.title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: 
              
              Row(
                children: [
                   Icon(
                    getCategoryIcon(expenseData.category),
                    size: 16,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 4), // Space between icon and category name
                  
                  Text(
                    expenseData.category.name, // Display category name
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const Divider(),
            // Amount and Date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(expenseData.title),
                Text(
                  '\$${expenseData.amount.toStringAsFixed(2)}', // Format amount
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                  Row(
                    children: [
                      const Icon(
                          Icons.calendar_today, // Icon before the date
                          size: 16,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4), // Spacing between icon and text
                                      Text(
                      expenseData.date.toString().split(' ')[0], // Format date
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}