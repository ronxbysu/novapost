import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'catalog_localizations_de.dart';
import 'catalog_localizations_en.dart';
import 'catalog_localizations_fr.dart';
import 'catalog_localizations_nl.dart';
import 'catalog_localizations_th.dart';
import 'catalog_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of CatalogLocalizations
/// returned by `CatalogLocalizations.of(context)`.
///
/// Applications need to include `CatalogLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/catalog_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: CatalogLocalizations.localizationsDelegates,
///   supportedLocales: CatalogLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the CatalogLocalizations.supportedLocales
/// property.
abstract class CatalogLocalizations {
  CatalogLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static CatalogLocalizations? of(BuildContext context) {
    return Localizations.of<CatalogLocalizations>(
      context,
      CatalogLocalizations,
    );
  }

  static const LocalizationsDelegate<CatalogLocalizations> delegate =
      _CatalogLocalizationsDelegate();

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

  /// Category menu item
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// Title of the category list screen
  ///
  /// In en, this message translates to:
  /// **'Category List'**
  String get categoryList;

  /// Products menu item
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get products;

  /// Title of the product list screen
  ///
  /// In en, this message translates to:
  /// **'Product List'**
  String get productList;

  /// Subscriptions menu item
  ///
  /// In en, this message translates to:
  /// **'Subscriptions'**
  String get subscriptions;

  /// Title of the subscription list screen
  ///
  /// In en, this message translates to:
  /// **'Subscription List'**
  String get subscriptionList;

  /// Category number
  ///
  /// In en, this message translates to:
  /// **'Category #{number}'**
  String categoryNumber(String number);

  /// new item
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get newItem;

  /// Error message when picking an image
  ///
  /// In en, this message translates to:
  /// **'Pick image error: {error}'**
  String pickImageError(String error);

  /// Title of the product selection dialog
  ///
  /// In en, this message translates to:
  /// **'Select one or more products'**
  String get selectProducts;

  /// Label for the category id field
  ///
  /// In en, this message translates to:
  /// **'Category Id'**
  String get categoryId;

  /// Label for the category name field
  ///
  /// In en, this message translates to:
  /// **'Category Name'**
  String get categoryName;

  /// Validation message for the category name field
  ///
  /// In en, this message translates to:
  /// **'Please enter a category name?'**
  String get enterCategoryName;

  /// Label for the description field
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// Validation message for the category description field
  ///
  /// In en, this message translates to:
  /// **'Please enter a category description?'**
  String get enterCategoryDescription;

  /// Label for the related products field
  ///
  /// In en, this message translates to:
  /// **'Related Products'**
  String get relatedProducts;

  /// Label for the total number of items shown
  ///
  /// In en, this message translates to:
  /// **' total: {total}, shown first {shown}'**
  String totalShown(int total, int shown);

  /// Create button
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// Update button
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// Error message when uploading an image
  ///
  /// In en, this message translates to:
  /// **'Image upload error!'**
  String get imageUploadError;

  /// Title of the category files dialog
  ///
  /// In en, this message translates to:
  /// **'Category Up/Download'**
  String get categoryFiles;

  /// Instruction to download the format first
  ///
  /// In en, this message translates to:
  /// **'Download first to obtain the format'**
  String get downloadFormat;

  /// Button to upload a CSV file
  ///
  /// In en, this message translates to:
  /// **'Upload CSV file'**
  String get uploadCsv;

  /// Button to download via email
  ///
  /// In en, this message translates to:
  /// **'Download via email'**
  String get downloadEmail;

  /// Information about the data file being sent by email
  ///
  /// In en, this message translates to:
  /// **'A data file will be send by email'**
  String get emailData;

  /// Message when there are no categories
  ///
  /// In en, this message translates to:
  /// **'No categories yet, add one with \'+\''**
  String get noCategories;

  /// Error message when fetching categories
  ///
  /// In en, this message translates to:
  /// **'failed to fetch categories: {error}'**
  String fetchCategoriesError(String error);

  /// Tooltip for the category up/download button
  ///
  /// In en, this message translates to:
  /// **'category up/download'**
  String get categoryUpDown;

  /// Tooltip for the add new button
  ///
  /// In en, this message translates to:
  /// **'Add New'**
  String get addNew;

  /// Error message when fetching search items
  ///
  /// In en, this message translates to:
  /// **'failed to fetch search items: {error}'**
  String fetchSearchError(String error);

  /// Title of the category search dialog
  ///
  /// In en, this message translates to:
  /// **'Category Search'**
  String get categorySearch;

