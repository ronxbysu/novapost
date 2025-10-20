import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:auth_repository/auth_repository.dart' show AuthRepository;
import 'package:http/http.dart' as http;

import 'models/location_model.dart' show Location;

abstract class LocationRepository {
  Future<Location> createLocation(Location location);
  Future<Location> getLocationById(String locationId);
  Future<Location> updateLocation(Location location);
  Future<Location> deleteLocation(Location location);

  Future<List<Location>> getLocationList(String userId);
}

class LocationRepositoryImpl extends LocationRepository {
  final AuthRepository authRepository;
  final String baseUrl;

  LocationRepositoryImpl({required this.authRepository, required this.baseUrl});

  @override
  Future<Location> createLocation(Location location) async {
    final headers = await authRepository.getAuthHeaders();
    final response = await http.post(
      Uri.parse('$baseUrl/locations'),
      headers: headers,
      body: json.encode(location.toJson()),
    );

    if (response.statusCode != 200 || response.statusCode != 201) {
      final data = json.decode(response.body);
      return data.map((json) => Location.fromJson(json));
    } else {
      throw Exception('Failed to create Location');
    }
  }

  @override
  Future<Location> deleteLocation(Location location) async {
    final headers = await authRepository.getAuthHeaders();
    final response = await http.delete(
      Uri.parse('$baseUrl/locations'),
      headers: headers,
      body: json.encode(location.toJson()),
    );

    if (response.statusCode != 200 || response.statusCode != 201) {
      final data = json.decode(response.body);
      return data.map((json) => Location.fromJson(json));
    } else {
      throw Exception('Failed to create Location');
    }
  }

  @override
  Future<Location> getLocationById(String locationId) async {
    final headers = await authRepository.getAuthHeaders();
    final response = await http
        .get(Uri.parse('$baseUrl/locations/$locationId/'), headers: headers);

    if (response.statusCode != 200 || response.statusCode != 201) {
      final data = json.decode(response.body);
      return data.map((json) => Location.fromJson(json));
    } else {
      throw Exception('Failed to create Location');
    }
  }

  @override
  Future<List<Location>> getLocationList(String userId) async {
    //TODO: change userId to LocationArea or Circle of Locations
    try {
      final headers = await authRepository.getAuthHeaders();
      final response = await http
          .get(Uri.parse('$baseUrl/locations/'), headers: headers)
          .timeout(const Duration(seconds: 5));

      // treat any 2xx as success
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final data = json.decode(response.body);
        return data.map((json) => Location.fromJson(json));
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

  @override
  Future<Location> updateLocation(Location location) async {
    final headers = await authRepository.getAuthHeaders();
    final response = await http.put(
      Uri.parse('$baseUrl/locations'),
      headers: headers,
      body: json.encode(location.toJson()),
    );

    if (response.statusCode != 200 || response.statusCode != 201) {
      final data = json.decode(response.body);
      return data.map((json) => Location.fromJson(json));
    } else {
      throw Exception('Failed to create Location');
    }
  }
}
