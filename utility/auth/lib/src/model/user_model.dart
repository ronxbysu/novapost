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

import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:auth/src/model/address_model.dart';
import 'package:auth/src/model/role_converter.dart'
    show RoleConverter, UserGroupConverter, Uint8ListConverter;
import 'package:auth/src/model/role_model.dart' show Role;
import 'package:auth/src/model/user_group_model.dart' show UserGroup;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:payment/payment.dart' show PaymentMethod;

import 'company_model.dart' show Company;

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class User with _$User {
  factory User({
    String? partyId, // allocated by system cannot be changed.
    String? pseudoId,
    @RoleConverter() Role? role,
    String? userId, // allocated by system cannot be changed.
    String? firstName,
    String? lastName,

    /// login account
    bool? loginDisabled,
    String? loginName,
    String? fullName,

    /// email address of this person
    String? email,

    /// website address of this person
    String? url,

    /// postal address and payment method
    Address? address,
    PaymentMethod? paymentMethod,

    /// when customer register they can give their telephonenr to use as membername
    String? telephoneNr,

    /// admin, employee, customer, supplier etc...
    @UserGroupConverter() UserGroup? userGroup,
    // the localization variables
    @Default('EN') String language,
    @Default('THB') String currency,
    String? timeZoneOffset,
    @Uint8ListConverter() Uint8List? image,
    Company? company,

    /// field is used to see of a user registered with an app,
    /// when not will show the extra info screen at first login.
    @Default([]) List<String> appsUsed,
  }) = _User;
  User._();

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json['user'] ?? json);

  @override
  String toString() {
    var userString =
        'User $firstName $lastName [$partyId] sec: $userGroup '
        ' email: $email';
    var companyString = '';
    if (company != null) {
      companyString =
          'company: ${company!.name}[${company!.partyId}] size: ${image?.length}';
    }
    var methodString = '';
    if (paymentMethod != null) {
      methodString = "pay method: ${paymentMethod?.ccDescription}";
    }
    return '$userString $companyString $methodString';
  }

  String getName() => '$lastName, $firstName';
}
