// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Product {

 String get productId; String get pseudoId; String? get productTypeId;// good, service, rental)
 String? get assetClassId;// room, restaurant table
 String? get productName; String? get description; Decimal? get listPrice; Decimal? get price; Currency? get currency;// currency, like EUR, USD
 Decimal? get amount;// quantity included like duration, length, weight
 List<Category> get categories; bool get useWarehouse; int? get assetCount;@Uint8ListConverter() Uint8List? get image;
/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductCopyWith<Product> get copyWith => _$ProductCopyWithImpl<Product>(this as Product, _$identity);

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Product&&super == other&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.pseudoId, pseudoId) || other.pseudoId == pseudoId)&&(identical(other.productTypeId, productTypeId) || other.productTypeId == productTypeId)&&(identical(other.assetClassId, assetClassId) || other.assetClassId == assetClassId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.description, description) || other.description == description)&&(identical(other.listPrice, listPrice) || other.listPrice == listPrice)&&(identical(other.price, price) || other.price == price)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.amount, amount) || other.amount == amount)&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.useWarehouse, useWarehouse) || other.useWarehouse == useWarehouse)&&(identical(other.assetCount, assetCount) || other.assetCount == assetCount)&&const DeepCollectionEquality().equals(other.image, image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,super.hashCode,productId,pseudoId,productTypeId,assetClassId,productName,description,listPrice,price,currency,amount,const DeepCollectionEquality().hash(categories),useWarehouse,assetCount,const DeepCollectionEquality().hash(image));



}

/// @nodoc
abstract mixin class $ProductCopyWith<$Res>  {
  factory $ProductCopyWith(Product value, $Res Function(Product) _then) = _$ProductCopyWithImpl;
@useResult
$Res call({
 String productId, String pseudoId, String? productTypeId, String? assetClassId, String? productName, String? description, Decimal? listPrice, Decimal? price, Currency? currency, Decimal? amount, List<Category> categories, bool useWarehouse, int? assetCount,@Uint8ListConverter() Uint8List? image
});


$CurrencyCopyWith<$Res>? get currency;

}
/// @nodoc
class _$ProductCopyWithImpl<$Res>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._self, this._then);

  final Product _self;
  final $Res Function(Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = null,Object? pseudoId = null,Object? productTypeId = freezed,Object? assetClassId = freezed,Object? productName = freezed,Object? description = freezed,Object? listPrice = freezed,Object? price = freezed,Object? currency = freezed,Object? amount = freezed,Object? categories = null,Object? useWarehouse = null,Object? assetCount = freezed,Object? image = freezed,}) {
  return _then(_self.copyWith(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,pseudoId: null == pseudoId ? _self.pseudoId : pseudoId // ignore: cast_nullable_to_non_nullable
as String,productTypeId: freezed == productTypeId ? _self.productTypeId : productTypeId // ignore: cast_nullable_to_non_nullable
as String?,assetClassId: freezed == assetClassId ? _self.assetClassId : assetClassId // ignore: cast_nullable_to_non_nullable
as String?,productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,listPrice: freezed == listPrice ? _self.listPrice : listPrice // ignore: cast_nullable_to_non_nullable
as Decimal?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Decimal?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Decimal?,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<Category>,useWarehouse: null == useWarehouse ? _self.useWarehouse : useWarehouse // ignore: cast_nullable_to_non_nullable
as bool,assetCount: freezed == assetCount ? _self.assetCount : assetCount // ignore: cast_nullable_to_non_nullable
as int?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as Uint8List?,
  ));
}
/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrencyCopyWith<$Res>? get currency {
    if (_self.currency == null) {
    return null;
  }

  return $CurrencyCopyWith<$Res>(_self.currency!, (value) {
    return _then(_self.copyWith(currency: value));
  });
}
}


