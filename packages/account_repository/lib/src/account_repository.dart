import 'dart:convert';

import 'package:account_repository/account_repository.dart';
import 'package:auth_repository/auth_repository.dart';
import 'package:http/http.dart' as http;


abstract class AccountRepository {
  Future<Account> createAccount(Account account);
  Future<Account> getAccount(Account account);
  Future<Account> updateAccount(Account account);
  Future<Account> deleteAccount(Account account);

  Future<Account> fetchAccount();
  Future<void> setActiveProfile(String profileId);
  Future<void> addProfile(ProfileType type, String displayName); //TODO: refactor with Profile profile
}

class AccountRepositoryImpl extends AccountRepository {

  final AuthRepository authRepository;
  final ProfileRepository profileRepository;
  final String baseUrl;

  AccountRepositoryImpl({required this.authRepository, required this.profileRepository, required this.baseUrl});

  @override
  Future<Account> createAccount(Account account) async {
    final headers = await authRepository.getAuthHeaders();
    final response = await http.post(
      Uri.parse('$baseUrl/deliveries'),
      headers: headers,
      body: json.encode(account.toJson()),
    );

    if (response.statusCode != 200 || response.statusCode != 201) {
      final data = json.decode(response.body);
      return data.map((json) => Account.fromJson(json));
    } else {
      throw Exception('Failed to create Account');
    }
  }

  @override
  Future<Account> deleteAccount(Account account) async {
    final headers = await authRepository.getAuthHeaders();
    final response = await http.delete(
      Uri.parse('$baseUrl/deliveries'),
      headers: headers,
      body: json.encode(account.toJson()),
    );

    if (response.statusCode != 200 || response.statusCode != 201) {
      final data = json.decode(response.body);
      return data.map((json) => Account.fromJson(json));
    } else {
      throw Exception('Failed to create Account');
    }
  }

  @override
  Future<Account> updateAccount(Account account) async {
    final headers = await authRepository.getAuthHeaders();
    final response = await http.put(
      Uri.parse('$baseUrl/deliveries'),
      headers: headers,
      body: json.encode(account.toJson()),
    );

    if (response.statusCode != 200 || response.statusCode != 201) {
      final data = json.decode(response.body);
      return data.map((json) => Account.fromJson(json));
    } else {
      throw Exception('Failed to create Account');
    }
  }

  @override
  Future<Account> getAccount(Account account) async {
    final headers = await authRepository.getAuthHeaders();
    final response = await http.get(
      Uri.parse('$baseUrl/deliveries/${account.accountId}/'),
      headers: headers
    );

    if (response.statusCode != 200 || response.statusCode != 201) {
      final data = json.decode(response.body);
      return data.map((json) => Account.fromJson(json));
    } else {
      throw Exception('Failed to create Account');
    }
  }

  @override
  Future<void> addProfile(ProfileType type, String displayName) {
    // TODO: implement addProfile
    throw UnimplementedError();
  }

  @override
  Future<Account> fetchAccount() {
    // TODO: implement fetchAccount
    throw UnimplementedError();
  }

  @override
  Future<void> setActiveProfile(String profileId) {
    // TODO: implement setActiveProfile
    throw UnimplementedError();
  }

}
