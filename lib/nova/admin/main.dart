/*
 * This GrowERP software is in the public domain under CC0 1.0 Universal plus a
 * Grant of Patent License.
 * 
 * To the extent possible under law, the author(s) have dedicated all
 * copyright and related and neighboring rights to this software to the
 * public domain worldwide. This software is distributed without any
 * warranty.
 * 
 * You should have received a copy of the CC0 Public Domain Dedication
 * along with this software (see the LICENSE.md file). If not, see
 * <http://creativecommons.org/publicdomain/zero/1.0/>.
 */

import 'package:auth/auth.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locale_catalog/locale_catalog.dart';
import 'package:novapost/nova/admin/rest/pca_rest_client.dart';
import 'package:novapost/nova_app.dart';
import 'package:widgets/widgets.dart';

import 'app_bloc_observer.dart';
import 'get_backend_url.dart';
import 'menu_options.dart';
import 'router.dart' as router;
import 'package:package_info_plus/package_info_plus.dart';
//webactivate  import 'package:web/web.dart' as web;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GlobalConfiguration().loadFromAsset('app_settings');

  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  GlobalConfiguration().updateValue('appName', packageInfo.appName);
  GlobalConfiguration().updateValue('packageName', packageInfo.packageName);
  GlobalConfiguration().updateValue('version', packageInfo.version);
  GlobalConfiguration().updateValue('build', packageInfo.buildNumber);

  String classificationId = GlobalConfiguration().get("classificationId");

  // check if there is override for the production backend url
  // if there is a override we are in test mode: see the banner in the app
  await getBackendUrlOverride(classificationId, packageInfo.version);

  Bloc.observer = AppBlocObserver();
  PCARestClient restClient = PCARestClient(await buildDioClient());
  AuthRestClient authRestClient = AuthRestClient(await buildDioClient());
  // WsClient chatClient = WsClient('chat');
  // WsClient notificationClient = WsClient('notws');

  Company? company;
  if (kIsWeb) {
    String? hostName;
    //webactivate  hostName = web.window.location.hostname;
    // ignore: unnecessary_null_comparison
    if (hostName != null) {
      try {
        company = await restClient.getCompanyFromHost(hostName);
      } on DioException catch (e) {
        debugPrint("getting hostname error: ${await getDioError(e)}");
      }
      if (company?.partyId == null) company = null;
    }
  }

  runApp(
    NovaApp(
      restClient: restClient,
      authRestClient: authRestClient,
      classificationId: classificationId,
      // chatClient: chatClient,
      // notificationClient: notificationClient,
      title: 'NovaPost',
      router: router.generateRoute,
      menuOptions: menuOptions,
      extraDelegates: delegates,
      extraBlocProviders: getAdminBlocProviders(restClient, classificationId),
      company: company,
    ),
  );
}

List<LocalizationsDelegate> delegates = [
  // UserCompanyLocalizations.delegate,
  CatalogLocalizations.delegate,
  // InventoryLocalizations.delegate,
  // OrderAccountingLocalizations.delegate,
  // WebsiteLocalizations.delegate,
  // MarketingLocalizations.delegate,
  // InventoryLocalizations.delegate,
  // ActivityLocalizations.delegate,
];

List<BlocProvider> getAdminBlocProviders(
  PCARestClient restClient,
  String classificationId,
) {
  return [
    // ...getInventoryBlocProviders(restClient, classificationId),
    // ...getUserCompanyBlocProviders(restClient, classificationId),
    // ...getCatalogBlocProviders(restClient, classificationId),
    // ...getOrderAccountingBlocProviders(restClient, classificationId),
    // ...getMarketingBlocProviders(restClient),
    // ...getWebsiteBlocProviders(restClient),
  ];
}
