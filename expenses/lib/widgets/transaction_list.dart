import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: "t1",
      title: "New Shoes",
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "Weekly Groceries",
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      //We need the transactions to be interactive, so we need to map them so we don't hard code them
      //We need to transform it to a list so .toList()
      children: _userTransactions.map((tx) {
        return Card(
          child: Row(
            children: <Widget>[
              //amount is a double, that's why we are changing it to a srting .toString()
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                //Not all widget has decoration, but container does
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.purple,
                    width: 2,
                  ),
                ),
                padding: EdgeInsets.all(10),
                child: Text(
                  //$ in dart is for sring interpolation that's why we refer as \$ (for normal $sign) and then the $for interpolation
                  "\$${tx.amount}",
                  // tx.amount.toString() = "\$${tx.amount}"
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.purple,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, //move items to the left
                children: <Widget>[
                  Text(
                    tx.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  //same like amount, date is not a string so we need to convert it by .toString()
                  Text(
                    DateFormat.yMMMd().format(tx.date),
                    // tx.date.toString(),

                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
