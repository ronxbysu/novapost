// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Company {

 String? get partyId; String? get pseudoId;@RoleConverter() Role? get role; String? get name; String? get email; String? get url; String? get telephoneNr; Currency? get currency;@Uint8ListConverter() Uint8List? get image; Address? get address; PaymentMethod? get paymentMethod; Decimal? get vatPerc; Decimal? get salesPerc; List<User> get employees; String? get hostName; String? get secondaryBackend;
/// Create a copy of Company
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyCopyWith<Company> get copyWith => _$CompanyCopyWithImpl<Company>(this as Company, _$identity);

  /// Serializes this Company to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Company&&(identical(other.partyId, partyId) || other.partyId == partyId)&&(identical(other.pseudoId, pseudoId) || other.pseudoId == pseudoId)&&(identical(other.role, role) || other.role == role)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.url, url) || other.url == url)&&(identical(other.telephoneNr, telephoneNr) || other.telephoneNr == telephoneNr)&&(identical(other.currency, currency) || other.currency == currency)&&const DeepCollectionEquality().equals(other.image, image)&&(identical(other.address, address) || other.address == address)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.vatPerc, vatPerc) || other.vatPerc == vatPerc)&&(identical(other.salesPerc, salesPerc) || other.salesPerc == salesPerc)&&const DeepCollectionEquality().equals(other.employees, employees)&&(identical(other.hostName, hostName) || other.hostName == hostName)&&(identical(other.secondaryBackend, secondaryBackend) || other.secondaryBackend == secondaryBackend));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,partyId,pseudoId,role,name,email,url,telephoneNr,currency,const DeepCollectionEquality().hash(image),address,paymentMethod,vatPerc,salesPerc,const DeepCollectionEquality().hash(employees),hostName,secondaryBackend);



}

