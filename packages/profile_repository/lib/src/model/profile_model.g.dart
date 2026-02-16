// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
  id: json['id'] as String,
  name: json['name'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String,
  location: json['location'] as String,
  avatarUrl: json['avatarUrl'] as String,
  role: json['role'] as String,
  type: $enumDecode(_$ProfileTypeEnumMap, json['type']),
);

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'location': instance.location,
  'avatarUrl': instance.avatarUrl,
  'role': instance.role,
  'type': _$ProfileTypeEnumMap[instance.type]!,
};

const _$ProfileTypeEnumMap = {
  ProfileType.customer: 'customer',
  ProfileType.driver: 'driver',
  ProfileType.assistant: 'assistant',
};
