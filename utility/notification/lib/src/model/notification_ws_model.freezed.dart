// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_ws_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationWs {

 String? get topic; String? get topicDescription; String? get sentDate; Map? get message; String? get title; String? get link; String? get type; bool? get showAlert;
/// Create a copy of NotificationWs
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationWsCopyWith<NotificationWs> get copyWith => _$NotificationWsCopyWithImpl<NotificationWs>(this as NotificationWs, _$identity);

  /// Serializes this NotificationWs to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationWs&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.topicDescription, topicDescription) || other.topicDescription == topicDescription)&&(identical(other.sentDate, sentDate) || other.sentDate == sentDate)&&const DeepCollectionEquality().equals(other.message, message)&&(identical(other.title, title) || other.title == title)&&(identical(other.link, link) || other.link == link)&&(identical(other.type, type) || other.type == type)&&(identical(other.showAlert, showAlert) || other.showAlert == showAlert));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,topic,topicDescription,sentDate,const DeepCollectionEquality().hash(message),title,link,type,showAlert);

@override
String toString() {
  return 'NotificationWs(topic: $topic, topicDescription: $topicDescription, sentDate: $sentDate, message: $message, title: $title, link: $link, type: $type, showAlert: $showAlert)';
}


}

/// @nodoc
abstract mixin class $NotificationWsCopyWith<$Res>  {
  factory $NotificationWsCopyWith(NotificationWs value, $Res Function(NotificationWs) _then) = _$NotificationWsCopyWithImpl;
@useResult
$Res call({
 String? topic, String? topicDescription, String? sentDate, Map? message, String? title, String? link, String? type, bool? showAlert
});




}
/// @nodoc
class _$NotificationWsCopyWithImpl<$Res>
    implements $NotificationWsCopyWith<$Res> {
  _$NotificationWsCopyWithImpl(this._self, this._then);

  final NotificationWs _self;
  final $Res Function(NotificationWs) _then;

/// Create a copy of NotificationWs
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? topic = freezed,Object? topicDescription = freezed,Object? sentDate = freezed,Object? message = freezed,Object? title = freezed,Object? link = freezed,Object? type = freezed,Object? showAlert = freezed,}) {
  return _then(_self.copyWith(
topic: freezed == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String?,topicDescription: freezed == topicDescription ? _self.topicDescription : topicDescription // ignore: cast_nullable_to_non_nullable
as String?,sentDate: freezed == sentDate ? _self.sentDate : sentDate // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as Map?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,link: freezed == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,showAlert: freezed == showAlert ? _self.showAlert : showAlert // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationWs].
extension NotificationWsPatterns on NotificationWs {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationWs value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationWs() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationWs value)  $default,){
final _that = this;
switch (_that) {
case _NotificationWs():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationWs value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationWs() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? topic,  String? topicDescription,  String? sentDate,  Map? message,  String? title,  String? link,  String? type,  bool? showAlert)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationWs() when $default != null:
return $default(_that.topic,_that.topicDescription,_that.sentDate,_that.message,_that.title,_that.link,_that.type,_that.showAlert);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? topic,  String? topicDescription,  String? sentDate,  Map? message,  String? title,  String? link,  String? type,  bool? showAlert)  $default,) {final _that = this;
switch (_that) {
case _NotificationWs():
return $default(_that.topic,_that.topicDescription,_that.sentDate,_that.message,_that.title,_that.link,_that.type,_that.showAlert);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? topic,  String? topicDescription,  String? sentDate,  Map? message,  String? title,  String? link,  String? type,  bool? showAlert)?  $default,) {final _that = this;
switch (_that) {
case _NotificationWs() when $default != null:
return $default(_that.topic,_that.topicDescription,_that.sentDate,_that.message,_that.title,_that.link,_that.type,_that.showAlert);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationWs extends NotificationWs {
   _NotificationWs({this.topic, this.topicDescription, this.sentDate, final  Map? message, this.title, this.link, this.type, this.showAlert}): _message = message,super._();
  factory _NotificationWs.fromJson(Map<String, dynamic> json) => _$NotificationWsFromJson(json);

@override final  String? topic;
@override final  String? topicDescription;
@override final  String? sentDate;
 final  Map? _message;
@override Map? get message {
  final value = _message;
  if (value == null) return null;
  if (_message is EqualUnmodifiableMapView) return _message;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  String? title;
@override final  String? link;
@override final  String? type;
@override final  bool? showAlert;

/// Create a copy of NotificationWs
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationWsCopyWith<_NotificationWs> get copyWith => __$NotificationWsCopyWithImpl<_NotificationWs>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationWsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationWs&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.topicDescription, topicDescription) || other.topicDescription == topicDescription)&&(identical(other.sentDate, sentDate) || other.sentDate == sentDate)&&const DeepCollectionEquality().equals(other._message, _message)&&(identical(other.title, title) || other.title == title)&&(identical(other.link, link) || other.link == link)&&(identical(other.type, type) || other.type == type)&&(identical(other.showAlert, showAlert) || other.showAlert == showAlert));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,topic,topicDescription,sentDate,const DeepCollectionEquality().hash(_message),title,link,type,showAlert);

@override
String toString() {
  return 'NotificationWs(topic: $topic, topicDescription: $topicDescription, sentDate: $sentDate, message: $message, title: $title, link: $link, type: $type, showAlert: $showAlert)';
}


}

