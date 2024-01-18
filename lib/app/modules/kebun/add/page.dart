import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kopay/app/modules/kebun/add/controller.dart';
import 'package:kopay/app/themes/app_colors.dart';
import 'package:kopay/app/themes/app_text_themes.dart';
import 'package:kopay/app/widget/atoms/primary_button.dart';
import 'package:kopay/app/widget/molecule/blue_scaffold.dart';
import 'package:kopay/app/widget/molecule/custom_text_form.dart';

class AddKebunScreen extends GetView<AddKebunController> {
  const AddKebunScreen(this.id, this.title, this.penyakit, this.posisiTanam,
      this.imageBase64, this.location,
      {super.key});

  final String? id;
  final String? title;
  final String? penyakit;
  final String? posisiTanam;
  final String? imageBase64;
  final LatLng? location;

  @override
  Widget build(BuildContext context) {
    Get.put(AddKebunController());

    controller.collectionID(id);
    controller.setDefaultData(title ?? "", location ?? LatLng(0, 0),
        posisiTanam ?? "", penyakit ?? "", imageBase64);

    return BlueScaffold(
        body: Form(
      key: controller.formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Obx(
                () => Visibility(
                  visible: controller.collectionID.value.isEmpty,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lokasi Saat Ini",
                        style: titleLG.copyWith(fontSize: 14),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
                          border:
                              Border.all(width: 2, color: PrimaryColor.main),
                          color: const Color.fromARGB(255, 199, 198, 198),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/images/svg/icon_pin.svg",
                                width: 24,
                                height: 24,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Obx(() => Text(
                                      "Lat: ${controller.currentPosition.value.latitude}")),
                                  Obx(() => Text(
                                      "Lng: ${controller.currentPosition.value.longitude}"))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextForm(
                  controller: controller.titleController,
                  hint: "Masukan nama untuk tempat ini",
                  title: "Judul Tempat",
                  validator: (error) {
                    return "";
                  }),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Posisi Tanam",
                style: labelLG,
              ),
              const SizedBox(
                height: 8,
              ),
              dropdownPosisiTanam(),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Penyakit",
                style: labelLG,
              ),
              const SizedBox(
                height: 8,
              ),
              dropdownPenyakit(),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Foto",
                style: labelLG,
              ),
              Obx(
                () => Visibility(
                  visible: controller.hasImage.value,
                  child: (controller.hasImage.value)
                      ? FutureBuilder(
                          future: controller.selectedPhoto.value.readAsBytes(),
                          builder: (context, snapshot) {
                            print(snapshot.data);
                            return SizedBox(
                                height: 200,
                                child: Image.memory(snapshot.data!));
                          },
                        )
                      : Container(),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Obx(
                () => PrimaryButton(
                    title: (!controller.hasImage.value)
                        ? "Tambahkan Foto"
                        : "Ganti Foto",
                    onClick: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return MediaBottomSheet(controller: controller);
                          });
                    }),
              ),
              const SizedBox(
                height: 16,
              ),
              Obx(
                () => (controller.collectionID.isEmpty)
                    ? PrimaryButton(
                        title: "Simpan",
                        onClick: () {
                          controller.doSave();
                        })
                    : PrimaryButton(
                        title: "Ubah Data",
                        onClick: () {
                          controller.doEdit();
                        }),
              )
            ],
          ),
        ),
      ),
    ));
  }

  DropdownMenu<PosisiTanamEnum> dropdownPosisiTanam() {
    return DropdownMenu<PosisiTanamEnum>(
        width: Get.width - 32,
        onSelected: (value) => controller.selectedPosisiTanam = value,
        controller: controller.masaPanenController,
        initialSelection: PosisiTanamEnum.masaTanam,
        dropdownMenuEntries: PosisiTanamEnum.values
            .map<DropdownMenuEntry<PosisiTanamEnum>>((PosisiTanamEnum item) {
          return DropdownMenuEntry<PosisiTanamEnum>(
            value: item,
            label: item.label,
            style: MenuItemButton.styleFrom(),
          );
        }).toList());
  }

  DropdownMenu<PenyakitEnum> dropdownPenyakit() {
    return DropdownMenu<PenyakitEnum>(
        width: Get.width - 32,
        onSelected: (value) => controller.selectedPenyakit = value,
        controller: controller.penyakitController,
        initialSelection: PenyakitEnum.matiRanting,
        dropdownMenuEntries: PenyakitEnum.values
            .map<DropdownMenuEntry<PenyakitEnum>>((PenyakitEnum item) {
          return DropdownMenuEntry<PenyakitEnum>(
            value: item,
            label: item.label,
            style: MenuItemButton.styleFrom(),
          );
        }).toList());
  }
}

class MediaBottomSheet extends StatelessWidget {
  const MediaBottomSheet({
    super.key,
    required this.controller,
  });

  final AddKebunController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            PrimaryButton(
                title: "Kamera",
                onClick: () {
                  Get.back();
                  controller.addImage(ImageSource.camera);
                }),
            const SizedBox(
              height: 16,
            ),
            PrimaryButton(
                title: "Galeri",
                onClick: () {
                  Get.back();
                  controller.addImage(ImageSource.gallery);
                }),
          ]),
    );
  }
}
