import 'package:auto_size_text/auto_size_text.dart';
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
                          SvgPicture.asset(svg_dis_Clock),
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
                  controller: controller.tabController,
                  children: [
                    Obx(() => gridMember(controller.listNormalMember,
                        controller.addNormalMEmber())),
                    Obx(() => gridMember(controller.listPremiumMember,
                        controller.addPremiumMember())),
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

  Widget gridMember(RxList list, refresh) {
    return RefreshIndicator(
      onRefresh: () => refresh,
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          childAspectRatio: 1.6,
          mainAxisSpacing: 16,
          mainAxisExtent: 150,
        ),
        itemBuilder: (context, index) {
          User item = list[index];
          return Container(
            padding: EdgeInsets.fromLTRB(13, 20, 16, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage('${item.avatar}'),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ResponsiveText(text: '${item.name}'),
                          ResponsiveText(text: '${item.position}'),
                          ResponsiveText(text: '${item.company}'),
                          ResponsiveText(text: '${item.address}'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ResponsiveText(text: '${item.age}'),
                          ResponsiveText(text: '${item.job}'),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    height: 38,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        border: Border.all(
                          color: boderContainerColor,
                          width: 0.3,
                        )),
                    child: Center(
                      child: AutoSizeText(
                        '${item.bio}',
                        maxLines: 2,
                        minFontSize: 10,
                        maxFontSize: 15,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
