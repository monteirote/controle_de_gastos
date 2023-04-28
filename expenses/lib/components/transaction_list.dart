// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:expenses/components/card_list.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'empty_transactionlist.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    bool isHorizontal =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return EmptyTransactionList(
                ctx: ctx,
                constraints: constraints,
              );
            },
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions[index];
              return TransactionCard(
                isHorizontal: isHorizontal,
                onRemove: onRemove,
                tr: tr,
                );
              // return Card(
              //   elevation: 5,
              //   margin: EdgeInsets.fromLTRB(
              //       isHorizontal ? 40 : 15, 20,
              //       isHorizontal ? 40 : 15, 0
              //     ),
              //   child: ListTile(
              //     minVerticalPadding: 20,
              //     leading: Container(
              //         decoration: BoxDecoration(
              //           color: Color.fromRGBO(97, 205, 90, 1),
              //           shape: BoxShape.circle,
              //         ),
              //         height: 60,
              //         width: 60,
              //         child: Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: FittedBox(
              //             child: Text(
              //               'R\$${tr.value}',
              //               style: TextStyle(
              //                   color: Color.fromRGBO(12, 12, 12, 1),
              //                   fontWeight: FontWeight.bold),
              //             ),
              //           ),
              //         )),
              //     title: Text(
              //       tr.title,
              //       style: TextStyle(
              //         color: Color.fromRGBO(41, 31, 31, 1),
              //         fontFamily: 'Quicksand',
              //         fontSize: 16,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //     subtitle: Text(
              //       DateFormat('d MMM y').format(tr.date),
              //     ),
              //     trailing: MediaQuery.of(context).size.width > 400
              //         ? TextButton.icon(
              //             icon: Icon(Icons.delete),
              //             onPressed: () => onRemove(tr.id),
              //             label: Text(
              //               'Excluir',
              //               style:
              //                   TextStyle(color: Color.fromARGB(126, 70, 5, 5)),
              //             ),
              //           )
              //         : IconButton(
              //             icon: Icon(Icons.delete),
              //             color: Color.fromARGB(127, 127, 127, 127),
              //             onPressed: () => onRemove(tr.id),
              //           ),
              //   ),
              // );
            },
          );
  }
}



















                  // return Card(
                  //     child: Row(
                  //   children: <Widget>[
                  //     Container(
                  //       decoration: BoxDecoration(
                  //           border: Border.all(
                  //         color: Color.fromRGBO(107, 107, 107, 1),
                  //         width: 2,
                  //       )),
                  //       padding: EdgeInsets.all(10),
                  //       margin:
                  //           EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  //       child: Text(
                  //         'R\$ ${tr.value.toStringAsFixed(2)}',
                  //         style: TextStyle(
                  //             // fontFamily: 'Quicksand',
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 20,
                  //             color: Color.fromRGBO(107, 107, 107, 1)),
                  //       ),
                  //     ),
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text(
                  //           tr.title.toString(),
                  //           style: TextStyle(
                  //             fontFamily: 'Quicksand',
                  //             fontSize: 16,
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //         ),
                  //         Text(
                  //           DateFormat('d  MMM  y').format(tr.date),
                  //           style: TextStyle(
                  //             fontFamily: 'Quicksand',
                  //             color: Colors.grey,
                  //           ),
                  //         )
                  //       ],
                  //     )
                  //   ],
                  // ));