/// Adds pattern-matching-related methods to [Product].
extension ProductPatterns on Product {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Product value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Product value)  $default,){
final _that = this;
switch (_that) {
case _Product():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Product value)?  $default,){
final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String productId,  String pseudoId,  String? productTypeId,  String? assetClassId,  String? productName,  String? description,  Decimal? listPrice,  Decimal? price,  Currency? currency,  Decimal? amount,  List<Category> categories,  bool useWarehouse,  int? assetCount, @Uint8ListConverter()  Uint8List? image)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.productId,_that.pseudoId,_that.productTypeId,_that.assetClassId,_that.productName,_that.description,_that.listPrice,_that.price,_that.currency,_that.amount,_that.categories,_that.useWarehouse,_that.assetCount,_that.image);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String productId,  String pseudoId,  String? productTypeId,  String? assetClassId,  String? productName,  String? description,  Decimal? listPrice,  Decimal? price,  Currency? currency,  Decimal? amount,  List<Category> categories,  bool useWarehouse,  int? assetCount, @Uint8ListConverter()  Uint8List? image)  $default,) {final _that = this;
switch (_that) {
case _Product():
return $default(_that.productId,_that.pseudoId,_that.productTypeId,_that.assetClassId,_that.productName,_that.description,_that.listPrice,_that.price,_that.currency,_that.amount,_that.categories,_that.useWarehouse,_that.assetCount,_that.image);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String productId,  String pseudoId,  String? productTypeId,  String? assetClassId,  String? productName,  String? description,  Decimal? listPrice,  Decimal? price,  Currency? currency,  Decimal? amount,  List<Category> categories,  bool useWarehouse,  int? assetCount, @Uint8ListConverter()  Uint8List? image)?  $default,) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.productId,_that.pseudoId,_that.productTypeId,_that.assetClassId,_that.productName,_that.description,_that.listPrice,_that.price,_that.currency,_that.amount,_that.categories,_that.useWarehouse,_that.assetCount,_that.image);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Product extends Product {
  const _Product({this.productId = "", this.pseudoId = "", this.productTypeId, this.assetClassId, this.productName, this.description, this.listPrice, this.price, this.currency, this.amount, final  List<Category> categories = const [], this.useWarehouse = false, this.assetCount, @Uint8ListConverter() this.image}): _categories = categories,super._();
  factory _Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

@override@JsonKey() final  String productId;
@override@JsonKey() final  String pseudoId;
@override final  String? productTypeId;
// good, service, rental)
@override final  String? assetClassId;
// room, restaurant table
@override final  String? productName;
@override final  String? description;
@override final  Decimal? listPrice;
@override final  Decimal? price;
@override final  Currency? currency;
// currency, like EUR, USD
@override final  Decimal? amount;
// quantity included like duration, length, weight
 final  List<Category> _categories;
// quantity included like duration, length, weight
@override@JsonKey() List<Category> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@override@JsonKey() final  bool useWarehouse;
@override final  int? assetCount;
@override@Uint8ListConverter() final  Uint8List? image;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductCopyWith<_Product> get copyWith => __$ProductCopyWithImpl<_Product>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Product&&super == other&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.pseudoId, pseudoId) || other.pseudoId == pseudoId)&&(identical(other.productTypeId, productTypeId) || other.productTypeId == productTypeId)&&(identical(other.assetClassId, assetClassId) || other.assetClassId == assetClassId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.description, description) || other.description == description)&&(identical(other.listPrice, listPrice) || other.listPrice == listPrice)&&(identical(other.price, price) || other.price == price)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.amount, amount) || other.amount == amount)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.useWarehouse, useWarehouse) || other.useWarehouse == useWarehouse)&&(identical(other.assetCount, assetCount) || other.assetCount == assetCount)&&const DeepCollectionEquality().equals(other.image, image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,super.hashCode,productId,pseudoId,productTypeId,assetClassId,productName,description,listPrice,price,currency,amount,const DeepCollectionEquality().hash(_categories),useWarehouse,assetCount,const DeepCollectionEquality().hash(image));



}

/// @nodoc
abstract mixin class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) _then) = __$ProductCopyWithImpl;
@override @useResult
$Res call({
 String productId, String pseudoId, String? productTypeId, String? assetClassId, String? productName, String? description, Decimal? listPrice, Decimal? price, Currency? currency, Decimal? amount, List<Category> categories, bool useWarehouse, int? assetCount,@Uint8ListConverter() Uint8List? image
});


