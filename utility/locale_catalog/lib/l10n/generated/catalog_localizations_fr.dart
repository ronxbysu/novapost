// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'catalog_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class CatalogLocalizationsFr extends CatalogLocalizations {
  CatalogLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get category => 'Catégorie';

  @override
  String get categoryList => 'Liste des catégories';

  @override
  String get products => 'Produits';

  @override
  String get productList => 'Liste des produits';

  @override
  String get subscriptions => 'Abonnements';

  @override
  String get subscriptionList => 'Liste des abonnements';

  @override
  String categoryNumber(String number) {
    return 'Catégorie #$number';
  }

  @override
  String get newItem => 'Nouveau';

  @override
  String pickImageError(String error) {
    return 'Erreur de sélection d\'image : $error';
  }

  @override
  String get selectProducts => 'Sélectionnez un ou plusieurs produits';

  @override
  String get categoryId => 'ID de catégorie';

  @override
  String get categoryName => 'Nom de la catégorie';

  @override
  String get enterCategoryName => 'Veuillez saisir un nom de catégorie ?';

  @override
  String get description => 'Description';

  @override
  String get enterCategoryDescription =>
      'Veuillez saisir une description de catégorie ?';

  @override
  String get relatedProducts => 'Produits associés';

  @override
  String totalShown(int total, int shown) {
    return ' total : $total, affichés en premier $shown';
  }

  @override
  String get create => 'Créer';

  @override
  String get update => 'Mettre à jour';

  @override
  String get imageUploadError => 'Erreur de téléchargement de l\'image !';

  @override
  String get categoryFiles => 'Téléchargement/téléchargement de catégories';

  @override
  String get downloadFormat => 'Téléchargez d\'abord pour obtenir le format';

  @override
  String get uploadCsv => 'Télécharger un fichier CSV';

  @override
  String get downloadEmail => 'Télécharger par e-mail';

  @override
  String get emailData => 'Un fichier de données sera envoyé par e-mail';

  @override
  String get noCategories =>
      'Aucune catégorie pour le moment, ajoutez-en une avec \'+\'';

  @override
  String fetchCategoriesError(String error) {
    return 'échec de la récupération des catégories : $error';
  }

  @override
  String get categoryUpDown => 'téléchargement/téléchargement de catégories';

  @override
  String get addNew => 'Ajouter nouveau';

  @override
  String fetchSearchError(String error) {
    return 'échec de la récupération des éléments de recherche : $error';
  }

  @override
  String get categorySearch => 'Recherche de catégories';

  @override
  String get searchInput => 'Saisie de recherche';

  @override
  String get enterSearch => 'Veuillez saisir une valeur de recherche ?';

  @override
  String get searchResults => 'Résultats de la recherche';

  @override
  String get noSearchItems =>
      'Aucun élément de recherche trouvé (pour l\'instant)';

  @override
  String id(String id) {
    return 'ID : $id';
  }

  @override
  String name(String name) {
    return 'Nom : $name';
  }

  @override
  String productNumber(String number) {
    return 'Produit #$number';
  }

  @override
  String roomTypeNumber(String number) {
    return 'Type de chambre #$number';
  }

  @override
  String get rental => 'Location';

  @override
  String get selectCategories => 'Sélectionnez une ou plusieurs catégories';

  @override
  String get productId => 'ID de produit';

  @override
  String get roomTypeId => 'ID de type de chambre';

  @override
  String get productType => 'Type de produit';

  @override
  String get productName => 'Nom du produit';

  @override
  String get roomTypeName => 'Nom du type de chambre';

  @override
  String get prices => 'Prix';

  @override
  String listPrice(String symbol) {
    return 'Prix de liste ($symbol)';
  }

  @override
  String currentPrice(String symbol) {
    return 'Prix actuel ($symbol)';
  }

  @override
  String get currency => 'Devise';

  @override
  String get currencyRequired => 'Champ de devise obligatoire !';

  @override
  String get relatedCategories => 'Catégories associées';

  @override
  String get warehouseInventory => 'Entrepôt/Inventaire';

  @override
  String get useWarehouse => 'Utiliser l\'entrepôt ?';

  @override
  String get assetsInWarehouse => 'Actifs en entrepôt';

  @override
  String get typeAmount => 'Type/Montant';

  @override
  String get uomType => 'Type d\'UdM';

  @override
  String get uom => 'Unité de mesure';

  @override
  String get uomRequired => 'Veuillez sélectionner une unité de mesure';

  @override
  String get amountQuantity => 'Montant/Quantité';

  @override
  String get hotelRoom => 'Chambre d\'hôtel';

  @override
  String get inventoryFin => 'AsClsInventoryFin';

  @override
  String get productFiles => 'Téléchargement/téléchargement de produits';

  @override
  String noProducts(String entityName) {
    return 'Aucun $entityName trouvé, ajoutez-en un avec \'+\'';
  }

  @override
  String fetchProductError(String error) {
    return 'échec de la récupération du produit : $error';
  }

  @override
  String get productUpDown => 'téléchargement/téléchargement de produits';

  @override
  String get productSearch => 'Recherche de produits';

  @override
  String get subscriptionSearch => 'Recherche d\'abonnements';

  @override
  String subscriber(String name) {
    return 'Abonné : $name';
  }

  @override
  String subscriptionNumber(String number) {
    return 'Abonnement #$number';
  }

  @override
  String get question => '????';

  @override
  String get subscriberName => 'abonné,nom';

  @override
  String get selectSubscriber => 'Sélectionner un abonné';

  @override
  String get subscriberLabel => 'Abonné';

  @override
  String get subscriberRequired => 'Veuillez sélectionner un abonné';

  @override
  String purchased(String date) {
    return 'Acheté le : $date';
  }

  @override
  String cancelled(String date) {
    return 'Annulé le : $date';
  }

  @override
  String get fromDate => 'Date de début';

  @override
  String get thruDate => 'Date de fin';

  @override
  String get searchProducts => 'Rechercher des produits...';

  @override
  String get selectProduct => 'Sélectionner un produit';

  @override
  String get product => 'Produit';

  @override
  String get productRequired => 'Veuillez sélectionner un produit';

  @override
  String noSubscriptions(String entityName) {
    return 'Aucun $entityName trouvé, ajoutez-en un avec \'+\'';
  }

  @override
  String fetchSubscriptionError(String error) {
    return 'échec de la récupération de l\'abonnement : $error';
  }

  @override
  String error(String message) {
    return 'Erreur : $message';
  }

  @override
  String errorGettingProducts(String message) {
    return 'Erreur lors de l\'obtention des produits : $message';
  }

  @override
  String idLabel(String id, String name) {
    return 'ID : $id\nNom : $name';
  }

  @override
  String get categoryFetchFailure => 'Échec de la récupération des catégories';

  @override
  String get productUpdateFailure => 'Échec de la mise à jour du produit';

  @override
  String get subscriptionAddSuccess => 'Abonnement ajouté avec succès';

  @override
  String productAddSuccess(String name) {
    return 'Produit $name ajouté avec succès';
  }

  @override
  String get subscriptionFetchFailure =>
      'Échec de la récupération des abonnements';

  @override
  String get productUploadSuccess => 'Produits téléchargés avec succès';

  @override
  String get categoryUploadFailure => 'Échec du téléchargement des catégories';

  @override
  String categoryAddSuccess(String name) {
    return 'Catégorie $name ajoutée avec succès';
  }

  @override
  String get categoryUploadSuccess => 'Catégories téléchargées avec succès';

  @override
  String categoryDeleteSuccess(String name) {
    return 'Catégorie $name supprimée avec succès';
  }

  @override
  String get productDownloadSuccess =>
      'Téléchargement de produit programmé, l\'email sera envoyé sous peu';

  @override
  String get subscriptionDeleteSuccess => 'Abonnement supprimé avec succès';

  @override
  String get productDeleteFailure => 'Échec de la suppression du produit';

  @override
  String get subscriptionAddFailure => 'Échec de l\'ajout de l\'abonnement';

  @override
  String get categoryDownloadSuccess =>
      'Téléchargement de catégorie programmé, l\'email sera envoyé sous peu';

  @override
  String productUpdateSuccess(String name) {
    return 'Produit $name mis à jour avec succès';
  }

  @override
  String get subscriptionDeleteFailure =>
      'Échec de la suppression de l\'abonnement';

  @override
  String get productFetchFailure => 'Échec de la récupération des produits';

  @override
  String categoryUpdateSuccess(String name) {
    return 'Catégorie $name mise à jour avec succès';
  }

  @override
  String productDeleteSuccess(String name) {
    return 'Produit $name supprimé avec succès';
  }

  @override
  String get categoryUpdateFailure => 'Échec de la mise à jour de la catégorie';

  @override
  String get subscriptionUpdateFailure =>
      'Échec de la mise à jour de l\'abonnement';

  @override
  String get productDownloadFailure => 'Échec du téléchargement des produits';

  @override
  String get categoryDownloadFailure =>
      'Échec du téléchargement des catégories';

  @override
  String get productAddFailure => 'Échec de l\'ajout du produit';

  @override
  String get categoryAddFailure => 'Échec de l\'ajout de la catégorie';

  @override
  String get subscriptionUpdateSuccess => 'Abonnement mis à jour avec succès';

  @override
  String get productUploadFailure => 'Échec du téléchargement des produits';

  @override
  String get categoryDeleteFailure => 'Échec de la suppression de la catégorie';
}
