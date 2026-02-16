// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'catalog_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class CatalogLocalizationsEn extends CatalogLocalizations {
  CatalogLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get category => 'Category';

  @override
  String get categoryList => 'Category List';

  @override
  String get products => 'Products';

  @override
  String get productList => 'Product List';

  @override
  String get subscriptions => 'Subscriptions';

  @override
  String get subscriptionList => 'Subscription List';

  @override
  String categoryNumber(String number) {
    return 'Category #$number';
  }

  @override
  String get newItem => 'New';

  @override
  String pickImageError(String error) {
    return 'Pick image error: $error';
  }

  @override
  String get selectProducts => 'Select one or more products';

  @override
  String get categoryId => 'Category Id';

  @override
  String get categoryName => 'Category Name';

  @override
  String get enterCategoryName => 'Please enter a category name?';

  @override
  String get description => 'Description';

  @override
  String get enterCategoryDescription => 'Please enter a category description?';

  @override
  String get relatedProducts => 'Related Products';

  @override
  String totalShown(int total, int shown) {
    return ' total: $total, shown first $shown';
  }

  @override
  String get create => 'Create';

  @override
  String get update => 'Update';

  @override
  String get imageUploadError => 'Image upload error!';

  @override
  String get categoryFiles => 'Category Up/Download';

  @override
  String get downloadFormat => 'Download first to obtain the format';

  @override
  String get uploadCsv => 'Upload CSV file';

  @override
  String get downloadEmail => 'Download via email';

  @override
  String get emailData => 'A data file will be send by email';

  @override
  String get noCategories => 'No categories yet, add one with \'+\'';

  @override
  String fetchCategoriesError(String error) {
    return 'failed to fetch categories: $error';
  }

  @override
  String get categoryUpDown => 'category up/download';

  @override
  String get addNew => 'Add New';

  @override
  String fetchSearchError(String error) {
    return 'failed to fetch search items: $error';
  }

  @override
  String get categorySearch => 'Category Search';

  @override
  String get searchInput => 'Search input';

  @override
  String get enterSearch => 'Please enter a search value?';

  @override
  String get searchResults => 'Search results';

  @override
  String get noSearchItems => 'No search items found (yet)';

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
    return 'Product #$number';
  }

  @override
  String roomTypeNumber(String number) {
    return 'Room Type #$number';
  }

  @override
  String get rental => 'Rental';

  @override
  String get selectCategories => 'Select one or more categories';

  @override
  String get productId => 'Product Id';

  @override
  String get roomTypeId => 'Room Type Id';

  @override
  String get productType => 'Product Type';

  @override
  String get productName => 'Product Name';

  @override
  String get roomTypeName => 'Room Type Name';

  @override
  String get prices => 'Prices';

  @override
  String listPrice(String symbol) {
    return 'List Price($symbol)';
  }

  @override
  String currentPrice(String symbol) {
    return 'Current Price($symbol)';
  }

  @override
  String get currency => 'Currency';

  @override
  String get currencyRequired => 'Currency field required!';

  @override
  String get relatedCategories => 'Related categories';

  @override
  String get warehouseInventory => 'Warehouse/Inventory';

  @override
  String get useWarehouse => 'Use Warehouse?';

  @override
  String get assetsInWarehouse => 'Assets in warehouse';

  @override
  String get typeAmount => 'Type/Amount';

  @override
  String get uomType => 'UOM Type';

  @override
  String get uom => 'Unit of Measure';

  @override
  String get uomRequired => 'Please select a unit of measure';

  @override
  String get amountQuantity => 'Amount/Quantity';

  @override
  String get hotelRoom => 'Hotel Room';

  @override
  String get inventoryFin => 'AsClsInventoryFin';

  @override
  String get productFiles => 'Product Up/Download';

  @override
  String noProducts(String entityName) {
    return 'No ${entityName}s found, add one with \'+\'';
  }

  @override
  String fetchProductError(String error) {
    return 'failed to fetch product: $error';
  }

  @override
  String get productUpDown => 'products up/download';

  @override
  String get productSearch => 'Product Search';

  @override
  String get subscriptionSearch => 'Subscription Search';

  @override
  String subscriber(String name) {
    return 'Subscriber: $name';
  }

  @override
  String subscriptionNumber(String number) {
    return 'Subscription #$number';
  }

  @override
  String get question => '????';

  @override
  String get subscriberName => 'subscriber,name';

  @override
  String get selectSubscriber => 'Select Subscriber';

  @override
  String get subscriberLabel => 'Subscriber';

  @override
  String get subscriberRequired => 'Please select a subscriber';

  @override
  String purchased(String date) {
    return 'Purchased: $date';
  }

  @override
  String cancelled(String date) {
    return 'Cancelled: $date';
  }

  @override
  String get fromDate => 'From Date';

  @override
  String get thruDate => 'Thru Date';

  @override
  String get searchProducts => 'Search products...';

  @override
  String get selectProduct => 'Select Product';

  @override
  String get product => 'Product';

  @override
  String get productRequired => 'Please select a product';

  @override
  String noSubscriptions(String entityName) {
    return 'No ${entityName}s found, add one with \'+\'';
  }

  @override
  String fetchSubscriptionError(String error) {
    return 'failed to fetch subscription: $error';
  }

  @override
  String error(String message) {
    return 'Error: $message';
  }

  @override
  String errorGettingProducts(String message) {
    return 'Error getting products: $message';
  }

  @override
  String idLabel(String id, String name) {
    return 'ID: $id\nName: $name';
  }

  @override
  String get categoryFetchFailure => 'Failed to fetch categories';

  @override
  String get productUpdateFailure => 'Failed to update product';

  @override
  String get subscriptionAddSuccess => 'Subscription added successfully';

  @override
  String productAddSuccess(String name) {
    return 'Product $name added successfully';
  }

  @override
  String get subscriptionFetchFailure => 'Failed to fetch subscriptions';

  @override
  String get productUploadSuccess => 'Products uploaded successfully';

  @override
  String get categoryUploadFailure => 'Failed to upload categories';

  @override
  String categoryAddSuccess(String name) {
    return 'Category $name added successfully';
  }

  @override
  String get categoryUploadSuccess => 'Categories uploaded successfully';

  @override
  String categoryDeleteSuccess(String name) {
    return 'Category $name deleted successfully';
  }

  @override
  String get productDownloadSuccess =>
      'Product download scheduled, email will be sent shortly';

  @override
  String get subscriptionDeleteSuccess => 'Subscription deleted successfully';

  @override
  String get productDeleteFailure => 'Failed to delete product';

  @override
  String get subscriptionAddFailure => 'Failed to add subscription';

  @override
  String get categoryDownloadSuccess =>
      'Category download scheduled, email will be sent shortly';

  @override
  String productUpdateSuccess(String name) {
    return 'Product $name updated successfully';
  }

  @override
  String get subscriptionDeleteFailure => 'Failed to delete subscription';

  @override
  String get productFetchFailure => 'Failed to fetch products';

  @override
  String categoryUpdateSuccess(String name) {
    return 'Category $name updated successfully';
  }

  @override
  String productDeleteSuccess(String name) {
    return 'Product $name deleted successfully';
  }

  @override
  String get categoryUpdateFailure => 'Failed to update category';

  @override
  String get subscriptionUpdateFailure => 'Failed to update subscription';

  @override
  String get productDownloadFailure => 'Failed to download products';

  @override
  String get categoryDownloadFailure => 'Failed to download categories';

  @override
  String get productAddFailure => 'Failed to add product';

  @override
  String get categoryAddFailure => 'Failed to add category';

  @override
  String get subscriptionUpdateSuccess => 'Subscription updated successfully';

  @override
  String get productUploadFailure => 'Failed to upload products';

  @override
  String get categoryDeleteFailure => 'Failed to delete category';
}
