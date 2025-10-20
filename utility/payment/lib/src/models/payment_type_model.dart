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

import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_type_model.freezed.dart';
part 'payment_type_model.g.dart';

/// Payment type used for payments
/// key is type/isPayable/isApplied
@freezed
abstract class PaymentType with _$PaymentType {
  PaymentType._();
  factory PaymentType({
    @Default('') String paymentTypeId,
    @Default(false) bool isPayable,
    @Default(false) bool isApplied,
    @Default('') String paymentTypeName,
    @Default('') String accountCode,
    @Default('') String accountName,
  }) = _PaymentType;

  factory PaymentType.fromJson(Map<String, dynamic> json) =>
      _$PaymentTypeFromJson(json['paymentType'] ?? json);
}
