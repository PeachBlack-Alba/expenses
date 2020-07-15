import './transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
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

  // String titleInput;
  // String amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text("Chart"),
              elevation: 5,
            ),
          ),
          //We use a card now instead of a Column for styling the widgets, but inside it we need a column to insert more than one widget
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: "Title"),
                    controller: titleController,
                    // onChanged: (val) {
                    //   titleInput = val;
                    // },
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: "Amount"),
                    controller: amountController,
                    // onChanged: (val) => amountInput = val,
                  ),
                  FlatButton(
                    child: Text("Add Transaction"),
                    textColor: Colors.purple,
                    onPressed: () {
                      // print(titleInput);
                      // print(amountInput);
                    },
                  ),
                ],
              ),
            ),
          ),
          Column(
            //We need the transactions to be interactive, so we need to map them so we don't hard code them
            //We need to transform it to a list so .toList()
            children: transactions.map((tx) {
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
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
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
          ),
        ],
      ),
    );
  }
}