/// @nodoc
abstract mixin class $CompanyCopyWith<$Res>  {
  factory $CompanyCopyWith(Company value, $Res Function(Company) _then) = _$CompanyCopyWithImpl;
@useResult
$Res call({
 String? partyId, String? pseudoId,@RoleConverter() Role? role, String? name, String? email, String? url, String? telephoneNr, Currency? currency,@Uint8ListConverter() Uint8List? image, Address? address, PaymentMethod? paymentMethod, Decimal? vatPerc, Decimal? salesPerc, List<User> employees, String? hostName, String? secondaryBackend
});


$CurrencyCopyWith<$Res>? get currency;$AddressCopyWith<$Res>? get address;$PaymentMethodCopyWith<$Res>? get paymentMethod;

}
/// @nodoc
class _$CompanyCopyWithImpl<$Res>
    implements $CompanyCopyWith<$Res> {
  _$CompanyCopyWithImpl(this._self, this._then);

  final Company _self;
  final $Res Function(Company) _then;

/// Create a copy of Company
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? partyId = freezed,Object? pseudoId = freezed,Object? role = freezed,Object? name = freezed,Object? email = freezed,Object? url = freezed,Object? telephoneNr = freezed,Object? currency = freezed,Object? image = freezed,Object? address = freezed,Object? paymentMethod = freezed,Object? vatPerc = freezed,Object? salesPerc = freezed,Object? employees = null,Object? hostName = freezed,Object? secondaryBackend = freezed,}) {
  return _then(_self.copyWith(
partyId: freezed == partyId ? _self.partyId : partyId // ignore: cast_nullable_to_non_nullable
as String?,pseudoId: freezed == pseudoId ? _self.pseudoId : pseudoId // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as Role?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,telephoneNr: freezed == telephoneNr ? _self.telephoneNr : telephoneNr // ignore: cast_nullable_to_non_nullable
as String?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as Uint8List?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as Address?,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod?,vatPerc: freezed == vatPerc ? _self.vatPerc : vatPerc // ignore: cast_nullable_to_non_nullable
as Decimal?,salesPerc: freezed == salesPerc ? _self.salesPerc : salesPerc // ignore: cast_nullable_to_non_nullable
as Decimal?,employees: null == employees ? _self.employees : employees // ignore: cast_nullable_to_non_nullable
as List<User>,hostName: freezed == hostName ? _self.hostName : hostName // ignore: cast_nullable_to_non_nullable
as String?,secondaryBackend: freezed == secondaryBackend ? _self.secondaryBackend : secondaryBackend // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Company
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
}/// Create a copy of Company
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res>? get address {
    if (_self.address == null) {
    return null;
  }

  return $AddressCopyWith<$Res>(_self.address!, (value) {
    return _then(_self.copyWith(address: value));
  });
}/// Create a copy of Company
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentMethodCopyWith<$Res>? get paymentMethod {
    if (_self.paymentMethod == null) {
    return null;
  }

  return $PaymentMethodCopyWith<$Res>(_self.paymentMethod!, (value) {
    return _then(_self.copyWith(paymentMethod: value));
  });
}
}


/// Adds pattern-matching-related methods to [Company].
extension CompanyPatterns on Company {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Company value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Company() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Company value)  $default,){
final _that = this;
switch (_that) {
case _Company():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Company value)?  $default,){
final _that = this;
switch (_that) {
case _Company() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? partyId,  String? pseudoId, @RoleConverter()  Role? role,  String? name,  String? email,  String? url,  String? telephoneNr,  Currency? currency, @Uint8ListConverter()  Uint8List? image,  Address? address,  PaymentMethod? paymentMethod,  Decimal? vatPerc,  Decimal? salesPerc,  List<User> employees,  String? hostName,  String? secondaryBackend)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Company() when $default != null:
return $default(_that.partyId,_that.pseudoId,_that.role,_that.name,_that.email,_that.url,_that.telephoneNr,_that.currency,_that.image,_that.address,_that.paymentMethod,_that.vatPerc,_that.salesPerc,_that.employees,_that.hostName,_that.secondaryBackend);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? partyId,  String? pseudoId, @RoleConverter()  Role? role,  String? name,  String? email,  String? url,  String? telephoneNr,  Currency? currency, @Uint8ListConverter()  Uint8List? image,  Address? address,  PaymentMethod? paymentMethod,  Decimal? vatPerc,  Decimal? salesPerc,  List<User> employees,  String? hostName,  String? secondaryBackend)  $default,) {final _that = this;
switch (_that) {
case _Company():
return $default(_that.partyId,_that.pseudoId,_that.role,_that.name,_that.email,_that.url,_that.telephoneNr,_that.currency,_that.image,_that.address,_that.paymentMethod,_that.vatPerc,_that.salesPerc,_that.employees,_that.hostName,_that.secondaryBackend);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? partyId,  String? pseudoId, @RoleConverter()  Role? role,  String? name,  String? email,  String? url,  String? telephoneNr,  Currency? currency, @Uint8ListConverter()  Uint8List? image,  Address? address,  PaymentMethod? paymentMethod,  Decimal? vatPerc,  Decimal? salesPerc,  List<User> employees,  String? hostName,  String? secondaryBackend)?  $default,) {final _that = this;
switch (_that) {
case _Company() when $default != null:
return $default(_that.partyId,_that.pseudoId,_that.role,_that.name,_that.email,_that.url,_that.telephoneNr,_that.currency,_that.image,_that.address,_that.paymentMethod,_that.vatPerc,_that.salesPerc,_that.employees,_that.hostName,_that.secondaryBackend);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Company extends Company {
   _Company({this.partyId, this.pseudoId, @RoleConverter() this.role, this.name, this.email, this.url, this.telephoneNr, this.currency, @Uint8ListConverter() this.image, this.address, this.paymentMethod, this.vatPerc, this.salesPerc, final  List<User> employees = const [], this.hostName, this.secondaryBackend}): _employees = employees,super._();
  factory _Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);

@override final  String? partyId;
@override final  String? pseudoId;
@override@RoleConverter() final  Role? role;
@override final  String? name;
@override final  String? email;
@override final  String? url;
@override final  String? telephoneNr;
@override final  Currency? currency;
@override@Uint8ListConverter() final  Uint8List? image;
@override final  Address? address;
@override final  PaymentMethod? paymentMethod;
@override final  Decimal? vatPerc;
@override final  Decimal? salesPerc;
 final  List<User> _employees;
@override@JsonKey() List<User> get employees {
  if (_employees is EqualUnmodifiableListView) return _employees;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_employees);
}

@override final  String? hostName;
@override final  String? secondaryBackend;

/// Create a copy of Company
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompanyCopyWith<_Company> get copyWith => __$CompanyCopyWithImpl<_Company>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompanyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Company&&(identical(other.partyId, partyId) || other.partyId == partyId)&&(identical(other.pseudoId, pseudoId) || other.pseudoId == pseudoId)&&(identical(other.role, role) || other.role == role)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.url, url) || other.url == url)&&(identical(other.telephoneNr, telephoneNr) || other.telephoneNr == telephoneNr)&&(identical(other.currency, currency) || other.currency == currency)&&const DeepCollectionEquality().equals(other.image, image)&&(identical(other.address, address) || other.address == address)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.vatPerc, vatPerc) || other.vatPerc == vatPerc)&&(identical(other.salesPerc, salesPerc) || other.salesPerc == salesPerc)&&const DeepCollectionEquality().equals(other._employees, _employees)&&(identical(other.hostName, hostName) || other.hostName == hostName)&&(identical(other.secondaryBackend, secondaryBackend) || other.secondaryBackend == secondaryBackend));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,partyId,pseudoId,role,name,email,url,telephoneNr,currency,const DeepCollectionEquality().hash(image),address,paymentMethod,vatPerc,salesPerc,const DeepCollectionEquality().hash(_employees),hostName,secondaryBackend);



}

