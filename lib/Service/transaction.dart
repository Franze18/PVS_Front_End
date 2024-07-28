import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class TransactionService {
  final String baseUrl;

  TransactionService({required this.baseUrl});

  Future<List<Transaction>> getAllTransactions() async {
    final response = await http.get(Uri.parse('$baseUrl/api/v1/transaction/all'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Transaction.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load transactions');
    }
  }

  Future<Transaction> getTransactionById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/api/v1/transaction/$id'));

    if (response.statusCode == 200) {
      return Transaction.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load transaction');
    }
  }

  Future<void> addTransaction(Transaction transaction) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/v1/transaction/new'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(transaction.toJson()),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode != 200) {
        throw Exception('Failed to create transaction: ${response.body}');
      }
    } catch (e) {
      print('Error adding transaction: $e');
      rethrow;
    }
  }

  Future<void> deleteTransaction(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/api/v1/transaction/delete/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete transaction');
    }
  }

  Future<List<Transaction>> getTransactionsByUserId(int userId) async {
    final response = await http.get(Uri.parse('$baseUrl/api/v1/transaction/user/$userId'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Transaction.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load transactions for user');
    }
  }
}

class Transaction {
  final int id;
  final int productId;
  final int userId;
  final DateTime orderedDate;
  final String status;
  final String address;

  Transaction({
    required this.id,
    required this.productId,
    required this.userId,
    required this.orderedDate,
    required this.status,
    required this.address,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      productId: json['productId'],
      userId: json['userId'],
      orderedDate: DateTime.parse(json['orderedDate']),
      status: json['status'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'userId': userId,
      'orderedDate': orderedDate.toIso8601String(),
      'status': status,
      'address': address,
    };
  }
}