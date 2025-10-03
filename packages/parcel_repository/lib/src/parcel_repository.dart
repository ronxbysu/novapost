import 'dart:convert';

import 'package:auth_repository/auth_repository.dart';
import 'package:http/http.dart' as http;
import 'package:parcel_repository/parcel_repository.dart' show Parcel;

abstract class ParcelRepository {
  Future<Parcel> createParcel(Parcel parcel);
  Future<Parcel> getParcel(Parcel parcel);
  Future<Parcel> updateParcel(Parcel parcel);
  Future<Parcel> deleteParcel(Parcel parcel);

  Future<List<Parcel>> getParcelList(String userId);
}

class ParcelRepositoryImpl extends ParcelRepository {

  final AuthRepository authRepository;
  final String baseUrl;

  ParcelRepositoryImpl({required this.authRepository, required this.baseUrl});

  @override
  Future<Parcel> createParcel(Parcel parcel) async {
    final headers = await authRepository.getAuthHeaders();
    final response = await http.post(
      Uri.parse('$baseUrl/deliveries'),
      headers: headers,
      body: json.encode(parcel.toJson()),
    );

    if (response.statusCode != 200 || response.statusCode != 201) {
      final data = json.decode(response.body);
      return data.map((json) => Parcel.fromJson(json));
    } else {
      throw Exception('Failed to create Parcel');
    }
  }

  @override
  Future<Parcel> deleteParcel(Parcel parcel) async {
    final headers = await authRepository.getAuthHeaders();
    final response = await http.delete(
      Uri.parse('$baseUrl/deliveries'),
      headers: headers,
      body: json.encode(parcel.toJson()),
    );

    if (response.statusCode != 200 || response.statusCode != 201) {
      final data = json.decode(response.body);
      return data.map((json) => Parcel.fromJson(json));
    } else {
      throw Exception('Failed to create Parcel');
    }
  }

  @override
  Future<Parcel> updateParcel(Parcel parcel) async {
    final headers = await authRepository.getAuthHeaders();
    final response = await http.put(
      Uri.parse('$baseUrl/deliveries'),
      headers: headers,
      body: json.encode(parcel.toJson()),
    );

    if (response.statusCode != 200 || response.statusCode != 201) {
      final data = json.decode(response.body);
      return data.map((json) => Parcel.fromJson(json));
    } else {
      throw Exception('Failed to create Parcel');
    }
  }

  @override
  Future<Parcel> getParcel(Parcel parcel) async {
    final headers = await authRepository.getAuthHeaders();
    final response = await http.get(
      Uri.parse('$baseUrl/deliveries/${parcel.parcelId}/'),
      headers: headers
    );

    if (response.statusCode != 200 || response.statusCode != 201) {
      final data = json.decode(response.body);
      return data.map((json) => Parcel.fromJson(json));
    } else {
      throw Exception('Failed to create Parcel');
    }
  }

  @override
  Future<List<Parcel>> getParcelList(String userId) {
    // TODO: implement getParcelList
    throw UnimplementedError();
  }

}
