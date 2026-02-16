import 'dart:convert';

import 'package:auth_repository/auth_repository.dart';
import 'package:delivery_repository/src/model/delivery_model.dart';
import 'package:http/http.dart' as http;

abstract class DeliveryRepository {
  Future<Delivery> createDelivery(Delivery delivery);
  Future<Delivery> getDelivery(Delivery delivery);
  Future<Delivery> updateDelivery(Delivery delivery);
  Future<Delivery> deleteDelivery(Delivery delivery);
}

class DeliveryRepositoryImpl extends DeliveryRepository {

  final AuthRepository authRepository;
  final String baseUrl;

  DeliveryRepositoryImpl({required this.authRepository, required this.baseUrl});

  @override
  Future<Delivery> createDelivery(Delivery delivery) async {
    final headers = await authRepository.getAuthHeaders();
    final response = await http.post(
      Uri.parse('$baseUrl/deliveries'),
      headers: headers,
      body: json.encode(delivery.toJson()),
    );

    if (response.statusCode != 200 || response.statusCode != 201) {
      final data = json.decode(response.body);
      return data.map((json) => Delivery.fromJson(json));
    } else {
      throw Exception('Failed to create delivery');
    }
  }

  @override
  Future<Delivery> deleteDelivery(Delivery delivery) async {
    final headers = await authRepository.getAuthHeaders();
    final response = await http.delete(
      Uri.parse('$baseUrl/deliveries'),
      headers: headers,
      body: json.encode(delivery.toJson()),
    );

    if (response.statusCode != 200 || response.statusCode != 201) {
      final data = json.decode(response.body);
      return data.map((json) => Delivery.fromJson(json));
    } else {
      throw Exception('Failed to create delivery');
    }
  }

  @override
  Future<Delivery> updateDelivery(Delivery delivery) async {
    final headers = await authRepository.getAuthHeaders();
    final response = await http.put(
      Uri.parse('$baseUrl/deliveries'),
      headers: headers,
      body: json.encode(delivery.toJson()),
    );

    if (response.statusCode != 200 || response.statusCode != 201) {
      final data = json.decode(response.body);
      return data.map((json) => Delivery.fromJson(json));
    } else {
      throw Exception('Failed to create delivery');
    }
  }

  @override
  Future<Delivery> getDelivery(Delivery delivery) async {
    final headers = await authRepository.getAuthHeaders();
    final response = await http.get(
      Uri.parse('$baseUrl/deliveries/${delivery.deliveryId}/'),
      headers: headers
    );

    if (response.statusCode != 200 || response.statusCode != 201) {
      final data = json.decode(response.body);
      return data.map((json) => Delivery.fromJson(json));
    } else {
      throw Exception('Failed to create delivery');
    }
  }

}