  /// Label for the search input field
  ///
  /// In en, this message translates to:
  /// **'Search input'**
  String get searchInput;

  /// Validation message for the search input field
  ///
  /// In en, this message translates to:
  /// **'Please enter a search value?'**
  String get enterSearch;

  /// Label for the search results
  ///
  /// In en, this message translates to:
  /// **'Search results'**
  String get searchResults;

  /// Message when no search items are found
  ///
  /// In en, this message translates to:
  /// **'No search items found (yet)'**
  String get noSearchItems;

  /// Label for the ID
  ///
  /// In en, this message translates to:
  /// **'ID: {id}'**
  String id(String id);

  /// Label for the name
  ///
  /// In en, this message translates to:
  /// **'Name: {name}'**
  String name(String name);

  /// Product number
  ///
  /// In en, this message translates to:
  /// **'Product #{number}'**
  String productNumber(String number);

  /// Room type number
  ///
  /// In en, this message translates to:
  /// **'Room Type #{number}'**
  String roomTypeNumber(String number);

  /// Rental product type
  ///
  /// In en, this message translates to:
  /// **'Rental'**
  String get rental;

  /// Title of the category selection dialog
  ///
  /// In en, this message translates to:
  /// **'Select one or more categories'**
  String get selectCategories;

  /// Label for the product id field
  ///
  /// In en, this message translates to:
  /// **'Product Id'**
  String get productId;

  /// Label for the room type id field
  ///
  /// In en, this message translates to:
  /// **'Room Type Id'**
  String get roomTypeId;

  /// Label for the product type field
  ///
  /// In en, this message translates to:
  /// **'Product Type'**
  String get productType;

  /// Label for the product name field
  ///
  /// In en, this message translates to:
  /// **'Product Name'**
  String get productName;

  /// Label for the room type name field
  ///
  /// In en, this message translates to:
  /// **'Room Type Name'**
  String get roomTypeName;

  /// Label for the prices section
  ///
  /// In en, this message translates to:
  /// **'Prices'**
  String get prices;

  /// Label for the list price field
  ///
  /// In en, this message translates to:
  /// **'List Price({symbol})'**
  String listPrice(String symbol);

  /// Label for the current price field
  ///
  /// In en, this message translates to:
  /// **'Current Price({symbol})'**
  String currentPrice(String symbol);

  /// Label for the currency field
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get currency;

  /// Validation message for the currency field
  ///
  /// In en, this message translates to:
  /// **'Currency field required!'**
  String get currencyRequired;

  /// Label for the related categories field
  ///
  /// In en, this message translates to:
  /// **'Related categories'**
  String get relatedCategories;

  /// Label for the warehouse/inventory section
  ///
  /// In en, this message translates to:
  /// **'Warehouse/Inventory'**
  String get warehouseInventory;

  /// Label for the use warehouse checkbox
  ///
  /// In en, this message translates to:
  /// **'Use Warehouse?'**
  String get useWarehouse;

  /// Label for the assets in warehouse field
  ///
  /// In en, this message translates to:
  /// **'Assets in warehouse'**
  String get assetsInWarehouse;

  /// Label for the type/amount section
  ///
  /// In en, this message translates to:
  /// **'Type/Amount'**
  String get typeAmount;

  /// Label for the UOM type field
  ///
  /// In en, this message translates to:
  /// **'UOM Type'**
  String get uomType;

  /// Label for the unit of measure field
  ///
  /// In en, this message translates to:
  /// **'Unit of Measure'**
  String get uom;

  /// Validation message for the unit of measure field
  ///
  /// In en, this message translates to:
  /// **'Please select a unit of measure'**
  String get uomRequired;

  /// Label for the amount/quantity field
  ///
  /// In en, this message translates to:
  /// **'Amount/Quantity'**
  String get amountQuantity;

  /// Hotel room asset class
  ///
  /// In en, this message translates to:
  /// **'Hotel Room'**
  String get hotelRoom;

  /// Inventory finished good asset class
  ///
  /// In en, this message translates to:
  /// **'AsClsInventoryFin'**
  String get inventoryFin;

  /// Title of the product files dialog
  ///
  /// In en, this message translates to:
  /// **'Product Up/Download'**
  String get productFiles;

  /// Message when no products are found
  ///
  /// In en, this message translates to:
  /// **'No {entityName}s found, add one with \'+\''**
  String noProducts(String entityName);

