import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kopay/app/constants.dart';
import 'package:kopay/app/modules/kebun/add/controller.dart';
import 'package:kopay/app/modules/kebun/add/page.dart';
import 'package:kopay/app/modules/map/controller.dart';
import 'package:kopay/app/themes/app_text_themes.dart';
import 'package:kopay/app/widget/molecule/blue_scaffold.dart';

class MapScreen extends GetView<MapController> {
  const MapScreen({super.key});

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: DefaultPlace.pupuan,
    zoom: 17,
  );

  @override
  Widget build(BuildContext context) {
    Get.put(MapController());
    return BlueScaffold(
        title: "Peta",
        onPressedBurger: () {
          Get.bottomSheet(
              Wrap(
                children: <Widget>[
                  ListTile(
                      title: Text("Tambah Kebun", style: labelLG),
                      onTap: () {
                        bool isRegistered =
                            Get.isRegistered<AddKebunController>();
                        if (isRegistered) {
                          AddKebunController controller = Get.find();
                          controller.reset();
                        }
                        Get.back();
                        Get.to(const AddKebunScreen(
                            null, null, null, null, null, null));
                      }),
                ],
              ),
              backgroundColor: Colors.white);
        },
        rightMenu: true,
        body: Obx(() => GoogleMap(
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (ctrl) => controller.mapsController.complete(ctrl),
              markers: Set.from(controller.listMarkers),
            )));
  }
}
