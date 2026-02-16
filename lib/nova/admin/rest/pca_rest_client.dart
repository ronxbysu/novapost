import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'pca_rest_client.g.dart';

@RestApi(baseUrl: null)
abstract class PCARestClient {
  factory PCARestClient(Dio dio, {String baseUrl}) = _PCARestClient;
  // catalog
  // asset
  @GET("rest/s1/growerp/100/Asset")
  Future<Assets> getAsset({
    @Query('start') int? start,
    @Query('limit') int? limit,
    @Query('companyPartyId') String? companyPartyId,
    @Query('assetClassId') String? assetClassId,
    @Query('assetId') String? assetId,
    @Query('productId') String? productId,
    @Query('isForDropDown') bool? isForDropDown,
    @Query('search') String? searchString,
  });

  @POST("rest/s1/growerp/100/Asset")
  Future<Asset> createAsset({
    @Field() required Asset asset,
    @Field() required String classificationId,
  });

  @PATCH("rest/s1/growerp/100/Asset")
  Future<Asset> updateAsset({
    @Field() required Asset asset,
    @Field() required String classificationId,
  });

  // categories
  @GET("rest/s1/growerp/100/Categories")
  Future<Categories> getCategory({
    @Query('start') int? start,
    @Query('limit') int? limit,
    @Query('companyPartyId') String? companyPartyId,
    @Query('isForDropDown') bool? isForDropDown,
    @Query('search') String? searchString,
    @Query('classificationId') String? classificationId,
  });

  @POST("rest/s1/growerp/100/Category")
  Future<Category> createCategory({
    @Field() required Category category,
    @Field() required String classificationId,
  });

  @PATCH("rest/s1/growerp/100/Category")
  Future<Category> updateCategory({
    @Field() required Category category,
    @Field() required String classificationId,
  });

  @DELETE("rest/s1/growerp/100/Category")
  Future<Category> deleteCategory({@Field() required Category category});

  @POST("rest/s1/growerp/100/ImportExport")
  Future<String> importScreenCategories({
    @Field() required List categories,
    @Field() required String classificationId,
  });

  @GET("rest/s1/growerp/100/ImportExport")
  Future<String> exportScreenCategories({
    @Query('entityName') String entityName = 'Category',
    @Query('classificationId') String? classificationId,
  });

  // products
  @GET("rest/s1/growerp/100/Products")
  Future<Products> getProduct({
    @Query('start') int? start,
    @Query('limit') int? limit,
    @Query('companyPartyId') String? companyPartyId,
    @Query('ownerPartyId') String? ownerPartyId,
    @Query('isForDropDown') bool? isForDropDown,
    @Query('search') String? searchString,
    @Query('classificationId') String? classificationId,
    @Query('categoryId') String? categoryId,
    @Query('productId') String? productId,
    @Query('productTypeId') String? productTypeId,
    @Query('assetClassId') String? assetClassId,
  });

  @POST("rest/s1/growerp/100/Product")
  Future<Product> createProduct({
    @Field() required Product product,
    @Field() required String classificationId,
  });

  @PATCH("rest/s1/growerp/100/Product")
  Future<Product> updateProduct({
    @Field() required Product product,
    @Field() required String classificationId,
  });

  @DELETE("rest/s1/growerp/100/Product")
  Future<Product> deleteProduct({@Field() required Product product});

  @POST("rest/s1/growerp/100/ImportExport")
  Future<String> importScreenProducts({
    @Field() required List<Product> products,
    @Field() required String classificationId,
  });

  @GET("rest/s1/growerp/100/ImportExport")
  Future<String> exportScreenProducts({
    @Query('entityName') String entityName = 'Product',
    @Query('classificationId') required String classificationId,
  });

  @POST("rest/s1/growerp/100/ImportExport/products")
  Future<void> importProducts(
      @Field() List<Product> products,
      @Field() String classificationId,
      );

  @POST("rest/s1/growerp/100/ImportExport/categories")
  Future<void> importCategories(@Field() List<Category> categories);

  @POST("rest/s1/growerp/100/ImportExport/assets")
  Future<void> importAssets(
      @Field() List<Asset> assets,
      @Field() String classificationId,
      );

  @GET("rest/s1/growerp/100/Categories")
  Future<Categories> getCategories({@Query('limit') int? limit});

  @GET("rest/s1/growerp/100/Products")
  Future<Products> getProducts({
    @Query('limit') int? limit,
    @Query('classificationId') String? classificationId,
  });

  // company
  @GET("rest/s1/growerp/100/Company")
  Future<Companies> getCompany({
    @Query('companyPartyId') String? companyPartyId,
    @Query('companyName') String? companyName,
    @Query('userPartyId') String? userPartyId,
    @Query('ownerPartyId') String? ownerPartyId,
    @Query('role') Role? role,
    @Query('start') int? start,
    @Query('limit') int? limit,
    @Query('firstName') String? firstName,
    @Query('lastName') String? lastName,
    @Query('searchString') String? searchString,
    @Query('isForDropDown') bool? isForDropDown,
  });

  @POST("rest/s1/growerp/100/Company")
  Future<Company> createCompany({@Field() required Company company});

  @PATCH("rest/s1/growerp/100/Company")
  Future<Company> updateCompany({@Field() required Company company});

  // party to replace company and user
  @GET("rest/s1/growerp/100/CompanyUser")
  Future<CompaniesUsers> getCompanyUser({
    @Query('role') Role? role,
    @Query('start') int? start,
    @Query('limit') int? limit,
    @Query('search') String? searchString,
    @Query('partyId') String? partyId,
  });

  @POST("rest/s1/growerp/100/ImportExport/companyUsers")
  Future<String> importCompanyUsers(@Field() List<CompanyUser> companyUsers);

  @GET("rest/s1/growerp/100/ImportExport")
  Future<String> exportScreenCompanyUsers({
    @Query('entityName') String entityName = 'CompanyUser',
  });

  // company
  @GET("rest/s1/growerp/100/CompanyFromHost")
  @Extra({'noApiKey': true})
  Future<Company> getCompanyFromHost(@Query('hostName') String? hostName);

}
