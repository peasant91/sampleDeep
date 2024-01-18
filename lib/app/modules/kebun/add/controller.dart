import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kopay/app/constants.dart';
import 'package:kopay/app/modules/map/controller.dart';
import 'package:kopay/app/themes/app_colors.dart';
import 'package:kopay/app/widget/molecule/common_error_dialog.dart';

enum PosisiTanamEnum {
  masaTanam(0, "Masa Tanam"),
  pemupukan(1, "Pemupukan"),
  panen(2, "Panen");

  const PosisiTanamEnum(this.id, this.label);
  final int id;
  final String label;
}

enum PenyakitEnum {
  matiRanting(0, "Mati Ranting"),
  bercakDaun(1, "Bercak Daun"),
  jamurUpas(2, "Jamur Upas"),
  rebahBatang(3, "Rebah Batang");

  const PenyakitEnum(this.id, this.label);
  final int id;
  final String label;
}

class AddKebunController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController masaPanenController = TextEditingController();
  final TextEditingController penyakitController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final db = FirebaseFirestore.instance;
  final box = GetStorage();

  PosisiTanamEnum? selectedPosisiTanam;
  PenyakitEnum? selectedPenyakit;

  Rx<LatLng> currentPosition = const LatLng(0, 0).obs;

  // var isEdit = false.obs;
  var collectionID = "".obs;

  var hasImage = false.obs;
  var selectedPhoto = XFile("").obs;
  final ImagePicker imagePicker = ImagePicker();

  @override
  void onReady() async {
    super.onReady();

    if (collectionID.isEmpty) {
      getLocation();
    }
  }

  void addImage(ImageSource source) async {
    var image = await imagePicker.pickImage(source: source, imageQuality: 0);
    hasImage(true);
    selectedPhoto(image);
  }

  bool isValid(bool checkLocation) {
    if (checkLocation) {
      if (currentPosition.value.latitude == 0 ||
          currentPosition.value.longitude == 0) {
        Get.dialog(CommonErrorDialog(
            iconName: "",
            title: "Lokasi belum ditemukan",
            desc: "Mohon berikan akses untuk lokasi",
            buttonTitle: "OK",
            onClick: () {}));
        return false;
      }
    }

    if (titleController.text.isEmpty) {
      Get.dialog(CommonErrorDialog(
          iconName: "",
          title: "Judul tidak boleh kosong",
          desc: "Mohon masukan nama untuk tempat tersebut",
          buttonTitle: "OK",
          onClick: () {}));
      return false;
    }

    if (masaPanenController.text.isEmpty) {
      Get.dialog(CommonErrorDialog(
          iconName: "",
          title: "Posisi Tanam Tidak boleh kosong",
          desc: "Mohon pilih salah satu dari pilihan yang tersedia",
          buttonTitle: "OK",
          onClick: () {}));
      return false;
    }

    return true;
  }

  void doSave() async {
    if (!isValid(true)) {
      return;
    }

    String codeCtrl = await box.read(Constants.userClient);
    String imageData = "";
    if (!(await isEmptyImage())) {
      final bytes = await selectedPhoto.value.readAsBytes();
      imageData = base64Encode(bytes);
    }

    db.collection("data").doc(codeCtrl).collection("markers").doc().set({
      "title": titleController.text,
      "masaTanam": masaPanenController.text,
      "penyakit": penyakitController.text,
      "image": imageData,
      "location": GeoPoint(
          currentPosition.value.latitude, currentPosition.value.longitude)
    }).then((value) {
      MapController controller = Get.find();
      controller.reset();
      Get.back();
      // Get.to(const MapScreen());
    });
  }

  void doEdit() async {
    if (!isValid(false)) {
      return;
    }

    String codeCtrl = await box.read(Constants.userClient);
    String imageData = "";
    if (!await isEmptyImage()) {
      final bytes = await selectedPhoto.value.readAsBytes();
      print(bytes);
      imageData = base64Encode(bytes);
    }

    db
        .collection("data")
        .doc(codeCtrl)
        .collection("markers")
        .doc(collectionID.value)
        .update({
      "title": titleController.text,
      "masaTanam": masaPanenController.text,
      "penyakit": penyakitController.text,
      "image": imageData,
      "location": GeoPoint(
          currentPosition.value.latitude, currentPosition.value.longitude)
    }).then((value) {
      MapController controller = Get.find();
      controller.reset();
      Get.back();
    });
  }

  Future<bool> isEmptyImage() async {
    if (!hasImage.value) {
      return true;
    }

    var imageData = await selectedPhoto.value.readAsBytes();
    return imageData.isEmpty;
  }

  void setPhoto(String photo) {
    var data = XFile.fromData(base64Decode(photo), path: "UploadedImage");
    hasImage(true);
    selectedPhoto(data);
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      Get.defaultDialog(
          title: "Izin untuk akses Lokasi",
          middleText:
              "Aplikasi menggunakan lokasi untuk mengetahui lokasi anda agar dapat disimpan kedalam sistem.\n\nApakah anda ingin mengizinkan aplikasi ini untuk akses lokasi anda?",
          textConfirm: "Berikan izin Lokasi?",
          confirmTextColor: Colors.white,
          buttonColor: PrimaryColor.main,
          onConfirm: () async {
            Get.back();
            permission = await Geolocator.requestPermission();
            getLocation();
          });

      if (permission == LocationPermission.denied) {
        print("DENIED BROH");
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      print("DENIED FOREVER BROH");
      return false;
    }
    return true;
  }

  void reset() async {
    masaPanenController.clear();
    penyakitController.clear();
    titleController.clear();
    selectedPhoto(null);
  }

  void setDefaultData(String defaultTitle, LatLng defaultLocation,
      String posisiTanam, String penyakit, String? image) async {
    titleController.text = defaultTitle;
    currentPosition(defaultLocation);
    penyakitController.text = penyakit;
    masaPanenController.text = posisiTanam;
    if (image != null && image.isNotEmpty) {
      setPhoto(image);
    }
  }

  void getLocation() async {
    final hasPermission = await _handleLocationPermission();

    if (hasPermission) {
      var position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      currentPosition(LatLng(position.latitude, position.longitude));
    }
  }
}
