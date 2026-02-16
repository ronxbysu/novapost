import 'dart:async';
import 'dart:convert';
import 'dart:io';

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
      Uri.parse('$baseUrl/parcel'),
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
      Uri.parse('$baseUrl/parcel'),
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
      Uri.parse('$baseUrl/parcel'),
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
      Uri.parse('$baseUrl/parcel/${parcel.parcelId}/'),
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
  Future<List<Parcel>> getParcelList(String userId) async {
    try {
      final headers = await authRepository.getAuthHeaders();
      final response = await http.get(
          Uri.parse('$baseUrl/parcels/$userId/'),
          headers: headers
      ).timeout(const Duration(seconds: 5));

      // treat any 2xx as success
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final data = json.decode(response.body);
        return data.map((json) => Parcel.fromJson(json));
      } else {
        print('fetchParcelForUser: non-success status ${response.statusCode}');
        return List.empty();
      }
    } on SocketException catch (e) {
      // host unreachable / network error
      print('fetchParcelForUser: network error: $e');
      return List.empty();
    } on TimeoutException catch (e) {
      // request timed out
      print('fetchParcelForUser: timeout: $e');
      return List.empty();
    } catch (e, st) {
      // any other unexpected error
      print('fetchParcelForUser: unexpected error: $e\n$st');
      return List.empty();
    }
  }

}
