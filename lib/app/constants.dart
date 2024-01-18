import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class Constants {
  //  development
  // static const baseUrl = "http://dev.foodtender.id:9080";
  static const baseUrl = "http://103.146.245.149:8080";
  static const appUrl = "http://103.146.245.149:80";

  // production
  // static const baseUrl = "http://foodtender.id";

  static const accessToken = 'access_token';
  static const firebaseToken = "firebase_token";
  static const refreshToken = 'refresh_token';
  static const expiredDate = 'expired_date';
  static const userClient = 'user_client';
  static const userSavedPins = 'user_saved_pins';
}

abstract class APIController {
  static const oauthCtrl = "/oauth";
  static const publicCtrl = "/public";
}

abstract class DefaultPlace {
  static const pupuan = LatLng(-8.3680849, 114.8491832);
  static const stiki = LatLng(-8.6908087, 115.226306);
}
