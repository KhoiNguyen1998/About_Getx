// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_ttr/app/data/provider/api_provider.dart';
import 'package:get/get.dart';

class MemberController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final listNormalMember = [].obs;
  final listPremiumMember = [].obs;
  final isFetching = false.obs;

  late TabController tabController;
  // final _swipeIsInProgress = false.obs;
  // final _tapIsBeingExecuted = false.obs;
  // RxInt selectedIndex = 0.obs;
  // final prevIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    addNormalMEmber();
    addPremiumMember();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        // selectedIndex = tabController.index as RxInt;
      } else {}
    });
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

  fetchingData() {
    if (isFetching == true) {
    } else {}
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
