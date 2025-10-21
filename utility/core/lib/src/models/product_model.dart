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

import 'package:payment/payment.dart';

import 'package:equatable/equatable.dart';
import 'dart:typed_data';
import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'category_model.dart';

import 'uint8list_converter.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
abstract class Product extends Equatable with _$Product {
  const Product._();
  const factory Product({
    @Default("") String productId,
    @Default("") String pseudoId,
    String? productTypeId, // good, service, rental)
    String? assetClassId, // room, restaurant table
    String? productName,
    String? description,
    Decimal? listPrice,
    Decimal? price,
    Currency? currency, // currency, like EUR, USD
    Decimal? amount, // quantity included like duration, length, weight
    @Default([]) List<Category> categories,
    @Default(false) bool useWarehouse,
    int? assetCount,
    @Uint8ListConverter() Uint8List? image,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json['product'] ?? json);

  @override
  List<Object?> get props => [productId];

  @override
  String toString() => '$productName[$productId]';
}

List<String> productTypes = ['Physical Good', 'Service', 'Rental'];

String productCsvFormat =
    'product Id, Type*, Name*, Description*, List Price*, Sales price*, '
    'Purchase price, Use Warehouse, Category 1, Category 2, Category 3, Image\r\n';
List<String> productCsvTitles = productCsvFormat.split(',');
int productCsvLength = productCsvTitles.length;


@freezed
abstract class Products with _$Products {
  factory Products({@Default([]) List<Product> products}) = _Products;
  Products._();

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);
}