@override $CurrencyCopyWith<$Res>? get currency;

}
/// @nodoc
class __$ProductCopyWithImpl<$Res>
    implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(this._self, this._then);

  final _Product _self;
  final $Res Function(_Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? pseudoId = null,Object? productTypeId = freezed,Object? assetClassId = freezed,Object? productName = freezed,Object? description = freezed,Object? listPrice = freezed,Object? price = freezed,Object? currency = freezed,Object? amount = freezed,Object? categories = null,Object? useWarehouse = null,Object? assetCount = freezed,Object? image = freezed,}) {
  return _then(_Product(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,pseudoId: null == pseudoId ? _self.pseudoId : pseudoId // ignore: cast_nullable_to_non_nullable
as String,productTypeId: freezed == productTypeId ? _self.productTypeId : productTypeId // ignore: cast_nullable_to_non_nullable
as String?,assetClassId: freezed == assetClassId ? _self.assetClassId : assetClassId // ignore: cast_nullable_to_non_nullable
as String?,productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,listPrice: freezed == listPrice ? _self.listPrice : listPrice // ignore: cast_nullable_to_non_nullable
as Decimal?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Decimal?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Decimal?,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<Category>,useWarehouse: null == useWarehouse ? _self.useWarehouse : useWarehouse // ignore: cast_nullable_to_non_nullable
as bool,assetCount: freezed == assetCount ? _self.assetCount : assetCount // ignore: cast_nullable_to_non_nullable
as int?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as Uint8List?,
  ));
}

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrencyCopyWith<$Res>? get currency {
    if (_self.currency == null) {
    return null;
  }

  return $CurrencyCopyWith<$Res>(_self.currency!, (value) {
    return _then(_self.copyWith(currency: value));
  });
}
}


/// @nodoc
mixin _$Products {

 List<Product> get products;
/// Create a copy of Products
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductsCopyWith<Products> get copyWith => _$ProductsCopyWithImpl<Products>(this as Products, _$identity);

  /// Serializes this Products to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Products&&const DeepCollectionEquality().equals(other.products, products));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(products));

@override
String toString() {
  return 'Products(products: $products)';
}


}

/// @nodoc
abstract mixin class $ProductsCopyWith<$Res>  {
  factory $ProductsCopyWith(Products value, $Res Function(Products) _then) = _$ProductsCopyWithImpl;
@useResult
$Res call({
 List<Product> products
});




}
/// @nodoc
class _$ProductsCopyWithImpl<$Res>
    implements $ProductsCopyWith<$Res> {
  _$ProductsCopyWithImpl(this._self, this._then);

  final Products _self;
  final $Res Function(Products) _then;

/// Create a copy of Products
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? products = null,}) {
  return _then(_self.copyWith(
products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<Product>,
  ));
}

}


/// Adds pattern-matching-related methods to [Products].
extension ProductsPatterns on Products {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Products value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Products() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Products value)  $default,){
final _that = this;
switch (_that) {
case _Products():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Products value)?  $default,){
final _that = this;
switch (_that) {
case _Products() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Product> products)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Products() when $default != null:
return $default(_that.products);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Product> products)  $default,) {final _that = this;
switch (_that) {
case _Products():
return $default(_that.products);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Product> products)?  $default,) {final _that = this;
switch (_that) {
case _Products() when $default != null:
return $default(_that.products);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Products extends Products {
   _Products({final  List<Product> products = const []}): _products = products,super._();
  factory _Products.fromJson(Map<String, dynamic> json) => _$ProductsFromJson(json);

 final  List<Product> _products;
@override@JsonKey() List<Product> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}


/// Create a copy of Products
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductsCopyWith<_Products> get copyWith => __$ProductsCopyWithImpl<_Products>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Products&&const DeepCollectionEquality().equals(other._products, _products));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products));

@override
String toString() {
  return 'Products(products: $products)';
}


}

/// @nodoc
abstract mixin class _$ProductsCopyWith<$Res> implements $ProductsCopyWith<$Res> {
  factory _$ProductsCopyWith(_Products value, $Res Function(_Products) _then) = __$ProductsCopyWithImpl;
@override @useResult
$Res call({
 List<Product> products
});




}
/// @nodoc
class __$ProductsCopyWithImpl<$Res>
    implements _$ProductsCopyWith<$Res> {
  __$ProductsCopyWithImpl(this._self, this._then);

  final _Products _self;
  final $Res Function(_Products) _then;

/// Create a copy of Products
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? products = null,}) {
  return _then(_Products(
products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<Product>,
  ));
}


}

// dart format on