  /// Error message when fetching products
  ///
  /// In en, this message translates to:
  /// **'failed to fetch product: {error}'**
  String fetchProductError(String error);

  /// Tooltip for the product up/download button
  ///
  /// In en, this message translates to:
  /// **'products up/download'**
  String get productUpDown;

  /// Title of the product search dialog
  ///
  /// In en, this message translates to:
  /// **'Product Search'**
  String get productSearch;

  /// Title of the subscription search dialog
  ///
  /// In en, this message translates to:
  /// **'Subscription Search'**
  String get subscriptionSearch;

  /// Label for the subscriber
  ///
  /// In en, this message translates to:
  /// **'Subscriber: {name}'**
  String subscriber(String name);

  /// Subscription number
  ///
  /// In en, this message translates to:
  /// **'Subscription #{number}'**
  String subscriptionNumber(String number);

  /// question marks
  ///
  /// In en, this message translates to:
  /// **'????'**
  String get question;

  /// Label for the subscriber name search field
  ///
  /// In en, this message translates to:
  /// **'subscriber,name'**
  String get subscriberName;

  /// Title of the subscriber selection dialog
  ///
  /// In en, this message translates to:
  /// **'Select Subscriber'**
  String get selectSubscriber;

  /// Label for the subscriber field
  ///
  /// In en, this message translates to:
  /// **'Subscriber'**
  String get subscriberLabel;

  /// Validation message for the subscriber field
  ///
  /// In en, this message translates to:
  /// **'Please select a subscriber'**
  String get subscriberRequired;

  /// Label for the purchased date
  ///
  /// In en, this message translates to:
  /// **'Purchased: {date}'**
  String purchased(String date);

  /// Label for the cancelled date
  ///
  /// In en, this message translates to:
  /// **'Cancelled: {date}'**
  String cancelled(String date);

  /// Label for the from date field
  ///
  /// In en, this message translates to:
  /// **'From Date'**
  String get fromDate;

  /// Label for the thru date field
  ///
  /// In en, this message translates to:
  /// **'Thru Date'**
  String get thruDate;

  /// Label for the search products field
  ///
  /// In en, this message translates to:
  /// **'Search products...'**
  String get searchProducts;

  /// Title of the product selection dialog
  ///
  /// In en, this message translates to:
  /// **'Select Product'**
  String get selectProduct;

  /// Label for the product field
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get product;

  /// Validation message for the product field
  ///
  /// In en, this message translates to:
  /// **'Please select a product'**
  String get productRequired;

  /// Message when no subscriptions are found
  ///
  /// In en, this message translates to:
  /// **'No {entityName}s found, add one with \'+\''**
  String noSubscriptions(String entityName);

  /// Error message when fetching subscriptions
  ///
  /// In en, this message translates to:
  /// **'failed to fetch subscription: {error}'**
  String fetchSubscriptionError(String error);

  /// generic error
  ///
  /// In en, this message translates to:
  /// **'Error: {message}'**
  String error(String message);

  /// error getting products
  ///
  /// In en, this message translates to:
  /// **'Error getting products: {message}'**
  String errorGettingProducts(String message);

  /// label for id
  ///
  /// In en, this message translates to:
  /// **'ID: {id}\nName: {name}'**
  String idLabel(String id, String name);

  /// BLoC message: Failed to fetch categories
  ///
  /// In en, this message translates to:
  /// **'Failed to fetch categories'**
  String get categoryFetchFailure;

  /// BLoC message: Failed to update product
  ///
  /// In en, this message translates to:
  /// **'Failed to update product'**
  String get productUpdateFailure;

  /// BLoC message: Subscription added successfully
  ///
  /// In en, this message translates to:
  /// **'Subscription added successfully'**
  String get subscriptionAddSuccess;

  /// BLoC message: Product added successfully
  ///
  /// In en, this message translates to:
  /// **'Product {name} added successfully'**
  String productAddSuccess(String name);

  /// BLoC message: Failed to fetch subscriptions
  ///
  /// In en, this message translates to:
  /// **'Failed to fetch subscriptions'**
  String get subscriptionFetchFailure;

  /// BLoC message: Products uploaded successfully
  ///
  /// In en, this message translates to:
  /// **'Products uploaded successfully'**
  String get productUploadSuccess;

  /// BLoC message: Failed to upload categories
  ///
  /// In en, this message translates to:
  /// **'Failed to upload categories'**
  String get categoryUploadFailure;

  /// BLoC message: Category added successfully
  ///
  /// In en, this message translates to:
  /// **'Category {name} added successfully'**
  String categoryAddSuccess(String name);

