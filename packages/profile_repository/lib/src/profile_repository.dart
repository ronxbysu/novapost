import 'dart:convert';

import 'package:auth_repository/auth_repository.dart';
import 'package:http/http.dart' as http;
import 'package:profile_repository/profile_repository.dart' show Profile;

abstract class ProfileRepository {
  Future<Profile> createProfile(Profile profile);
  Future<Profile> getProfileById(String profileId);
  Future<Profile> updateProfile(Profile profile);
  Future<Profile> deleteProfile(Profile profile);
}

class ProfileRepositoryImpl extends ProfileRepository {

  final AuthRepository authRepository;
  final String baseUrl;

  ProfileRepositoryImpl({required this.authRepository, required this.baseUrl});

  @override
  Future<Profile> createProfile(Profile profile) async {
    final headers = await authRepository.getAuthHeaders();
    final response = await http.post(
      Uri.parse('$baseUrl/deliveries'),
      headers: headers,
      body: json.encode(profile.toJson()),
    );

    if (response.statusCode != 200 || response.statusCode != 201) {
      final data = json.decode(response.body);
      return data.map((json) => Profile.fromJson(json));
    } else {
      throw Exception('Failed to create Profile');
    }
  }

  @override
  Future<Profile> deleteProfile(Profile profile) async {
    final headers = await authRepository.getAuthHeaders();
    final response = await http.delete(
      Uri.parse('$baseUrl/deliveries'),
      headers: headers,
      body: json.encode(profile.toJson()),
    );

    if (response.statusCode != 200 || response.statusCode != 201) {
      final data = json.decode(response.body);
      return data.map((json) => Profile.fromJson(json));
    } else {
      throw Exception('Failed to create Profile');
    }
  }

  @override
  Future<Profile> updateProfile(Profile profile) async {
    final headers = await authRepository.getAuthHeaders();
    final response = await http.put(
      Uri.parse('$baseUrl/deliveries'),
      headers: headers,
      body: json.encode(profile.toJson()),
    );

    if (response.statusCode != 200 || response.statusCode != 201) {
      final data = json.decode(response.body);
      return data.map((json) => Profile.fromJson(json));
    } else {
      throw Exception('Failed to create Profile');
    }
  }

  @override
  Future<Profile> getProfileById(String profileId) async {
    final headers = await authRepository.getAuthHeaders();
    final response = await http.get(
      Uri.parse('$baseUrl/deliveries/$profileId/'),
      headers: headers
    );

    if (response.statusCode != 200 || response.statusCode != 201) {
      final data = json.decode(response.body);
      return data.map((json) => Profile.fromJson(json));
    } else {
      throw Exception('Failed to create Profile');
    }
  }

}
