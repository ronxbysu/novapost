// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_ws_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationWs _$NotificationWsFromJson(Map<String, dynamic> json) =>
    _NotificationWs(
      topic: json['topic'] as String?,
      topicDescription: json['topicDescription'] as String?,
      sentDate: json['sentDate'] as String?,
      message: json['message'] as Map<String, dynamic>?,
      title: json['title'] as String?,
      link: json['link'] as String?,
      type: json['type'] as String?,
      showAlert: json['showAlert'] as bool?,
    );

Map<String, dynamic> _$NotificationWsToJson(_NotificationWs instance) =>
    <String, dynamic>{
      'topic': instance.topic,
      'topicDescription': instance.topicDescription,
      'sentDate': instance.sentDate,
      'message': instance.message,
      'title': instance.title,
      'link': instance.link,
      'type': instance.type,
      'showAlert': instance.showAlert,
    };

_Notifications _$NotificationsFromJson(Map<String, dynamic> json) =>
    _Notifications(
      notifications:
          (json['notifications'] as List<dynamic>?)
              ?.map((e) => NotificationWs.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$NotificationsToJson(_Notifications instance) =>
    <String, dynamic>{'notifications': instance.notifications};
