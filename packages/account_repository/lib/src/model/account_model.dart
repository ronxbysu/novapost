import 'package:equatable/equatable.dart';
import 'package:profile_repository/profile_repository.dart' show Profile;

class Account extends Equatable {
  final String accountId;
  final String email;
  final List<Profile> profiles;
  final String? activeProfileId;
  final String? status;

  const Account({
    required this.accountId,
    required this.email,
    required this.profiles,
    required this.activeProfileId,
    required this.status,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      accountId: json['account_id'],
      email: json['email'],
      profiles: json['profiles'],
      activeProfileId: json['active_profile_id'],
      status: json['status'] ?? 'created',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'account_id': accountId,
      'email': email,
      'profiles': profiles,
      'active_profile_id': activeProfileId,
      'status': status,
    };
  }

  @override
  List<Object?> get props => [accountId, email, profiles, activeProfileId, status,];
}