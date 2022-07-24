import 'package:flutter/material.dart';
import 'package:flutter_getx_ttr/app/modules/member/views/member_view.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Obx(() => Text(controller.count.toString())),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Get.to(MemberView(), arguments: 'Hello i am from home page');
              },
              child: Text('Go to Member Page'),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                controller.increment();
              },
              child: Text('Obx(()=> c'),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                controller.decrement();
              },
              child: Text('Increment'),
            ),
          ),
        ],
      ),
    );
  }
}
