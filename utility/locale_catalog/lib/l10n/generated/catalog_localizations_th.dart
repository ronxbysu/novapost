// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'catalog_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class CatalogLocalizationsTh extends CatalogLocalizations {
  CatalogLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get category => 'หมวดหมู่';

  @override
  String get categoryList => 'รายการหมวดหมู่';

  @override
  String get products => 'สินค้า';

  @override
  String get productList => 'รายการสินค้า';

  @override
  String get subscriptions => 'การสมัครสมาชิก';

  @override
  String get subscriptionList => 'รายการการสมัครสมาชิก';

  @override
  String categoryNumber(String number) {
    return 'หมวดหมู่ #$number';
  }

  @override
  String get newItem => 'ใหม่';

  @override
  String pickImageError(String error) {
    return 'เกิดข้อผิดพลาดในการเลือกรูปภาพ: $error';
  }

  @override
  String get selectProducts => 'เลือกสินค้าอย่างน้อยหนึ่งรายการ';

  @override
  String get categoryId => 'รหัสหมวดหมู่';

  @override
  String get categoryName => 'ชื่อหมวดหมู่';

  @override
  String get enterCategoryName => 'กรุณาใส่ชื่อหมวดหมู่';

  @override
  String get description => 'คำอธิบาย';

  @override
  String get enterCategoryDescription => 'กรุณาใส่คำอธิบายหมวดหมู่';

  @override
  String get relatedProducts => 'สินค้าที่เกี่ยวข้อง';

  @override
  String totalShown(int total, int shown) {
    return ' ทั้งหมด: $total, แสดง $shown แรก';
  }

  @override
  String get create => 'สร้าง';

  @override
  String get update => 'อัปเดต';

  @override
  String get imageUploadError => 'เกิดข้อผิดพลาดในการอัปโหลดรูปภาพ!';

  @override
  String get categoryFiles => 'อัปโหลด/ดาวน์โหลดหมวดหมู่';

  @override
  String get downloadFormat => 'ดาวน์โหลดก่อนเพื่อรับรูปแบบ';

  @override
  String get uploadCsv => 'อัปโหลดไฟล์ CSV';

  @override
  String get downloadEmail => 'ดาวน์โหลดผ่านอีเมล';

  @override
  String get emailData => 'ไฟล์ข้อมูลจะถูกส่งทางอีเมล';

  @override
  String get noCategories => 'ยังไม่มีหมวดหมู่ เพิ่มโดยใช้ \'+\'';

  @override
  String fetchCategoriesError(String error) {
    return 'ไม่สามารถดึงข้อมูลหมวดหมู่ได้: $error';
  }

  @override
  String get categoryUpDown => 'อัปโหลด/ดาวน์โหลดหมวดหมู่';

  @override
  String get addNew => 'เพิ่มใหม่';

  @override
  String fetchSearchError(String error) {
    return 'ไม่สามารถดึงข้อมูลรายการค้นหาได้: $error';
  }

  @override
  String get categorySearch => 'ค้นหาหมวดหมู่';

  @override
  String get searchInput => 'ข้อมูลสำหรับการค้นหา';

  @override
  String get enterSearch => 'กรุณาใส่ค่าสำหรับการค้นหา';

  @override
  String get searchResults => 'ผลการค้นหา';

  @override
  String get noSearchItems => 'ไม่พบรายการค้นหา (ยัง)';

  @override
  String id(String id) {
    return 'รหัส: $id';
  }

  @override
  String name(String name) {
    return 'ชื่อ: $name';
  }

  @override
  String productNumber(String number) {
    return 'สินค้า #$number';
  }

  @override
  String roomTypeNumber(String number) {
    return 'ประเภทห้อง #$number';
  }

  @override
  String get rental => 'เช่า';

  @override
  String get selectCategories => 'เลือกหมวดหมู่อย่างน้อยหนึ่งรายการ';

  @override
  String get productId => 'รหัสสินค้า';

  @override
  String get roomTypeId => 'รหัสประเภทห้อง';

  @override
  String get productType => 'ประเภทสินค้า';

  @override
  String get productName => 'ชื่อสินค้า';

  @override
  String get roomTypeName => 'ชื่อประเภทห้อง';

  @override
  String get prices => 'ราคา';

  @override
  String listPrice(String symbol) {
    return 'ราคาปลีก($symbol)';
  }

  @override
  String currentPrice(String symbol) {
    return 'ราคาปัจจุบัน($symbol)';
  }

  @override
  String get currency => 'สกุลเงิน';

  @override
  String get currencyRequired => 'ต้องระบุช่องสกุลเงิน!';

  @override
  String get relatedCategories => 'หมวดหมู่ที่เกี่ยวข้อง';

  @override
  String get warehouseInventory => 'คลังสินค้า/สินค้าคงคลัง';

  @override
  String get useWarehouse => 'ใช้คลังสินค้า?';

  @override
  String get assetsInWarehouse => 'สินทรัพย์ในคลังสินค้า';

  @override
  String get typeAmount => 'ประเภท/จำนวน';

  @override
  String get uomType => 'ประเภทหน่วยวัด';

  @override
  String get uom => 'หน่วยวัด';

  @override
  String get uomRequired => 'กรุณาเลือกหน่วยวัด';

  @override
  String get amountQuantity => 'จำนวน';

  @override
  String get hotelRoom => 'ห้องพักโรงแรม';

  @override
  String get inventoryFin => 'AsClsInventoryFin';

  @override
  String get productFiles => 'อัปโหลด/ดาวน์โหลดสินค้า';

  @override
  String noProducts(String entityName) {
    return 'ไม่พบ $entityName เพิ่มโดยใช้ \'+\'';
  }

  @override
  String fetchProductError(String error) {
    return 'ไม่สามารถดึงข้อมูลสินค้าได้: $error';
  }

  @override
  String get productUpDown => 'อัปโหลด/ดาวน์โหลดสินค้า';

  @override
  String get productSearch => 'ค้นหาสินค้า';

  @override
  String get subscriptionSearch => 'ค้นหาการสมัครสมาชิก';

  @override
  String subscriber(String name) {
    return 'ผู้สมัคร: $name';
  }

  @override
  String subscriptionNumber(String number) {
    return 'การสมัครสมาชิก #$number';
  }

  @override
  String get question => '????';

  @override
  String get subscriberName => 'ผู้สมัคร,ชื่อ';

  @override
  String get selectSubscriber => 'เลือกผู้สมัคร';

  @override
  String get subscriberLabel => 'ผู้สมัคร';

  @override
  String get subscriberRequired => 'กรุณาเลือกผู้สมัคร';

  @override
  String purchased(String date) {
    return 'ซื้อเมื่อ: $date';
  }

  @override
  String cancelled(String date) {
    return 'ยกเลิกเมื่อ: $date';
  }

  @override
  String get fromDate => 'จากวันที่';

  @override
  String get thruDate => 'ถึงวันที่';

  @override
  String get searchProducts => 'ค้นหาสินค้า...';

  @override
  String get selectProduct => 'เลือกสินค้า';

  @override
  String get product => 'สินค้า';

  @override
  String get productRequired => 'กรุณาเลือกสินค้า';

  @override
  String noSubscriptions(String entityName) {
    return 'ไม่พบ $entityName เพิ่มโดยใช้ \'+\'';
  }

  @override
  String fetchSubscriptionError(String error) {
    return 'ไม่สามารถดึงข้อมูลการสมัครสมาชิกได้: $error';
  }

  @override
  String error(String message) {
    return 'ข้อผิดพลาด: $message';
  }

  @override
  String errorGettingProducts(String message) {
    return 'เกิดข้อผิดพลาดในการรับสินค้า: $message';
  }

  @override
  String idLabel(String id, String name) {
    return 'รหัส: $id\nชื่อ: $name';
  }

  @override
  String get categoryFetchFailure => 'การดึงข้อมูลหมวดหมู่ล้มเหลว';

  @override
  String get productUpdateFailure => 'การอัปเดตผลิตภัณฑ์ล้มเหลว';

  @override
  String get subscriptionAddSuccess => 'เพิ่มการสมัครสมาชิกสำเร็จ';

  @override
  String productAddSuccess(String name) {
    return 'เพิ่มผลิตภัณฑ์ $name สำเร็จ';
  }

  @override
  String get subscriptionFetchFailure => 'การดึงข้อมูลการสมัครสมาชิกล้มเหลว';

  @override
  String get productUploadSuccess => 'อัปโหลดผลิตภัณฑ์สำเร็จ';

  @override
  String get categoryUploadFailure => 'การอัปโหลดหมวดหมู่ล้มเหลว';

  @override
  String categoryAddSuccess(String name) {
    return 'เพิ่มหมวดหมู่ $name สำเร็จ';
  }

  @override
  String get categoryUploadSuccess => 'อัปโหลดหมวดหมู่สำเร็จ';

  @override
  String categoryDeleteSuccess(String name) {
    return 'ลบหมวดหมู่ $name สำเร็จ';
  }

  @override
  String get productDownloadSuccess =>
      'กำหนดเวลาดาวน์โหลดผลิตภัณฑ์แล้ว อีเมลจะถูกส่งในไม่ช้า';

  @override
  String get subscriptionDeleteSuccess => 'ลบการสมัครสมาชิกสำเร็จ';

  @override
  String get productDeleteFailure => 'การลบผลิตภัณฑ์ล้มเหลว';

  @override
  String get subscriptionAddFailure => 'การเพิ่มการสมัครสมาชิกล้มเหลว';

  @override
  String get categoryDownloadSuccess =>
      'กำหนดเวลาดาวน์โหลดหมวดหมู่แล้ว อีเมลจะถูกส่งในไม่ช้า';

  @override
  String productUpdateSuccess(String name) {
    return 'อัปเดตผลิตภัณฑ์ $name สำเร็จ';
  }

  @override
  String get subscriptionDeleteFailure => 'การลบการสมัครสมาชิกล้มเหลว';

  @override
  String get productFetchFailure => 'การดึงข้อมูลผลิตภัณฑ์ล้มเหลว';

  @override
  String categoryUpdateSuccess(String name) {
    return 'อัปเดตหมวดหมู่ $name สำเร็จ';
  }

  @override
  String productDeleteSuccess(String name) {
    return 'ลบผลิตภัณฑ์ $name สำเร็จ';
  }

  @override
  String get categoryUpdateFailure => 'การอัปเดตหมวดหมู่ล้มเหลว';

  @override
  String get subscriptionUpdateFailure => 'การอัปเดตการสมัครสมาชิกล้มเหลว';

  @override
  String get productDownloadFailure => 'การดาวน์โหลดผลิตภัณฑ์ล้มเหลว';

  @override
  String get categoryDownloadFailure => 'การดาวน์โหลดหมวดหมู่ล้มเหลว';

  @override
  String get productAddFailure => 'การเพิ่มผลิตภัณฑ์ล้มเหลว';

  @override
  String get categoryAddFailure => 'การเพิ่มหมวดหมู่ล้มเหลว';

  @override
  String get subscriptionUpdateSuccess => 'อัปเดตการสมัครสมาชิกสำเร็จ';

  @override
  String get productUploadFailure => 'การอัปโหลดผลิตภัณฑ์ล้มเหลว';

  @override
  String get categoryDeleteFailure => 'การลบหมวดหมู่ล้มเหลว';
}
