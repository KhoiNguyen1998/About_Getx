// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_ttr/app/data/provider/api_provider.dart';
import 'package:get/get.dart';

class MemberController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final listNormalMember = [].obs;
  final listPremiumMember = [].obs;

  final iconStatus = false.obs;
  final tabIndex = 0.obs;
  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    addNormalMEmber();
    addPremiumMember();
    tabController = TabController(length: 2, vsync: this);
    // tabController.addListener(() {
    //   if (tabController.index == 0) {
    //   } else {}
    // });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  addNormalMEmber() async {
    var list = await UserProvider().fetchNormalMember();
    if (list != null) {
      listNormalMember.assignAll(list);
    }
  }

  addPremiumMember() async {
    var list = await UserProvider().fetchPremiumMember();
    if (list != null) {
      listPremiumMember.assignAll(list);
    }
  }
}
