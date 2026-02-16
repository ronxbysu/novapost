// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'catalog_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class CatalogLocalizationsDe extends CatalogLocalizations {
  CatalogLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get category => 'Kategorie';

  @override
  String get categoryList => 'Kategorieliste';

  @override
  String get products => 'Produkte';

  @override
  String get productList => 'Produktliste';

  @override
  String get subscriptions => 'Abonnements';

  @override
  String get subscriptionList => 'Abonnementliste';

  @override
  String categoryNumber(String number) {
    return 'Kategorie #$number';
  }

  @override
  String get newItem => 'Neu';

  @override
  String pickImageError(String error) {
    return 'Bildauswahlfehler: $error';
  }

  @override
  String get selectProducts => 'Wählen Sie ein oder mehrere Produkte aus';

  @override
  String get categoryId => 'Kategorie-ID';

  @override
  String get categoryName => 'Kategoriename';

  @override
  String get enterCategoryName => 'Bitte geben Sie einen Kategorienamen ein.';

  @override
  String get description => 'Beschreibung';

  @override
  String get enterCategoryDescription =>
      'Bitte geben Sie eine Kategoriebeschreibung ein.';

  @override
  String get relatedProducts => 'Verwandte Produkte';

  @override
  String totalShown(int total, int shown) {
    return ' gesamt: $total, zuerst angezeigt $shown';
  }

  @override
  String get create => 'Erstellen';

  @override
  String get update => 'Aktualisieren';

  @override
  String get imageUploadError => 'Fehler beim Hochladen des Bildes!';

  @override
  String get categoryFiles => 'Kategorie Hoch-/Herunterladen';

  @override
  String get downloadFormat =>
      'Laden Sie zuerst herunter, um das Format zu erhalten';

  @override
  String get uploadCsv => 'CSV-Datei hochladen';

  @override
  String get downloadEmail => 'Per E-Mail herunterladen';

  @override
  String get emailData => 'Eine Datendatei wird per E-Mail gesendet';

  @override
  String get noCategories =>
      'Noch keine Kategorien, fügen Sie eine mit \'+\' hinzu';

  @override
  String fetchCategoriesError(String error) {
    return 'Kategorien konnten nicht abgerufen werden: $error';
  }

  @override
  String get categoryUpDown => 'Kategorie hoch/runterladen';

  @override
  String get addNew => 'Neu hinzufügen';

  @override
  String fetchSearchError(String error) {
    return 'Suchelemente konnten nicht abgerufen werden: $error';
  }

  @override
  String get categorySearch => 'Kategoriesuche';

  @override
  String get searchInput => 'Sucheingabe';

  @override
  String get enterSearch => 'Bitte geben Sie einen Suchwert ein.';

  @override
  String get searchResults => 'Suchergebnisse';

  @override
  String get noSearchItems => 'Keine Suchelemente gefunden (bisher)';

  @override
  String id(String id) {
    return 'ID: $id';
  }

  @override
  String name(String name) {
    return 'Name: $name';
  }

  @override
  String productNumber(String number) {
    return 'Produkt #$number';
  }

  @override
  String roomTypeNumber(String number) {
    return 'Zimmertyp #$number';
  }

  @override
  String get rental => 'Vermietung';

  @override
  String get selectCategories => 'Wählen Sie eine oder mehrere Kategorien aus';

  @override
  String get productId => 'Produkt-ID';

  @override
  String get roomTypeId => 'Zimmertyp-ID';

  @override
  String get productType => 'Produkttyp';

  @override
  String get productName => 'Produktname';

  @override
  String get roomTypeName => 'Name des Zimmertyps';

  @override
  String get prices => 'Preise';

  @override
  String listPrice(String symbol) {
    return 'Listenpreis($symbol)';
  }

  @override
  String currentPrice(String symbol) {
    return 'Aktueller Preis($symbol)';
  }

  @override
  String get currency => 'Währung';

  @override
  String get currencyRequired => 'Währungsfeld erforderlich!';

  @override
  String get relatedCategories => 'Verwandte Kategorien';

  @override
  String get warehouseInventory => 'Lager/Inventar';

  @override
  String get useWarehouse => 'Lager nutzen?';

  @override
  String get assetsInWarehouse => 'Vermögenswerte im Lager';

  @override
  String get typeAmount => 'Typ/Menge';

  @override
  String get uomType => 'ME-Typ';

  @override
  String get uom => 'Maßeinheit';

  @override
  String get uomRequired => 'Bitte wählen Sie eine Maßeinheit aus';

  @override
  String get amountQuantity => 'Menge/Quantität';

  @override
  String get hotelRoom => 'Hotelzimmer';

  @override
  String get inventoryFin => 'AsClsInventoryFin';

  @override
  String get productFiles => 'Produkt Hoch-/Herunterladen';

  @override
  String noProducts(String entityName) {
    return 'Keine ${entityName}s gefunden, fügen Sie eine mit \'+\' hinzu';
  }

  @override
  String fetchProductError(String error) {
    return 'Produkt konnte nicht abgerufen werden: $error';
  }

  @override
  String get productUpDown => 'Produkte hoch/runterladen';

  @override
  String get productSearch => 'Produktsuche';

  @override
  String get subscriptionSearch => 'Abonnementsuche';

  @override
  String subscriber(String name) {
    return 'Abonnent: $name';
  }

  @override
  String subscriptionNumber(String number) {
    return 'Abonnement #$number';
  }

  @override
  String get question => '????';

  @override
  String get subscriberName => 'Abonnent,Name';

  @override
  String get selectSubscriber => 'Abonnent auswählen';

  @override
  String get subscriberLabel => 'Abonnent';

  @override
  String get subscriberRequired => 'Bitte wählen Sie einen Abonnenten aus';

  @override
  String purchased(String date) {
    return 'Gekauft: $date';
  }

  @override
  String cancelled(String date) {
    return 'Storniert: $date';
  }

  @override
  String get fromDate => 'Ab Datum';

  @override
  String get thruDate => 'Bis Datum';

  @override
  String get searchProducts => 'Produkte suchen...';

  @override
  String get selectProduct => 'Produkt auswählen';

  @override
  String get product => 'Produkt';

  @override
  String get productRequired => 'Bitte wählen Sie ein Produkt aus';

  @override
  String noSubscriptions(String entityName) {
    return 'Keine ${entityName}s gefunden, fügen Sie eine mit \'+\' hinzu';
  }

  @override
  String fetchSubscriptionError(String error) {
    return 'Abonnement konnte nicht abgerufen werden: $error';
  }

  @override
  String error(String message) {
    return 'Fehler: $message';
  }

  @override
  String errorGettingProducts(String message) {
    return 'Fehler beim Abrufen von Produkten: $message';
  }

  @override
  String idLabel(String id, String name) {
    return 'ID: $id\nName: $name';
  }

  @override
  String get categoryFetchFailure =>
      'Kategorien konnten nicht abgerufen werden';

  @override
  String get productUpdateFailure => 'Produkt konnte nicht aktualisiert werden';

  @override
  String get subscriptionAddSuccess => 'Abonnement erfolgreich hinzugefügt';

  @override
  String productAddSuccess(String name) {
    return 'Produkt $name erfolgreich hinzugefügt';
  }

  @override
  String get subscriptionFetchFailure =>
      'Abonnements konnten nicht abgerufen werden';

  @override
  String get productUploadSuccess => 'Produkte erfolgreich hochgeladen';

  @override
  String get categoryUploadFailure => 'Hochladen der Kategorien fehlgeschlagen';

  @override
  String categoryAddSuccess(String name) {
    return 'Kategorie $name erfolgreich hinzugefügt';
  }

  @override
  String get categoryUploadSuccess => 'Kategorien erfolgreich hochgeladen';

  @override
  String categoryDeleteSuccess(String name) {
    return 'Kategorie $name erfolgreich gelöscht';
  }

  @override
  String get productDownloadSuccess =>
      'Produkt-Download geplant, E-Mail wird in Kürze gesendet';

  @override
  String get subscriptionDeleteSuccess => 'Abonnement erfolgreich gelöscht';

  @override
  String get productDeleteFailure => 'Produkt konnte nicht gelöscht werden';

  @override
  String get subscriptionAddFailure =>
      'Abonnement konnte nicht hinzugefügt werden';

  @override
  String get categoryDownloadSuccess =>
      'Kategorie-Download geplant, E-Mail wird in Kürze gesendet';

  @override
  String productUpdateSuccess(String name) {
    return 'Produkt $name erfolgreich aktualisiert';
  }

  @override
  String get subscriptionDeleteFailure =>
      'Abonnement konnte nicht gelöscht werden';

  @override
  String get productFetchFailure => 'Produkte konnten nicht abgerufen werden';

  @override
  String categoryUpdateSuccess(String name) {
    return 'Kategorie $name erfolgreich aktualisiert';
  }

  @override
  String productDeleteSuccess(String name) {
    return 'Produkt $name erfolgreich gelöscht';
  }

  @override
  String get categoryUpdateFailure =>
      'Kategorie konnte nicht aktualisiert werden';

  @override
  String get subscriptionUpdateFailure =>
      'Abonnement konnte nicht aktualisiert werden';

  @override
  String get productDownloadFailure =>
      'Herunterladen der Produkte fehlgeschlagen';

  @override
  String get categoryDownloadFailure =>
      'Herunterladen der Kategorien fehlgeschlagen';

  @override
  String get productAddFailure => 'Produkt konnte nicht hinzugefügt werden';

  @override
  String get categoryAddFailure => 'Kategorie konnte nicht hinzugefügt werden';

  @override
  String get subscriptionUpdateSuccess => 'Abonnement erfolgreich aktualisiert';

  @override
  String get productUploadFailure => 'Hochladen der Produkte fehlgeschlagen';

  @override
  String get categoryDeleteFailure => 'Kategorie konnte nicht gelöscht werden';
}
