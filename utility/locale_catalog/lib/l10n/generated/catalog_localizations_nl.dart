// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'catalog_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class CatalogLocalizationsNl extends CatalogLocalizations {
  CatalogLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get category => 'Categorie';

  @override
  String get categoryList => 'Categorielijst';

  @override
  String get products => 'Producten';

  @override
  String get productList => 'Productlijst';

  @override
  String get subscriptions => 'Abonnementen';

  @override
  String get subscriptionList => 'Abonnementenlijst';

  @override
  String categoryNumber(String number) {
    return 'Categorie #$number';
  }

  @override
  String get newItem => 'Nieuw';

  @override
  String pickImageError(String error) {
    return 'Fout bij het kiezen van een afbeelding: $error';
  }

  @override
  String get selectProducts => 'Selecteer een of meer producten';

  @override
  String get categoryId => 'Categorie-ID';

  @override
  String get categoryName => 'Categorienaam';

  @override
  String get enterCategoryName => 'Voer een categorienaam in';

  @override
  String get description => 'Omschrijving';

  @override
  String get enterCategoryDescription => 'Voer een categorieomschrijving in';

  @override
  String get relatedProducts => 'Gerelateerde producten';

  @override
  String totalShown(int total, int shown) {
    return ' totaal: $total, getoond eerste $shown';
  }

  @override
  String get create => 'Creëer';

  @override
  String get update => 'Update';

  @override
  String get imageUploadError => 'Fout bij het uploaden van de afbeelding!';

  @override
  String get categoryFiles => 'Categorie Up/Download';

  @override
  String get downloadFormat => 'Download eerst om het formaat te verkrijgen';

  @override
  String get uploadCsv => 'CSV-bestand uploaden';

  @override
  String get downloadEmail => 'Downloaden via e-mail';

  @override
  String get emailData => 'Een databestand wordt per e-mail verzonden';

  @override
  String get noCategories => 'Nog geen categorieën, voeg er een toe met \'+\'';

  @override
  String fetchCategoriesError(String error) {
    return 'ophalen van categorieën mislukt: $error';
  }

  @override
  String get categoryUpDown => 'categorie up/download';

  @override
  String get addNew => 'Nieuwe toevoegen';

  @override
  String fetchSearchError(String error) {
    return 'ophalen van zoekitems mislukt: $error';
  }

  @override
  String get categorySearch => 'Categorie zoeken';

  @override
  String get searchInput => 'Zoekinvoer';

  @override
  String get enterSearch => 'Voer een zoekwaarde in';

  @override
  String get searchResults => 'Zoekresultaten';

  @override
  String get noSearchItems => 'Geen zoekitems gevonden (nog)';

  @override
  String id(String id) {
    return 'ID: $id';
  }

  @override
  String name(String name) {
    return 'Naam: $name';
  }

  @override
  String productNumber(String number) {
    return 'Product #$number';
  }

  @override
  String roomTypeNumber(String number) {
    return 'Kamertype #$number';
  }

  @override
  String get rental => 'Verhuur';

  @override
  String get selectCategories => 'Selecteer een of meer categorieën';

  @override
  String get productId => 'Product-ID';

  @override
  String get roomTypeId => 'Kamertype-ID';

  @override
  String get productType => 'Producttype';

  @override
  String get productName => 'Productnaam';

  @override
  String get roomTypeName => 'Naam kamertype';

  @override
  String get prices => 'Prijzen';

  @override
  String listPrice(String symbol) {
    return 'Lijstprijs($symbol)';
  }

  @override
  String currentPrice(String symbol) {
    return 'Huidige prijs($symbol)';
  }

  @override
  String get currency => 'Valuta';

  @override
  String get currencyRequired => 'Valutaveld vereist!';

  @override
  String get relatedCategories => 'Gerelateerde categorieën';

  @override
  String get warehouseInventory => 'Magazijn/Inventaris';

  @override
  String get useWarehouse => 'Magazijn gebruiken?';

  @override
  String get assetsInWarehouse => 'Activa in magazijn';

  @override
  String get typeAmount => 'Type/Bedrag';

  @override
  String get uomType => 'EVM-type';

  @override
  String get uom => 'Eenheid van maat';

  @override
  String get uomRequired => 'Selecteer een meeteenheid';

  @override
  String get amountQuantity => 'Bedrag/Hoeveelheid';

  @override
  String get hotelRoom => 'Hotelkamer';

  @override
  String get inventoryFin => 'AsClsInventoryFin';

  @override
  String get productFiles => 'Product Up/Download';

  @override
  String noProducts(String entityName) {
    return 'Geen ${entityName}s gevonden, voeg er een toe met \'+\'';
  }

  @override
  String fetchProductError(String error) {
    return 'ophalen van product mislukt: $error';
  }

  @override
  String get productUpDown => 'producten up/download';

  @override
  String get productSearch => 'Product zoeken';

  @override
  String get subscriptionSearch => 'Abonnement zoeken';

  @override
  String subscriber(String name) {
    return 'Abonnee: $name';
  }

  @override
  String subscriptionNumber(String number) {
    return 'Abonnement #$number';
  }

  @override
  String get question => '????';

  @override
  String get subscriberName => 'abonnee,naam';

  @override
  String get selectSubscriber => 'Selecteer abonnee';

  @override
  String get subscriberLabel => 'Abonnee';

  @override
  String get subscriberRequired => 'Selecteer een abonnee';

  @override
  String purchased(String date) {
    return 'Gekocht: $date';
  }

  @override
  String cancelled(String date) {
    return 'Geannuleerd: $date';
  }

  @override
  String get fromDate => 'Vanaf datum';

  @override
  String get thruDate => 'Tot datum';

  @override
  String get searchProducts => 'Producten zoeken...';

  @override
  String get selectProduct => 'Selecteer product';

  @override
  String get product => 'Product';

  @override
  String get productRequired => 'Selecteer een product';

  @override
  String noSubscriptions(String entityName) {
    return 'Geen ${entityName}s gevonden, voeg er een toe met \'+\'';
  }

  @override
  String fetchSubscriptionError(String error) {
    return 'ophalen van abonnement mislukt: $error';
  }

  @override
  String error(String message) {
    return 'Fout: $message';
  }

  @override
  String errorGettingProducts(String message) {
    return 'Fout bij het ophalen van producten: $message';
  }

  @override
  String idLabel(String id, String name) {
    return 'ID: $id\nNaam: $name';
  }

  @override
  String get categoryFetchFailure => 'Ophalen van categorieën mislukt';

  @override
  String get productUpdateFailure => 'Bijwerken van product mislukt';

  @override
  String get subscriptionAddSuccess => 'Abonnement succesvol toegevoegd';

  @override
  String productAddSuccess(String name) {
    return 'Product $name succesvol toegevoegd';
  }

  @override
  String get subscriptionFetchFailure => 'Ophalen van abonnementen mislukt';

  @override
  String get productUploadSuccess => 'Producten succesvol geüpload';

  @override
  String get categoryUploadFailure => 'Uploaden van categorieën mislukt';

  @override
  String categoryAddSuccess(String name) {
    return 'Categorie $name succesvol toegevoegd';
  }

  @override
  String get categoryUploadSuccess => 'Categorieën succesvol geüpload';

  @override
  String categoryDeleteSuccess(String name) {
    return 'Categorie $name succesvol verwijderd';
  }

  @override
  String get productDownloadSuccess =>
      'Productdownload gepland, e-mail wordt binnenkort verzonden';

  @override
  String get subscriptionDeleteSuccess => 'Abonnement succesvol verwijderd';

  @override
  String get productDeleteFailure => 'Verwijderen van product mislukt';

  @override
  String get subscriptionAddFailure => 'Toevoegen van abonnement mislukt';

  @override
  String get categoryDownloadSuccess =>
      'Categoriedownload gepland, e-mail wordt binnenkort verzonden';

  @override
  String productUpdateSuccess(String name) {
    return 'Product $name succesvol bijgewerkt';
  }

  @override
  String get subscriptionDeleteFailure => 'Verwijderen van abonnement mislukt';

  @override
  String get productFetchFailure => 'Ophalen van producten mislukt';

  @override
  String categoryUpdateSuccess(String name) {
    return 'Categorie $name succesvol bijgewerkt';
  }

  @override
  String productDeleteSuccess(String name) {
    return 'Product $name succesvol verwijderd';
  }

  @override
  String get categoryUpdateFailure => 'Bijwerken van categorie mislukt';

  @override
  String get subscriptionUpdateFailure => 'Bijwerken van abonnement mislukt';

  @override
  String get productDownloadFailure => 'Downloaden van producten mislukt';

  @override
  String get categoryDownloadFailure => 'Downloaden van categorieën mislukt';

  @override
  String get productAddFailure => 'Toevoegen van product mislukt';

  @override
  String get categoryAddFailure => 'Toevoegen van categorie mislukt';

  @override
  String get subscriptionUpdateSuccess => 'Abonnement succesvol bijgewerkt';

  @override
  String get productUploadFailure => 'Uploaden van producten mislukt';

  @override
  String get categoryDeleteFailure => 'Verwijderen van categorie mislukt';
}
