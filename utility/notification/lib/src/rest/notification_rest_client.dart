import 'package:dio/dio.dart' hide Headers;
import 'package:notification/src/model/notification_ws_model.dart';
import 'package:retrofit/retrofit.dart';

part 'notification_rest_client.g.dart';

@RestApi(baseUrl: null)
abstract class NotificationRestClient {
  factory NotificationRestClient(Dio dio, {String baseUrl}) = _NotificationRestClient;

  // notification
  @GET("rest/s1/growerp/100/Notification")
  Future<Notifications> getNotifications({@Query('limit') int? limit});

}
