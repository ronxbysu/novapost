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

import 'package:auth/auth.dart';
import 'package:auth/src/model/role_converter.dart'
    show RoleConverter, Uint8ListConverter;
import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:payment/payment.dart';

import 'role_model.dart' show Role;

part 'company_model.freezed.dart';
part 'company_model.g.dart';

@freezed
abstract class Company with _$Company {
  Company._();
  factory Company({
    String? partyId,
    String? pseudoId,
    @RoleConverter() Role? role,
    String? name,
    String? email,
    String? url,
    String? telephoneNr,
    Currency? currency,
    @Uint8ListConverter() Uint8List? image,
    Address? address,
    PaymentMethod? paymentMethod,
    Decimal? vatPerc,
    Decimal? salesPerc,
    @Default([]) List<User> employees,
    String? hostName,
    String? secondaryBackend,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json["company"] ?? json);

  @override
  String toString() =>
      'Company name: $name[$partyId] '
      'Curr: ${currency?.currencyId} '
      'imgSize: ${image?.length}'
      '#Empl: ${employees.length}';
}

@freezed
abstract class Companies with _$Companies {
  factory Companies({@Default([]) List<Company> companies}) = _Companies;
  Companies._();

  factory Companies.fromJson(Map<String, dynamic> json) =>
      _$CompaniesFromJson(json);
}
