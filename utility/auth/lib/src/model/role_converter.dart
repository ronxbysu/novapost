/*
 * This GrowERP software is in the public domain under CC0 1.0 Universal plus a
 * Grant of Patent License.
 * 
 * To the extent possible under law, the author(s) have dedicated all
 * copyright and related and neighboring rights to this software to the
 * public domain worldwide. This software is distributed without any
 * warranty.
 * 
 * You should have received a copy of the CC0 Public Domain Dedication
 * along with this software (see the LICENSE.md file). If not, see
 * <http://creativecommons.org/publicdomain/zero/1.0/>.
 */
//TODO: extract to separate package utils
import 'dart:convert';
import 'dart:typed_data';

import 'package:auth/src/model/party_type_model.dart' show PartyType;
import 'package:auth/src/model/role_model.dart' show Role;
import 'package:auth/src/model/user_group_model.dart' show UserGroup;
import 'package:freezed_annotation/freezed_annotation.dart';

class PartyTypeConverter implements JsonConverter<PartyType?, String?> {
  const PartyTypeConverter();

  @override
  PartyType? fromJson(String? json) {
    if (json == null) return null;
    return PartyType.tryParse(json);
  }

  @override
  String? toJson(PartyType? object) {
    if (object == null) return null;
    return object.value;
  }
}

class Uint8ListConverter implements JsonConverter<Uint8List?, String?> {
  const Uint8ListConverter();

  @override
  Uint8List? fromJson(String? json) {
    if (json == null) return null;
    return base64.decode(json);
  }

  @override
  String? toJson(Uint8List? object) {
    if (object == null) return null;
    return base64.encode(object);
  }
}

class UserGroupConverter implements JsonConverter<UserGroup?, String?> {
  const UserGroupConverter();

  @override
  UserGroup? fromJson(String? json) {
    if (json == null) return null;
    return UserGroup.getByValue(json);
  }

  @override
  String? toJson(UserGroup? object) {
    if (object == null) return null;
    return object.value;
  }
}

class RoleConverter implements JsonConverter<Role?, String?> {
  const RoleConverter();

  @override
  Role? fromJson(String? json) {
    if (json == null) return null;
    return Role.getByValue(json);
  }

  @override
  String? toJson(Role? object) {
    if (object == null) return null;
    return object.value;
  }
}
