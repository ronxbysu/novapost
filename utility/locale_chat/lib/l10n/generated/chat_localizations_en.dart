// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'chat_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class ChatLocalizationsEn extends ChatLocalizations {
  ChatLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get chatNotActive => 'Chat not active!';

  @override
  String get messageText => 'Message text..';

  @override
  String get send => 'Send';

  @override
  String get addPartner => 'Add partner';

  @override
  String get chat => 'Chat #';

  @override
  String get newChat => 'New';

  @override
  String get selectChatPartner => 'Select chat partner';

  @override
  String get chatPartner => 'Chat partner';

  @override
  String get fieldRequired => 'Field required';

  @override
  String get create => 'Create';

  @override
  String get update => 'Update';

  @override
  String get room => 'Room';

  @override
  String get chatRoom => 'ChatRoom';

  @override
  String get chatUsersAndGroups => 'Chat users and groups';

  @override
  String get addNew => 'Add New';

  @override
  String get no => 'no ';

  @override
  String get sFound => 's found!';

  @override
  String get searchInName => 'search in name ..';

  @override
  String get search => 'Search';

  @override
  String get name => 'Name';

  @override
  String get status => 'Status';

  @override
  String get pvt => 'Pvt.';

  @override
  String get nroMembers => '#Mem.';

  @override
  String get allMessagesRead => 'All messages read';

  @override
  String get unreadMessages => 'unread messages';

  @override
  String get chatRoomUpdateSuccess => 'Chat room updated successfully';

  @override
  String get chatRoomUpdateFailure => 'Failed to update chat room';

  @override
  String get chatRoomDeleteSuccess => 'Chat room deleted successfully';

  @override
  String get chatRoomDeleteFailure => 'Failed to delete chat room';

  @override
  String get chatRoomAddSuccess => 'Chat room added successfully';

  @override
  String get chatRoomAddFailure => 'Failed to add chat room';

  @override
  String get chatRoomFetchFailure => 'Failed to fetch chat rooms';

  @override
  String get chatMessageSendSuccess => 'Message sent successfully';

  @override
  String get chatMessageSendFailure => 'Failed to send message';

  @override
  String get chatMessageDeleteSuccess => 'Message deleted successfully';

  @override
  String get chatMessageDeleteFailure => 'Failed to delete message';

  @override
  String get chatMessageFetchFailure => 'Failed to fetch messages';
}
