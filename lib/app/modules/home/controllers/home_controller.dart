import 'dart:convert';

import 'package:chat_bot/app/services/api/chat_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final TextEditingController keywordValue = TextEditingController();
  final RxMap chat_data = {
    // 1: {
    //   "id": 1,
    //   "message": "Halo",
    // },
  }.obs;
  final RxMap chat_data_0 = {
    1: {
      "id": 1,
      "message": "Halo",
    },
  }.obs;
  final ScrollController scrollController = ScrollController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    Future.delayed(1.seconds, () {
      chat_data_0[2] = {
        "id": 1,
        "message": "Selamat Datang di Aplikasi ChatBot ITG",
      };
    }).then((_) {
      Future.delayed(1.seconds, () {
        chat_data_0[3] = {
          "id": 1,
          "message": "Masukkan minimal satu kata ya, untuk hasil lebih maksimal satu kata lebih baik",
        };
      }).then((_) {
        Future.delayed(
          1.seconds,
          () {
            chat_data_0[4] = {
              "id": 99,
              "message": "atau pilih beberapa saran dari Kami",
            };
            chat_data_0[5] = {
              "id": 2,
              "message": "PMB",
            };
            chat_data_0[6] = {
              "id": 2,
              "message": "Pembayaran",
            };
            chat_data_0[7] = {
              "id": 2,
              "message": "Jadwal Dosen",
            };
            chat_data_0[8] = {
              "id": 2,
              "message": "Tentang aplikasi",
            };
          },
        );
      });
    });
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> getChat() async {
    if (keywordValue.text != "") {
      var chat_data_key = chat_data.length + 1;
      chat_data[chat_data_key] = {
        "id": 0,
        "message": keywordValue.text,
      };
      await ChatService().getChat(keywordValue.text).then((value) {
        if (value.statusCode == 200) {
          var jsonData = jsonDecode(value.body);
          if (jsonData["data"].length > 1) {
            chat_data_key += 1;
            chat_data[chat_data_key] = {
              "id": 99,
              "message": "Mungkin Maksud Anda",
            };
            jsonData["data"].forEach((element) {
              var chat_data_key = chat_data.length + 1;
              chat_data[chat_data_key] = {
                "id": 2,
                "message": element,
              };
            });
          } else if (jsonData["data"].length == 1) {
            var chat_data_key = chat_data.length + 1;
            chat_data[chat_data_key] = {
              "id": 1,
              "message": jsonData["data"][0],
            };
          } else {
            var chat_data_key = chat_data.length + 1;
            chat_data[chat_data_key] = {
              "id": 1,
              "message": "Maaf sepertinya belum ada jawaban untuk pertanyaan Anda",
            };
          }
        } else {
          Get.showSnackbar(
            GetSnackBar(
              title: "Oops!",
              message: "terjadi kesalahan di server",
            ),
          );
        }
      });
    } else {
      Get.showSnackbar(
        GetSnackBar(
          title: "Oops!",
          message: "pesan harus dimasukkan",
        ),
      );
    }
  }
}
