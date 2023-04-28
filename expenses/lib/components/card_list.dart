import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionCard extends StatelessWidget {

  const TransactionCard ({
    super.key, 
    required this.isHorizontal,
    required this.tr,
    required this.onRemove,

  });

  final bool isHorizontal;
  final Transaction tr;
  final void Function(String id) onRemove;


  @override
  Widget build(BuildContext context) {
    return Card(
                elevation: 5,
                margin: EdgeInsets.fromLTRB(
                    isHorizontal ? 40 : 15, 20,
                    isHorizontal ? 40 : 15, 0
                  ),
                child: ListTile(
                  minVerticalPadding: 20,
                  leading: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(97, 205, 90, 1),
                        shape: BoxShape.circle,
                      ),
                      height: 60,
                      width: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                          child: Text(
                            'R\$${tr.value}',
                            style: const TextStyle(
                                color: Color.fromRGBO(12, 12, 12, 1),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                  title: Text(
                    tr.title,
                    style: const TextStyle(
                      color: Color.fromRGBO(41, 31, 31, 1),
                      fontFamily: 'Quicksand',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    DateFormat('d MMM y').format(tr.date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 400
                      ? TextButton.icon(
                          icon: const Icon(Icons.delete),
                          onPressed: () => onRemove(tr.id),
                          label: const Text(
                            'Excluir',
                            style:
                                TextStyle(color: Color.fromARGB(126, 70, 5, 5)),
                          ),
                        )
                      : IconButton(
                          icon: const Icon(Icons.delete),
                          color: const Color.fromARGB(127, 127, 127, 127),
                          onPressed: () => onRemove(tr.id),
                        ),
                ),
              );
  }
}