/// @nodoc
abstract mixin class _$NotificationWsCopyWith<$Res> implements $NotificationWsCopyWith<$Res> {
  factory _$NotificationWsCopyWith(_NotificationWs value, $Res Function(_NotificationWs) _then) = __$NotificationWsCopyWithImpl;
@override @useResult
$Res call({
 String? topic, String? topicDescription, String? sentDate, Map? message, String? title, String? link, String? type, bool? showAlert
});




}
/// @nodoc
class __$NotificationWsCopyWithImpl<$Res>
    implements _$NotificationWsCopyWith<$Res> {
  __$NotificationWsCopyWithImpl(this._self, this._then);

  final _NotificationWs _self;
  final $Res Function(_NotificationWs) _then;

/// Create a copy of NotificationWs
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? topic = freezed,Object? topicDescription = freezed,Object? sentDate = freezed,Object? message = freezed,Object? title = freezed,Object? link = freezed,Object? type = freezed,Object? showAlert = freezed,}) {
  return _then(_NotificationWs(
topic: freezed == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String?,topicDescription: freezed == topicDescription ? _self.topicDescription : topicDescription // ignore: cast_nullable_to_non_nullable
as String?,sentDate: freezed == sentDate ? _self.sentDate : sentDate // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self._message : message // ignore: cast_nullable_to_non_nullable
as Map?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,link: freezed == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,showAlert: freezed == showAlert ? _self.showAlert : showAlert // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$Notifications {

 List<NotificationWs> get notifications;
/// Create a copy of Notifications
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationsCopyWith<Notifications> get copyWith => _$NotificationsCopyWithImpl<Notifications>(this as Notifications, _$identity);

  /// Serializes this Notifications to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Notifications&&const DeepCollectionEquality().equals(other.notifications, notifications));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(notifications));

@override
String toString() {
  return 'Notifications(notifications: $notifications)';
}


}

/// @nodoc
abstract mixin class $NotificationsCopyWith<$Res>  {
  factory $NotificationsCopyWith(Notifications value, $Res Function(Notifications) _then) = _$NotificationsCopyWithImpl;
@useResult
$Res call({
 List<NotificationWs> notifications
});




}
/// @nodoc
class _$NotificationsCopyWithImpl<$Res>
    implements $NotificationsCopyWith<$Res> {
  _$NotificationsCopyWithImpl(this._self, this._then);

  final Notifications _self;
  final $Res Function(Notifications) _then;

/// Create a copy of Notifications
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? notifications = null,}) {
  return _then(_self.copyWith(
notifications: null == notifications ? _self.notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<NotificationWs>,
  ));
}

}


/// Adds pattern-matching-related methods to [Notifications].
extension NotificationsPatterns on Notifications {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Notifications value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Notifications() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Notifications value)  $default,){
final _that = this;
switch (_that) {
case _Notifications():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Notifications value)?  $default,){
final _that = this;
switch (_that) {
case _Notifications() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<NotificationWs> notifications)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Notifications() when $default != null:
return $default(_that.notifications);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<NotificationWs> notifications)  $default,) {final _that = this;
switch (_that) {
case _Notifications():
return $default(_that.notifications);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<NotificationWs> notifications)?  $default,) {final _that = this;
switch (_that) {
case _Notifications() when $default != null:
return $default(_that.notifications);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Notifications extends Notifications {
   _Notifications({final  List<NotificationWs> notifications = const []}): _notifications = notifications,super._();
  factory _Notifications.fromJson(Map<String, dynamic> json) => _$NotificationsFromJson(json);

 final  List<NotificationWs> _notifications;
@override@JsonKey() List<NotificationWs> get notifications {
  if (_notifications is EqualUnmodifiableListView) return _notifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notifications);
}


/// Create a copy of Notifications
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationsCopyWith<_Notifications> get copyWith => __$NotificationsCopyWithImpl<_Notifications>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Notifications&&const DeepCollectionEquality().equals(other._notifications, _notifications));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_notifications));

@override
String toString() {
  return 'Notifications(notifications: $notifications)';
}


}

/// @nodoc
abstract mixin class _$NotificationsCopyWith<$Res> implements $NotificationsCopyWith<$Res> {
  factory _$NotificationsCopyWith(_Notifications value, $Res Function(_Notifications) _then) = __$NotificationsCopyWithImpl;
@override @useResult
$Res call({
 List<NotificationWs> notifications
});




}
/// @nodoc
class __$NotificationsCopyWithImpl<$Res>
    implements _$NotificationsCopyWith<$Res> {
  __$NotificationsCopyWithImpl(this._self, this._then);

  final _Notifications _self;
  final $Res Function(_Notifications) _then;

/// Create a copy of Notifications
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notifications = null,}) {
  return _then(_Notifications(
notifications: null == notifications ? _self._notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<NotificationWs>,
  ));
}


}

// dart format on
