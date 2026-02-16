import 'package:auth/auth.dart';
import 'package:chat/chat.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locale/locale.dart';
import 'package:notification/notification.dart';
import 'package:novapost/nova/theme/theme_bloc.dart';
import 'admin/rest/pca_rest_client.dart';

List<BlocProvider> getCoreBlocProviders(
  PCARestClient restClient,
  // ChatRestClient chatRestClient,
  // NotificationRestClient notificationRestClient,
  AuthRestClient authRestClient,
  // WsClient chatClient,
  // WsClient notificationClient,
  String classificationId,
  Company? company,
) {
  AuthBloc authBloc = AuthBloc(
    authRestClient,
    // notificationClient,
    // restClient,
    classificationId,
    company,
  );
  // ChatRoomBloc chatRoomBloc = ChatRoomBloc(chatRestClient, chatClient, authBloc);
  List<BlocProvider<StateStreamableSource<Object?>>> blocProviders = [
    BlocProvider<AuthBloc>(create: (context) => authBloc..add(AuthLoad())),
    // BlocProvider<ChatRoomBloc>(
    //   create: (context) =>
    //       ChatRoomBloc(chatRestClient, chatClient, authBloc)
    //         ..add(const ChatRoomFetch()),
    // ),
    // BlocProvider<ActivityBloc>(create: (context) => ActivityBloc(restClient)),
    BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc()..add(ThemeSwitch()),
    ),
    BlocProvider<LocaleBloc>(
      create: (context) => LocaleBloc()..add(LocaleLoaded()),
    ),
    // BlocProvider<NotificationBloc>(
    //   create: (context) =>
    //       NotificationBloc(notificationRestClient, notificationClient, authBloc)
    //         ..add(const NotificationFetch()),
    // ),
    // BlocProvider<ChatMessageBloc>(
    //   create: (context) =>
    //       ChatMessageBloc(chatRestClient, chatClient, authBloc, chatRoomBloc),
    // ),
/*    BlocProvider<DataFetchBloc<Activities>>(
      create: (context) => DataFetchBloc<Activities>(),
    ),
    BlocProvider<DataFetchBloc<FinDocs>>(
      create: (context) => DataFetchBloc<FinDocs>(),
    ),*/
    BlocProvider<DataFetchBloc<Products>>(
      create: (context) => DataFetchBloc<Products>(),
    ),
    BlocProvider<DataFetchBloc<Categories>>(
      create: (context) => DataFetchBloc<Categories>(),
    ),
    BlocProvider<DataFetchBloc<Users>>(
      create: (context) => DataFetchBloc<Users>(),
    ),
    // in marketing need to search for 2 different type of users
    BlocProvider<DataFetchBlocOther<Users>>(
      create: (context) => DataFetchBloc<Users>(),
    ),
    BlocProvider<DataFetchBloc<Companies>>(
      create: (context) => DataFetchBloc<Companies>(),
    ),
    BlocProvider<DataFetchBloc<Locations>>(
      create: (context) => DataFetchBloc<Locations>(),
    ),
    BlocProvider<DataFetchBloc<Assets>>(
      create: (context) => DataFetchBloc<Assets>(),
    ),
    BlocProvider<DataFetchBloc<CompaniesUsers>>(
      create: (context) => DataFetchBloc<CompaniesUsers>(),
    ),
/*    BlocProvider<DataFetchBloc<Subscriptions>>(
      create: (context) => DataFetchBloc<Subscriptions>(),
    ),*/
  ];
  return blocProviders;
}
