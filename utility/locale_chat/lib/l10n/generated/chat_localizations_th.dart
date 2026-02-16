// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'chat_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class ChatLocalizationsTh extends ChatLocalizations {
  ChatLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get chatNotActive => 'แชทไม่ทำงาน!';

  @override
  String get messageText => 'ข้อความ..';

  @override
  String get send => 'ส่ง';

  @override
  String get addPartner => 'เพิ่มคู่สนทนา';

  @override
  String get chat => 'แชท #';

  @override
  String get newChat => 'ใหม่';

  @override
  String get selectChatPartner => 'เลือกคู่สนทนา';

  @override
  String get chatPartner => 'คู่สนทนา';

  @override
  String get fieldRequired => 'ต้องระบุข้อมูล';

  @override
  String get create => 'สร้าง';

  @override
  String get update => 'อัปเดต';

  @override
  String get room => 'ห้อง';

  @override
  String get chatRoom => 'ห้องแชท';

  @override
  String get chatUsersAndGroups => 'ผู้ใช้และกลุ่มแชท';

  @override
  String get addNew => 'เพิ่มใหม่';

  @override
  String get no => 'ไม่พบ ';

  @override
  String get sFound => ' ที่พบ!';

  @override
  String get searchInName => 'ค้นหาในชื่อ ..';

  @override
  String get search => 'ค้นหา';

  @override
  String get name => 'ชื่อ';

  @override
  String get status => 'สถานะ';

  @override
  String get pvt => 'ส่วนตัว';

  @override
  String get nroMembers => '#สมาชิก';

  @override
  String get allMessagesRead => 'อ่านข้อความทั้งหมดแล้ว';

  @override
  String get unreadMessages => 'ข้อความที่ยังไม่ได้อ่าน';

  @override
  String get chatRoomUpdateSuccess => 'อัปเดตห้องแชทสำเร็จ';

  @override
  String get chatRoomUpdateFailure => 'การอัปเดตห้องแชทล้มเหลว';

  @override
  String get chatRoomDeleteSuccess => 'ลบห้องแชทสำเร็จ';

  @override
  String get chatRoomDeleteFailure => 'การลบห้องแชทล้มเหลว';

  @override
  String get chatRoomAddSuccess => 'เพิ่มห้องแชทสำเร็จ';

  @override
  String get chatRoomAddFailure => 'การเพิ่มห้องแชทล้มเหลว';

  @override
  String get chatRoomFetchFailure => 'การดึงข้อมูลห้องแชทล้มเหลว';

  @override
  String get chatMessageSendSuccess => 'ส่งข้อความสำเร็จ';

  @override
  String get chatMessageSendFailure => 'การส่งข้อความล้มเหลว';

  @override
  String get chatMessageDeleteSuccess => 'ลบข้อความสำเร็จ';

  @override
  String get chatMessageDeleteFailure => 'การลบข้อความล้มเหลว';

  @override
  String get chatMessageFetchFailure => 'การดึงข้อมูลข้อความล้มเหลว';
}
