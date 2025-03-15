import 'package:uuid/uuid.dart';
import 'package:flutter_quiz/enum/category.dart';

var uuid = const Uuid();

class Expense {
  Expense({required this.title, required this.amount, required this.date, required this.category})
      : id = uuid.v4();
      
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}
