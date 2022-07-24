import 'package:flutter/material.dart';
import 'package:flutter_getx_ttr/app/data/model/author.dart';
import 'package:flutter_getx_ttr/until/const/const.dart';
import 'package:flutter_getx_ttr/until/responsive_text.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/member_controller.dart';

class MemberView extends GetView<MemberController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 82,
            backgroundColor: headerColor,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(svg_back),
                ),
                SvgPicture.asset(svg_logo),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(svg_setting),
                ),
              ],
            ),
          ),
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.only(right: 10.0),
                color: searchBoxColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(svg_search),
                    ),
                    Text(
                      sortByConditions,
                      style: TextStyle(
                          fontSize: 10.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              TabBar(
                controller: controller.tabController,
                unselectedLabelColor: unSelectLabelColor,
                labelColor: selectedLabelColor,
                isScrollable: true,
                indicatorColor: Colors.transparent,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                tabs: [
                  Tab(
                    child: Container(
                      child: Row(
                        children: [
                          SvgPicture.asset(svg_clock),
                          // Obx(() => controller.selectedIndex),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            showRecentlyLoggedUsers,
                            style: TextStyle(fontSize: 10.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: [
                        SvgPicture.asset(svg_monorchy),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          showUsersRank,
                          style: TextStyle(fontSize: 10.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                height: 1,
              ),
              Expanded(
                child: TabBarView(
                  // physics: NeverScrollableScrollPhysics(),
                  controller: controller.tabController,
                  children: [
                    Obx(() => gridMember(controller.listNormalMember)),
                    Obx(() => gridMember(controller.listPremiumMember)),
                  ],
                ),
              ),
            ],
          ),
          //  buildTabbar(),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: backgroundAppbarColor,
            selectedItemColor: textBottombarColor,
            unselectedItemColor: colorBottomIcon,
            unselectedLabelStyle: TextStyle(
              color: textBottombarColor,
              overflow: TextOverflow.ellipsis,
            ),
            selectedLabelStyle: TextStyle(color: textBottombarColor),
            showUnselectedLabels: true,
            showSelectedLabels: true,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset(svg_home),
                label: home,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(svg_account),
                label: myPage,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(svg_speaker),
                label: userAnnouncement,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(svg_event),
                label: eventCommunity,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(svg_members),
                label: listMember,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(svg_message),
                label: message,
              ),
            ],
          ),
        ),
      ),
    );
  }

  GridView gridMember(RxList list) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        childAspectRatio: 1.6,
        mainAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        User item = list[index];
        return Container(
          padding: EdgeInsets.fromLTRB(13, 10, 16, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage('${item.avatar}'),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ResponsiveText(text: '${item.name}'),
                            ResponsiveText(text: '${item.age}')
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ResponsiveText(text: '${item.position}'),
                            ResponsiveText(text: '${item.job}')
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ResponsiveText(text: '${item.company}'),
                                ResponsiveText(text: '${item.address}'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text(
                  //       '${item.company}',
                  //       overflow: TextOverflow.ellipsis,
                  //       maxLines: 1,
                  //       style: TextStyle(
                  //         fontSize: 10,
                  //       ),
                  //     ),
                  //     Text(
                  //       '${item.address}',
                  //       overflow: TextOverflow.ellipsis,
                  //       maxLines: 1,
                  //       style: TextStyle(
                  //         fontSize: 10,
                  //       ),
                  //     ),

                  //     // ResponsiveText(text: '${item.name}'),
                  //     // ResponsiveText(text: '${item.position}'),
                  //     // ResponsiveText(text: '${item.company}'),
                  //     // ResponsiveText(text: '${item.address}'),
                  //   ],
                  // ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(12),
                height: 38,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(
                      color: boderContainerColor,
                      width: 0.3,
                    )),
                child: ResponsiveText(text: '${item.bio}'),
              ),
            ],
          ),
        );
      },
    );
  }
}
