import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kopay/app/constants.dart';
import 'package:kopay/app/modules/kebun/add/page.dart';

class MapController extends GetxController {
  Completer mapsController = Completer<GoogleMapController>();
  var listMarkers = [].obs;

  final box = GetStorage();
  final db = FirebaseFirestore.instance;

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    refreshMarker();
  }

  void reset() {
    refreshMarker();
  }

  void refreshMarker() async {
    var code = box.read(Constants.userClient);
    List<Marker> list = [];
    await db
        .collection("data")
        .doc(code.toUpperCase())
        .collection("markers")
        .get()
        .then((doc) async {
      for (var collection in doc.docs) {
        var data = collection.data();
        var position =
            LatLng(data["location"].latitude, data["location"].longitude);
        var marker = Marker(
            markerId: MarkerId(collection.id),
            position: position,
            infoWindow: InfoWindow(
                title: data["title"],
                snippet: "Klik untuk melanjutkan",
                // ));
                onTap: () {
                  Get.to(AddKebunScreen(
                      collection.id,
                      data["title"],
                      data["penyakit"],
                      data["masaTanam"],
                      data["image"],
                      position));
                }));
        list.add(marker);
      }
    });
    listMarkers(list);
  }
}
