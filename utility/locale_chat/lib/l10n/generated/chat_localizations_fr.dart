// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'chat_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class ChatLocalizationsFr extends ChatLocalizations {
  ChatLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get chatNotActive => 'Chat non actif !';

  @override
  String get messageText => 'Texte du message..';

  @override
  String get send => 'Envoyer';

  @override
  String get addPartner => 'Ajouter un partenaire';

  @override
  String get chat => 'Chat #';

  @override
  String get newChat => 'Nouveau';

  @override
  String get selectChatPartner => 'Sélectionnez un partenaire de chat';

  @override
  String get chatPartner => 'Partenaire de chat';

  @override
  String get fieldRequired => 'Champ obligatoire';

  @override
  String get create => 'Créer';

  @override
  String get update => 'Mettre à jour';

  @override
  String get room => 'Salle';

  @override
  String get chatRoom => 'Salle de chat';

  @override
  String get chatUsersAndGroups => 'Utilisateurs et groupes de chat';

  @override
  String get addNew => 'Ajouter nouveau';

  @override
  String get no => 'aucun ';

  @override
  String get sFound => 's trouvé(s) !';

  @override
  String get searchInName => 'rechercher dans le nom ..';

  @override
  String get search => 'Rechercher';

  @override
  String get name => 'Nom';

  @override
  String get status => 'Statut';

  @override
  String get pvt => 'Privé';

  @override
  String get nroMembers => '#Memb.';

  @override
  String get allMessagesRead => 'Tous les messages lus';

  @override
  String get unreadMessages => 'messages non lus';

  @override
  String get chatRoomUpdateSuccess => 'Salle de chat mise à jour avec succès';

  @override
  String get chatRoomUpdateFailure =>
      'Échec de la mise à jour de la salle de chat';

  @override
  String get chatRoomDeleteSuccess => 'Salle de chat supprimée avec succès';

  @override
  String get chatRoomDeleteFailure =>
      'Échec de la suppression de la salle de chat';

  @override
  String get chatRoomAddSuccess => 'Salle de chat ajoutée avec succès';

  @override
  String get chatRoomAddFailure => 'Échec de l\'ajout de la salle de chat';

  @override
  String get chatRoomFetchFailure =>
      'Échec de la récupération des salles de chat';

  @override
  String get chatMessageSendSuccess => 'Message envoyé avec succès';

  @override
  String get chatMessageSendFailure => 'Échec de l\'envoi du message';

  @override
  String get chatMessageDeleteSuccess => 'Message supprimé avec succès';

  @override
  String get chatMessageDeleteFailure => 'Échec de la suppression du message';

  @override
  String get chatMessageFetchFailure => 'Échec de la récupération des messages';
}
