import 'package:flutter/material.dart';
import 'package:pvsfronend/Service/name_request.dart';
import 'package:pvsfronend/Service/transaction.dart';
import 'package:pvsfronend/config.dart';

class TransactionHistory extends StatefulWidget {
  @override
  _TransactionHistoryState createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  late Future<List<Transaction>> _transactions;
  final TransactionService _transactionService = TransactionService(baseUrl: '${Config.baseUrl}');
  final NameRequestService _nameRequestService = NameRequestService();

  @override
  void initState() {
    super.initState();
    _transactions = _transactionService.getTransactionsByUserId(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction History'),
      ),
      body: FutureBuilder<List<Transaction>>(
        future: _transactions,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No transactions found.'));
          }

          final transactions = snapshot.data!;

          return ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final transaction = transactions[index];
              return FutureBuilder<NameRequest?>(
                future: _getNameRequest(transaction.productId),
                builder: (context, nameRequestSnapshot) {
                  return Card(
                    margin: EdgeInsets.all(8.0),
                    elevation: 5,
                    child: ListTile(
                      title: Text('Transaction ${transaction.id}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Product ID: ${transaction.productId}\n'
                                'Ordered Date: ${transaction.orderedDate}\n'
                                'Status: ${transaction.status}\n'
                                'Address: ${transaction.address}',
                          ),
                          if (nameRequestSnapshot.hasData && nameRequestSnapshot.data != null)
                            Text(
                              '\nName Request:\n'
                                  'Surname: ${nameRequestSnapshot.data!.surname}\n'
                                  'Team Name: ${nameRequestSnapshot.data!.teamName}\n'
                                  'Has Short: ${nameRequestSnapshot.data!.hasShort}\n'
                                  'Player Number: ${nameRequestSnapshot.data!.playerNumber}',
                            ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  Future<NameRequest?> _getNameRequest(int productId) async {
    try {
      return await _nameRequestService.getNameRequestById(productId);
    } catch (e) {
      // If there's no name request for this product, return null
      return null;
    }
  }
}