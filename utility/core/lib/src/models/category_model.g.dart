// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Category _$CategoryFromJson(Map<String, dynamic> json) => _Category(
  categoryId: json['categoryId'] as String? ?? "",
  pseudoId: json['pseudoId'] as String? ?? "",
  categoryName: json['categoryName'] as String? ?? "",
  description: json['description'] as String? ?? "",
  image: const Uint8ListConverter().fromJson(json['image'] as String?),
  seqId: (json['seqId'] as num?)?.toInt() ?? 0,
  nbrOfProducts: (json['nbrOfProducts'] as num?)?.toInt() ?? 0,
  products:
      (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$CategoryToJson(_Category instance) => <String, dynamic>{
  'categoryId': instance.categoryId,
  'pseudoId': instance.pseudoId,
  'categoryName': instance.categoryName,
  'description': instance.description,
  'image': const Uint8ListConverter().toJson(instance.image),
  'seqId': instance.seqId,
  'nbrOfProducts': instance.nbrOfProducts,
  'products': instance.products,
};

_Categories _$CategoriesFromJson(Map<String, dynamic> json) => _Categories(
  categories:
      (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$CategoriesToJson(_Categories instance) =>
    <String, dynamic>{'categories': instance.categories};
