// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'chat_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class ChatLocalizationsNl extends ChatLocalizations {
  ChatLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get chatNotActive => 'Chat niet actief!';

  @override
  String get messageText => 'Berichttekst..';

  @override
  String get send => 'Versturen';

  @override
  String get addPartner => 'Partner toevoegen';

  @override
  String get chat => 'Chat #';

  @override
  String get newChat => 'Nieuw';

  @override
  String get selectChatPartner => 'Selecteer chatpartner';

  @override
  String get chatPartner => 'Chatpartner';

  @override
  String get fieldRequired => 'Veld vereist';

  @override
  String get create => 'Creëer';

  @override
  String get update => 'Update';

  @override
  String get room => 'Kamer';

  @override
  String get chatRoom => 'ChatKamer';

  @override
  String get chatUsersAndGroups => 'Chatgebruikers en -groepen';

  @override
  String get addNew => 'Nieuwe toevoegen';

  @override
  String get no => 'geen ';

  @override
  String get sFound => 's gevonden!';

  @override
  String get searchInName => 'zoek in naam ..';

  @override
  String get search => 'Zoeken';

  @override
  String get name => 'Naam';

  @override
  String get status => 'Status';

  @override
  String get pvt => 'Pvt.';

  @override
  String get nroMembers => '#Leden.';

  @override
  String get allMessagesRead => 'Alle berichten gelezen';

  @override
  String get unreadMessages => 'onbekende berichten';

  @override
  String get chatRoomUpdateSuccess => 'Chatruimte succesvol bijgewerkt';

  @override
  String get chatRoomUpdateFailure => 'Bijwerken van chatruimte mislukt';

  @override
  String get chatRoomDeleteSuccess => 'Chatruimte succesvol verwijderd';

  @override
  String get chatRoomDeleteFailure => 'Verwijderen van chatruimte mislukt';

  @override
  String get chatRoomAddSuccess => 'Chatruimte succesvol toegevoegd';

  @override
  String get chatRoomAddFailure => 'Toevoegen van chatruimte mislukt';

  @override
  String get chatRoomFetchFailure => 'Ophalen van chatruimtes mislukt';

  @override
  String get chatMessageSendSuccess => 'Bericht succesvol verzonden';

  @override
  String get chatMessageSendFailure => 'Verzenden van bericht mislukt';

  @override
  String get chatMessageDeleteSuccess => 'Bericht succesvol verwijderd';

  @override
  String get chatMessageDeleteFailure => 'Verwijderen van bericht mislukt';

  @override
  String get chatMessageFetchFailure => 'Ophalen van berichten mislukt';
}
