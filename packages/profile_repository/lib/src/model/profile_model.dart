import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String location;
  final String avatarUrl;
  final String role;

  const Profile({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.location,
    required this.avatarUrl,
    required this.role,
  });

  Profile copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? location,
    String? avatarUrl,
    String? role,
  }) {
    return Profile(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      location: location ?? this.location,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      role: role ?? this.role,
    );
  }

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'] ?? '',
      location: json['location'] ?? '',
      avatarUrl: json['avatar_url'] ?? '',
      role: json['role'] ?? 'User',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'location': location,
      'avatar_url': avatarUrl,
      'role': role,
    };
  }

  @override
  List<Object?> get props => [id, name, email, phone, location, avatarUrl, role];
}