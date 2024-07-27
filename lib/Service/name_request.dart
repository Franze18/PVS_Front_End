import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pvsfronend/config.dart';

class NameRequestService {
  static const String baseUrl = '${Config.baseUrl}/api/v1/namerequest';

  Future<List<NameRequest>> getNameRequests() async {
    final response = await http.get(Uri.parse('$baseUrl/all'));

    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body);
      return jsonResponse.map((json) => NameRequest.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load name requests');
    }
  }

  Future<NameRequest> getNameRequestById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));

    if (response.statusCode == 200) {
      return NameRequest.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load name request');
    }
  }

  Future<void> addNameRequest(NameRequest nameRequest) async {
    final response = await http.post(
      Uri.parse('$baseUrl/new'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(nameRequest.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add name request');
    }
  }

  Future<void> updateNameRequest(int id, NameRequest nameRequest) async {
    final response = await http.put(
      Uri.parse('$baseUrl/edit/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(nameRequest.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update name request');
    }
  }

  Future<void> deleteNameRequest(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/delete/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete name request');
    }
  }
}

class NameRequest {
  final int? id;
  final int productId;
  final String surname;
  final String teamName;
  final String hasShort;
  final int playerNumber;

  NameRequest({
    this.id,
    required this.productId,
    required this.surname,
    required this.teamName,
    required this.hasShort,
    required this.playerNumber,
  });

  factory NameRequest.fromJson(Map<String, dynamic> json) {
    return NameRequest(
      id: json['id'],
      productId: json['productId'],
      surname: json['surname'],
      teamName: json['teamName'],
      hasShort: json['hasShort'],
      playerNumber: json['playerNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'surname': surname,
      'teamName': teamName,
      'hasShort': hasShort,
      'playerNumber': playerNumber,
    };
  }
}
