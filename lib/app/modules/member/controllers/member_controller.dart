import 'package:flutter/material.dart';
import 'package:flutter_getx_ttr/app/data/model/author.dart';
import 'package:flutter_getx_ttr/app/data/provider/api_provider.dart';
import 'package:get/get.dart';

class MemberController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final listNormalMember = [].obs;
  final listPremiumMember = [].obs;
  final isShowing = true.obs;
  final _isHaveNextPage = true.obs;
  final _isFirstLoadRunning = false.obs;
  final _isLoadMoreRunning = false.obs;
  final _post = <User>[].obs;
  final _page = 0.obs;

  late TabController tabController;
  late ScrollController scrollController;

  @override
  void onInit() {
    super.onInit();
    firtLoad();
    addNormalMEmber();
    addPremiumMember();
    tabController = TabController(length: 2, vsync: this);
    wipeController();
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

  firtLoad() async {
    try {
      var listData = await UserProvider().fetchUserWithLimit(page: _page.value);
      _post.assignAll(listData!);
    } catch (e) {
      print(e);
    }
  }

  loadMore() async {
    if (_isHaveNextPage.value == true &&
        _isFirstLoadRunning.value == false &&
        _isLoadMoreRunning.value == false &&
        scrollController.position.extentAfter < 300) {
      _isLoadMoreRunning.value = true;
      _page.value += 1;
      try {
        var fetchedPost =
            await UserProvider().fetchUserWithLimit(page: _page.value);
        if (fetchedPost!.isNotEmpty) {
          _post.addAll(fetchedPost);
        } else {
          _isHaveNextPage.value = false;
        }
      } catch (e) {}
    } else {}
  }

  addNormalMEmber() async {
    var list = await UserProvider().fetchNormalMember();
    listNormalMember.assignAll(list!);
  }

  addPremiumMember() async {
    var list = await UserProvider().fetchPremiumMember();
    listPremiumMember.assignAll(list!);
  }

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