/// @nodoc
abstract mixin class _$CompanyCopyWith<$Res> implements $CompanyCopyWith<$Res> {
  factory _$CompanyCopyWith(_Company value, $Res Function(_Company) _then) = __$CompanyCopyWithImpl;
@override @useResult
$Res call({
 String? partyId, String? pseudoId,@RoleConverter() Role? role, String? name, String? email, String? url, String? telephoneNr, Currency? currency,@Uint8ListConverter() Uint8List? image, Address? address, PaymentMethod? paymentMethod, Decimal? vatPerc, Decimal? salesPerc, List<User> employees, String? hostName, String? secondaryBackend
});


@override $CurrencyCopyWith<$Res>? get currency;@override $AddressCopyWith<$Res>? get address;@override $PaymentMethodCopyWith<$Res>? get paymentMethod;

}
/// @nodoc
class __$CompanyCopyWithImpl<$Res>
    implements _$CompanyCopyWith<$Res> {
  __$CompanyCopyWithImpl(this._self, this._then);

  final _Company _self;
  final $Res Function(_Company) _then;

/// Create a copy of Company
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? partyId = freezed,Object? pseudoId = freezed,Object? role = freezed,Object? name = freezed,Object? email = freezed,Object? url = freezed,Object? telephoneNr = freezed,Object? currency = freezed,Object? image = freezed,Object? address = freezed,Object? paymentMethod = freezed,Object? vatPerc = freezed,Object? salesPerc = freezed,Object? employees = null,Object? hostName = freezed,Object? secondaryBackend = freezed,}) {
  return _then(_Company(
partyId: freezed == partyId ? _self.partyId : partyId // ignore: cast_nullable_to_non_nullable
as String?,pseudoId: freezed == pseudoId ? _self.pseudoId : pseudoId // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as Role?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,telephoneNr: freezed == telephoneNr ? _self.telephoneNr : telephoneNr // ignore: cast_nullable_to_non_nullable
as String?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as Uint8List?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as Address?,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod?,vatPerc: freezed == vatPerc ? _self.vatPerc : vatPerc // ignore: cast_nullable_to_non_nullable
as Decimal?,salesPerc: freezed == salesPerc ? _self.salesPerc : salesPerc // ignore: cast_nullable_to_non_nullable
as Decimal?,employees: null == employees ? _self._employees : employees // ignore: cast_nullable_to_non_nullable
as List<User>,hostName: freezed == hostName ? _self.hostName : hostName // ignore: cast_nullable_to_non_nullable
as String?,secondaryBackend: freezed == secondaryBackend ? _self.secondaryBackend : secondaryBackend // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Company
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
}/// Create a copy of Company
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res>? get address {
    if (_self.address == null) {
    return null;
  }

  return $AddressCopyWith<$Res>(_self.address!, (value) {
    return _then(_self.copyWith(address: value));
  });
}/// Create a copy of Company
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentMethodCopyWith<$Res>? get paymentMethod {
    if (_self.paymentMethod == null) {
    return null;
  }

  return $PaymentMethodCopyWith<$Res>(_self.paymentMethod!, (value) {
    return _then(_self.copyWith(paymentMethod: value));
  });
}
}

// dart format on
