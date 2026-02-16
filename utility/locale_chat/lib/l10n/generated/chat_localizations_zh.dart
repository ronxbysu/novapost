// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'chat_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class ChatLocalizationsZh extends ChatLocalizations {
  ChatLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get chatNotActive => '聊天未激活！';

  @override
  String get messageText => '消息文本..';

  @override
  String get send => '发送';

  @override
  String get addPartner => '添加伙伴';

  @override
  String get chat => '聊天 #';

  @override
  String get newChat => '新建';

  @override
  String get selectChatPartner => '选择聊天伙伴';

  @override
  String get chatPartner => '聊天伙伴';

  @override
  String get fieldRequired => '必填字段';

  @override
  String get create => '创建';

  @override
  String get update => '更新';

  @override
  String get room => '房间';

  @override
  String get chatRoom => '聊天室';

  @override
  String get chatUsersAndGroups => '聊天用户和群组';

  @override
  String get addNew => '添新';

  @override
  String get no => '没有 ';

  @override
  String get sFound => '找到！';

  @override
  String get searchInName => '在名称中搜索..';

  @override
  String get search => '搜索';

  @override
  String get name => '名称';

  @override
  String get status => '状态';

  @override
  String get pvt => '私人';

  @override
  String get nroMembers => '#成员';

  @override
  String get allMessagesRead => '所有消息已读';

  @override
  String get unreadMessages => '未读消息';

  @override
  String get chatRoomUpdateSuccess => '聊天室更新成功';

  @override
  String get chatRoomUpdateFailure => '聊天室更新失败';

  @override
  String get chatRoomDeleteSuccess => '聊天室删除成功';

  @override
  String get chatRoomDeleteFailure => '聊天室删除失败';

  @override
  String get chatRoomAddSuccess => '聊天室添加成功';

  @override
  String get chatRoomAddFailure => '聊天室添加失败';

  @override
  String get chatRoomFetchFailure => '获取聊天室失败';

  @override
  String get chatMessageSendSuccess => '消息发送成功';

  @override
  String get chatMessageSendFailure => '消息发送失败';

  @override
  String get chatMessageDeleteSuccess => '消息删除成功';

  @override
  String get chatMessageDeleteFailure => '消息删除失败';

  @override
  String get chatMessageFetchFailure => '获取消息失败';
}