  /// BLoC message: Categories uploaded successfully
  ///
  /// In en, this message translates to:
  /// **'Categories uploaded successfully'**
  String get categoryUploadSuccess;

  /// BLoC message: Category deleted successfully
  ///
  /// In en, this message translates to:
  /// **'Category {name} deleted successfully'**
  String categoryDeleteSuccess(String name);

  /// BLoC message: Product download scheduled, email will be sent shortly
  ///
  /// In en, this message translates to:
  /// **'Product download scheduled, email will be sent shortly'**
  String get productDownloadSuccess;

  /// BLoC message: Subscription deleted successfully
  ///
  /// In en, this message translates to:
  /// **'Subscription deleted successfully'**
  String get subscriptionDeleteSuccess;

  /// BLoC message: Failed to delete product
  ///
  /// In en, this message translates to:
  /// **'Failed to delete product'**
  String get productDeleteFailure;

  /// BLoC message: Failed to add subscription
  ///
  /// In en, this message translates to:
  /// **'Failed to add subscription'**
  String get subscriptionAddFailure;

  /// BLoC message: Category download scheduled, email will be sent shortly
  ///
  /// In en, this message translates to:
  /// **'Category download scheduled, email will be sent shortly'**
  String get categoryDownloadSuccess;

  /// BLoC message: Product updated successfully
  ///
  /// In en, this message translates to:
  /// **'Product {name} updated successfully'**
  String productUpdateSuccess(String name);

  /// BLoC message: Failed to delete subscription
  ///
  /// In en, this message translates to:
  /// **'Failed to delete subscription'**
  String get subscriptionDeleteFailure;

  /// BLoC message: Failed to fetch products
  ///
  /// In en, this message translates to:
  /// **'Failed to fetch products'**
  String get productFetchFailure;

  /// BLoC message: Category updated successfully
  ///
  /// In en, this message translates to:
  /// **'Category {name} updated successfully'**
  String categoryUpdateSuccess(String name);

  /// BLoC message: Product deleted successfully
  ///
  /// In en, this message translates to:
  /// **'Product {name} deleted successfully'**
  String productDeleteSuccess(String name);

  /// BLoC message: Failed to update category
  ///
  /// In en, this message translates to:
  /// **'Failed to update category'**
  String get categoryUpdateFailure;

  /// BLoC message: Failed to update subscription
  ///
  /// In en, this message translates to:
  /// **'Failed to update subscription'**
  String get subscriptionUpdateFailure;

  /// BLoC message: Failed to download products
  ///
  /// In en, this message translates to:
  /// **'Failed to download products'**
  String get productDownloadFailure;

  /// BLoC message: Failed to download categories
  ///
  /// In en, this message translates to:
  /// **'Failed to download categories'**
  String get categoryDownloadFailure;

  /// BLoC message: Failed to add product
  ///
  /// In en, this message translates to:
  /// **'Failed to add product'**
  String get productAddFailure;

  /// BLoC message: Failed to add category
  ///
  /// In en, this message translates to:
  /// **'Failed to add category'**
  String get categoryAddFailure;

  /// BLoC message: Subscription updated successfully
  ///
  /// In en, this message translates to:
  /// **'Subscription updated successfully'**
  String get subscriptionUpdateSuccess;

  /// BLoC message: Failed to upload products
  ///
  /// In en, this message translates to:
  /// **'Failed to upload products'**
  String get productUploadFailure;

  /// BLoC message: Failed to delete category
  ///
  /// In en, this message translates to:
  /// **'Failed to delete category'**
  String get categoryDeleteFailure;
}

class _CatalogLocalizationsDelegate
    extends LocalizationsDelegate<CatalogLocalizations> {
  const _CatalogLocalizationsDelegate();

  @override
  Future<CatalogLocalizations> load(Locale locale) {
    return SynchronousFuture<CatalogLocalizations>(
      lookupCatalogLocalizations(locale),
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
  bool shouldReload(_CatalogLocalizationsDelegate old) => false;
}

CatalogLocalizations lookupCatalogLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return CatalogLocalizationsDe();
    case 'en':
      return CatalogLocalizationsEn();
    case 'fr':
      return CatalogLocalizationsFr();
    case 'nl':
      return CatalogLocalizationsNl();
    case 'th':
      return CatalogLocalizationsTh();
    case 'zh':
      return CatalogLocalizationsZh();
  }

  throw FlutterError(
    'CatalogLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
