import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paysense/utils/colors.dart';

class RequestMoneyController extends GetxController {
  final List<Map<String, dynamic>> allPlayers = [
    {"contactname": "Jibran Ali","contactno": "PaySense*323", "contactcolor": ColorUtil.containercolor,"contactdemo":"JA"},
    {"contactname": "Muhammad Haris", "contactno": "PaySense*323","contactcolor": const Color(0xff21A500),"contactdemo":"MH"},
    {"contactname": "Rehan Sattar", "contactno": "PaySense*323","contactcolor": const Color(0xffFF325B),"contactdemo":"RS"},
   
  ];
  Rx<List<Map<String, dynamic>>> foundPlayers =
      Rx<List<Map<String, dynamic>>>([]);

  @override
  void onInit() {
    super.onInit();
    foundPlayers.value = allPlayers;
  }

 

  @override
  void onClose() {}
  void filterPlayer(String playerName) {
    List<Map<String, dynamic>> results = [];
    if (playerName.isEmpty) {
      results = allPlayers;
    } else {
      results = allPlayers
          .where((element) => element["contactname"]
              .toString()
              .toLowerCase()
              .contains(playerName.toLowerCase()))
          .toList();
    }
    foundPlayers.value = results;
  }
}
