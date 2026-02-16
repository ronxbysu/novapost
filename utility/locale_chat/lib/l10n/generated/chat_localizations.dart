import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'chat_localizations_de.dart';
import 'chat_localizations_en.dart';
import 'chat_localizations_fr.dart';
import 'chat_localizations_nl.dart';
import 'chat_localizations_th.dart';
import 'chat_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of ChatLocalizations
/// returned by `ChatLocalizations.of(context)`.
///
/// Applications need to include `ChatLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/chat_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: ChatLocalizations.localizationsDelegates,
///   supportedLocales: ChatLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the ChatLocalizations.supportedLocales
/// property.
abstract class ChatLocalizations {
  ChatLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static ChatLocalizations? of(BuildContext context) {
    return Localizations.of<ChatLocalizations>(context, ChatLocalizations);
  }

  static const LocalizationsDelegate<ChatLocalizations> delegate =
      _ChatLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('th'),
    Locale('zh'),
    Locale('de'),
    Locale('fr'),
    Locale('nl'),
  ];

  /// Error message when chat is not active
  ///
  /// In en, this message translates to:
  /// **'Chat not active!'**
  String get chatNotActive;

  /// Placeholder text for message input field
  ///
  /// In en, this message translates to:
  /// **'Message text..'**
  String get messageText;

  /// Send button text
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// Button text to add chat partner
  ///
  /// In en, this message translates to:
  /// **'Add partner'**
  String get addPartner;

  /// Chat header with number symbol
  ///
  /// In en, this message translates to:
  /// **'Chat #'**
  String get chat;

  /// Button text for creating new chat
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get newChat;

  /// Instruction to select a chat partner
  ///
  /// In en, this message translates to:
  /// **'Select chat partner'**
  String get selectChatPartner;

  /// Label for chat partner field
  ///
  /// In en, this message translates to:
  /// **'Chat partner'**
  String get chatPartner;

  /// Generic required field error message
  ///
  /// In en, this message translates to:
  /// **'Field required'**
  String get fieldRequired;

  /// Create button text
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// Update button text
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// Label for room
  ///
  /// In en, this message translates to:
  /// **'Room'**
  String get room;

  /// Chat room label or header
  ///
  /// In en, this message translates to:
  /// **'ChatRoom'**
  String get chatRoom;

  /// Section header for chat users and groups
  ///
  /// In en, this message translates to:
  /// **'Chat users and groups'**
  String get chatUsersAndGroups;

  /// Add new item button text
  ///
  /// In en, this message translates to:
  /// **'Add New'**
  String get addNew;

  /// Partial text for 'no items found' messages
  ///
  /// In en, this message translates to:
  /// **'no '**
  String get no;

  /// Partial text for 'items found' messages
  ///
  /// In en, this message translates to:
  /// **'s found!'**
  String get sFound;

  /// Placeholder text for name search field
  ///
  /// In en, this message translates to:
  /// **'search in name ..'**
  String get searchInName;

  /// Search button text
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// Name field label
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// Status field label
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// Abbreviation for Private
  ///
  /// In en, this message translates to:
  /// **'Pvt.'**
  String get pvt;

  /// Abbreviation for number of members
  ///
  /// In en, this message translates to:
  /// **'#Mem.'**
  String get nroMembers;

  /// Status message when all messages are read
  ///
  /// In en, this message translates to:
  /// **'All messages read'**
  String get allMessagesRead;

  /// Label for unread messages count
  ///
  /// In en, this message translates to:
  /// **'unread messages'**
  String get unreadMessages;

  /// BLoC message: Chat room updated successfully
  ///
  /// In en, this message translates to:
  /// **'Chat room updated successfully'**
  String get chatRoomUpdateSuccess;

  /// BLoC message: Failed to update chat room
  ///
  /// In en, this message translates to:
  /// **'Failed to update chat room'**
  String get chatRoomUpdateFailure;

  /// BLoC message: Chat room deleted successfully
  ///
  /// In en, this message translates to:
  /// **'Chat room deleted successfully'**
  String get chatRoomDeleteSuccess;

  /// BLoC message: Failed to delete chat room
  ///
  /// In en, this message translates to:
  /// **'Failed to delete chat room'**
  String get chatRoomDeleteFailure;

  /// BLoC message: Chat room added successfully
  ///
  /// In en, this message translates to:
  /// **'Chat room added successfully'**
  String get chatRoomAddSuccess;

  /// BLoC message: Failed to add chat room
  ///
  /// In en, this message translates to:
  /// **'Failed to add chat room'**
  String get chatRoomAddFailure;

  /// BLoC message: Failed to fetch chat rooms
  ///
  /// In en, this message translates to:
  /// **'Failed to fetch chat rooms'**
  String get chatRoomFetchFailure;

  /// BLoC message: Message sent successfully
  ///
  /// In en, this message translates to:
  /// **'Message sent successfully'**
  String get chatMessageSendSuccess;

  /// BLoC message: Failed to send message
  ///
  /// In en, this message translates to:
  /// **'Failed to send message'**
  String get chatMessageSendFailure;

  /// BLoC message: Message deleted successfully
  ///
  /// In en, this message translates to:
  /// **'Message deleted successfully'**
  String get chatMessageDeleteSuccess;

  /// BLoC message: Failed to delete message
  ///
  /// In en, this message translates to:
  /// **'Failed to delete message'**
  String get chatMessageDeleteFailure;

  /// BLoC message: Failed to fetch messages
  ///
  /// In en, this message translates to:
  /// **'Failed to fetch messages'**
  String get chatMessageFetchFailure;
}

class _ChatLocalizationsDelegate
    extends LocalizationsDelegate<ChatLocalizations> {
  const _ChatLocalizationsDelegate();

  @override
  Future<ChatLocalizations> load(Locale locale) {
    return SynchronousFuture<ChatLocalizations>(
      lookupChatLocalizations(locale),
    );
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'de',
    'en',
    'fr',
    'nl',
    'th',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_ChatLocalizationsDelegate old) => false;
}

ChatLocalizations lookupChatLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return ChatLocalizationsDe();
    case 'en':
      return ChatLocalizationsEn();
    case 'fr':
      return ChatLocalizationsFr();
    case 'nl':
      return ChatLocalizationsNl();
    case 'th':
      return ChatLocalizationsTh();
    case 'zh':
      return ChatLocalizationsZh();
  }

  throw FlutterError(
    'ChatLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
