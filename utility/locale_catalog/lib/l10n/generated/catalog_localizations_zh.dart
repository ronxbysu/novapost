// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'catalog_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class CatalogLocalizationsZh extends CatalogLocalizations {
  CatalogLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get category => '类别';

  @override
  String get categoryList => '类别列表';

  @override
  String get products => '产品';

  @override
  String get productList => '产品列表';

  @override
  String get subscriptions => '订阅';

  @override
  String get subscriptionList => '订阅列表';

  @override
  String categoryNumber(String number) {
    return '类别 #$number';
  }

  @override
  String get newItem => '新建';

  @override
  String pickImageError(String error) {
    return '选择图片错误：$error';
  }

  @override
  String get selectProducts => '选择一个或多个产品';

  @override
  String get categoryId => '类别ID';

  @override
  String get categoryName => '类别名称';

  @override
  String get enterCategoryName => '请输入类别名称？';

  @override
  String get description => '描述';

  @override
  String get enterCategoryDescription => '请输入类别描述？';

  @override
  String get relatedProducts => '相关产品';

  @override
  String totalShown(int total, int shown) {
    return ' 总计：$total，首先显示 $shown';
  }

  @override
  String get create => '创建';

  @override
  String get update => '更新';

  @override
  String get imageUploadError => '图片上传错误！';

  @override
  String get categoryFiles => '类别上传/下载';

  @override
  String get downloadFormat => '首先下载以获取格式';

  @override
  String get uploadCsv => '上传CSV文件';

  @override
  String get downloadEmail => '通过电子邮件下载';

  @override
  String get emailData => '数据文件将通过电子邮件发送';

  @override
  String get noCategories => '尚无类别，使用“+”添加一个';

  @override
  String fetchCategoriesError(String error) {
    return '获取类别失败：$error';
  }

  @override
  String get categoryUpDown => '类别上传/下载';

  @override
  String get addNew => '添新';

  @override
  String fetchSearchError(String error) {
    return '获取搜索项失败：$error';
  }

  @override
  String get categorySearch => '类别搜索';

  @override
  String get searchInput => '搜索输入';

  @override
  String get enterSearch => '请输入搜索值？';

  @override
  String get searchResults => '搜索结果';

  @override
  String get noSearchItems => '未找到搜索项（尚未）';

  @override
  String id(String id) {
    return 'ID：$id';
  }

  @override
  String name(String name) {
    return '名称：$name';
  }

  @override
  String productNumber(String number) {
    return '产品 #$number';
  }

  @override
  String roomTypeNumber(String number) {
    return '房型 #$number';
  }

  @override
  String get rental => '租赁';

  @override
  String get selectCategories => '选择一个或多个类别';

  @override
  String get productId => '产品ID';

  @override
  String get roomTypeId => '房型ID';

  @override
  String get productType => '产品类型';

  @override
  String get productName => '产品名称';

  @override
  String get roomTypeName => '房型名称';

  @override
  String get prices => '价格';

  @override
  String listPrice(String symbol) {
    return '标价($symbol)';
  }

  @override
  String currentPrice(String symbol) {
    return '当前价格($symbol)';
  }

  @override
  String get currency => '货币';

  @override
  String get currencyRequired => '货币字段为必填项！';

  @override
  String get relatedCategories => '相关类别';

  @override
  String get warehouseInventory => '仓库/库存';

  @override
  String get useWarehouse => '使用仓库？';

  @override
  String get assetsInWarehouse => '仓库中的资产';

  @override
  String get typeAmount => '类型/数量';

  @override
  String get uomType => '计量单位类型';

  @override
  String get uom => '计量单位';

  @override
  String get uomRequired => '请选择一个计量单位';

  @override
  String get amountQuantity => '金额/数量';

  @override
  String get hotelRoom => '酒店房间';

  @override
  String get inventoryFin => '库存成品资产类别';

  @override
  String get productFiles => '产品上传/下载';

  @override
  String noProducts(String entityName) {
    return '未找到$entityName，使用“+”添加一个';
  }

  @override
  String fetchProductError(String error) {
    return '获取产品失败：$error';
  }

  @override
  String get productUpDown => '产品上传/下载';

  @override
  String get productSearch => '产品搜索';

  @override
  String get subscriptionSearch => '订阅搜索';

  @override
  String subscriber(String name) {
    return '订阅者：$name';
  }

  @override
  String subscriptionNumber(String number) {
    return '订阅 #$number';
  }

  @override
  String get question => '????';

  @override
  String get subscriberName => '订阅者姓名';

  @override
  String get selectSubscriber => '选择订阅者';

  @override
  String get subscriberLabel => '订阅者';

  @override
  String get subscriberRequired => '请选择一个订阅者';

  @override
  String purchased(String date) {
    return '购买日期：$date';
  }

  @override
  String cancelled(String date) {
    return '取消日期：$date';
  }

  @override
  String get fromDate => '开始日期';

  @override
  String get thruDate => '结束日期';

  @override
  String get searchProducts => '搜索产品...';

  @override
  String get selectProduct => '选择产品';

  @override
  String get product => '产品';

  @override
  String get productRequired => '请选择一个产品';

  @override
  String noSubscriptions(String entityName) {
    return '未找到$entityName，使用“+”添加一个';
  }

  @override
  String fetchSubscriptionError(String error) {
    return '获取订阅失败：$error';
  }

  @override
  String error(String message) {
    return '错误：$message';
  }

  @override
  String errorGettingProducts(String message) {
    return '获取产品时出错：$message';
  }

  @override
  String idLabel(String id, String name) {
    return 'ID：$id\n名称：$name';
  }

  @override
  String get categoryFetchFailure => '获取类别失败';

  @override
  String get productUpdateFailure => '产品更新失败';

  @override
  String get subscriptionAddSuccess => '订阅添加成功';

  @override
  String productAddSuccess(String name) {
    return '产品 $name 添加成功';
  }

  @override
  String get subscriptionFetchFailure => '获取订阅失败';

  @override
  String get productUploadSuccess => '产品上传成功';

  @override
  String get categoryUploadFailure => '类别上传失败';

  @override
  String categoryAddSuccess(String name) {
    return '类别 $name 添加成功';
  }

  @override
  String get categoryUploadSuccess => '类别上传成功';

  @override
  String categoryDeleteSuccess(String name) {
    return '类别 $name 删除成功';
  }

  @override
  String get productDownloadSuccess => '产品下载已安排，电子邮件将很快发送';

  @override
  String get subscriptionDeleteSuccess => '订阅删除成功';

  @override
  String get productDeleteFailure => '产品删除失败';

  @override
  String get subscriptionAddFailure => '订阅添加失败';

  @override
  String get categoryDownloadSuccess => '类别下载已安排，电子邮件将很快发送';

  @override
  String productUpdateSuccess(String name) {
    return '产品 $name 更新成功';
  }

  @override
  String get subscriptionDeleteFailure => '订阅删除失败';

  @override
  String get productFetchFailure => '获取产品失败';

  @override
  String categoryUpdateSuccess(String name) {
    return '类别 $name 更新成功';
  }

  @override
  String productDeleteSuccess(String name) {
    return '产品 $name 删除成功';
  }

  @override
  String get categoryUpdateFailure => '类别更新失败';

  @override
  String get subscriptionUpdateFailure => '订阅更新失败';

  @override
  String get productDownloadFailure => '产品下载失败';

  @override
  String get categoryDownloadFailure => '类别下载失败';

  @override
  String get productAddFailure => '产品添加失败';

  @override
  String get categoryAddFailure => '类别添加失败';

  @override
  String get subscriptionUpdateSuccess => '订阅更新成功';

  @override
  String get productUploadFailure => '产品上传失败';

  @override
  String get categoryDeleteFailure => '类别删除失败';
}
