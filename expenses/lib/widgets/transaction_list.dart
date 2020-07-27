import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  //Constructor

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        //itemBuilder is a must for ListView.builder and it take a function
        itemBuilder: (ctx, index) {
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
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    //$ in dart is for sring interpolation that's why we refer as \$ (for normal $sign) and then the $for interpolation
                    "\$${transactions[index].amount.toStringAsFixed(2)}",
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
                      transactions[index].title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    //same like amount, date is not a string so we need to convert it by .toString()
                    Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                      // tx.date.toString(),

                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: transactions.length,

        //We need the transactions to be interactive, so we need to map them so we don't hard code them
        // children: transactions.map((tx) {
        //   //We use a card now instead of a Column for styling the widgets, but inside it we need a column to insert more than one widget

        //   //We need to transform it to a list so .toList()
        // }).toList(),
      ),
    );
  }
}
