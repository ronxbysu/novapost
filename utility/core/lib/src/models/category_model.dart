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

import 'dart:typed_data';
import 'package:core/src/models/uint8list_converter.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'models.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
abstract class Category extends Equatable with _$Category {
  Category._();
  factory Category({
    @Default("") String categoryId,
    @Default("") String pseudoId,
    @Default("") String categoryName,
    @Default("") String description,
    @Uint8ListConverter() Uint8List? image,
    @Default(0) int seqId,
    @Default(0) int nbrOfProducts,
    @Default([]) List<Product> products,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json['category'] ?? json);

  @override
  List<Object?> get props => [categoryId];

  @override
  String toString() => '$categoryName[$categoryId]';
}

@freezed
abstract class Categories with _$Categories {
  factory Categories({@Default([]) List<Category> categories}) = _Categories;
  Categories._();

  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);
}



