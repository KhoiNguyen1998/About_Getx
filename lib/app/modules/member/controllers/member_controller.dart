import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_ttr/app/data/model/author.dart';
import 'package:flutter_getx_ttr/app/data/provider/api_provider.dart';
import 'package:get/get.dart';

class MemberController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // final listNormalMember = [].obs;
  // final listPremiumMember = [].obs;
  final isShowing = true.obs;
  final isHaveNextPage = true.obs;
  final isFirstLoadRunning = false.obs;
  final isLoadMoreRunning = false.obs;
  final post = <User>[].obs;
  final page = 0.obs;

  late TabController tabController;
  late ScrollController scrollController;

  @override
  void onInit() {
    firstLoad();
    scrollController = ScrollController()..addListener(loadMore);
    loadMore();
    // addNormalMEmber();
    // addPremiumMember();
    tabController = TabController(length: 2, vsync: this);
    wipeController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    tabController.dispose();
    scrollController.removeListener(loadMore);
    super.onClose();
  }

  firstLoad() async {
    try {
      var listData = await UserProvider().fetchUserWithLimit(
        page: page.value,
      );
      post.assignAll(listData!);
    } catch (e) {
      print(e);
    }
  }

  loadMore() async {
    if (isHaveNextPage.value == true &&
        isFirstLoadRunning.value == false &&
        isLoadMoreRunning.value == false &&
        scrollController.position.extentAfter < 300) {
      page.value += 1;
      try {
        var fetchedPost = await UserProvider().fetchUserWithLimit(
          page: page.value,
        );
        if (fetchedPost!.isNotEmpty) {
          post.assignAll(fetchedPost);
        } else {
          isHaveNextPage.value = false;
        }
      } catch (e) {
        if (kDebugMode) {
          print('Something went wrong');
        }
      }
      // isLoadMoreRunning.value = false;
    }
  }

  // addNormalMEmber() async {
  //   var list = await UserProvider().fetchNormalMember();
  //   listNormalMember.assignAll(list!);
  // }

  // addPremiumMember() async {
  //   var list = await UserProvider().fetchPremiumMember();
  //   listPremiumMember.assignAll(list!);
  // }

  wipeController() {
    tabController.addListener(() {
      switch (tabController.index) {
        case 0:
          isShowing.value = true;
          print(tabController.index.toString());
          break;
        case 1:
          isShowing.value = false;
          print(tabController.index.toString());
          break;
        default:
      }
    });
  }
}
