import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/member/bindings/member_binding.dart';
import '../modules/member/views/member_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.member;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.member,
      page: () => MemberView(),
      binding: MemberBinding(),
    ),
  ];
}
