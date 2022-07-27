// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_ttr/app/data/provider/api_provider.dart';
import 'package:get/get.dart';

class MemberController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final listNormalMember = [].obs;
  final listPremiumMember = [].obs;

  RxBool isLoading = false.obs;

  // final iconStatus = false.obs;
  // final tabIndex = 0.obs;
  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    addNormalMEmber();
    addPremiumMember();
    tabController = TabController(length: 2, vsync: this);
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
    isLoading.value = true;
    var list = await UserProvider().fetchNormalMember();
    if (list != null) {
      listNormalMember.assignAll(list);
    }
  }

  addPremiumMember() async {
    isLoading.value = true;
    var list = await UserProvider().fetchPremiumMember();
    if (list != null) {
      listPremiumMember.assignAll(list);
    }
  }
}
