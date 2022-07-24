import 'package:flutter/material.dart';
import 'package:flutter_getx_ttr/app/data/model/author.dart';
import 'package:flutter_getx_ttr/until/const/const.dart';
import 'package:flutter_getx_ttr/until/responsive_text.dart';
import 'package:get/get.dart';

class BuildTabbarView extends StatelessWidget {
  BuildTabbarView({Key? key, required this.listMember}) : super(key: key);
  final RxList<User> listMember;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: listMember.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        childAspectRatio: 1.6,
        mainAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        User item = listMember[index];
        return Container(
          padding: EdgeInsets.fromLTRB(13, 10, 16, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage('${item.avatar}'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ResponsiveText(text: '${item.name}'),
                        ResponsiveText(text: '${item.position}'),
                        ResponsiveText(text: '${item.company}'),
                        ResponsiveText(text: '${item.address}'),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ResponsiveText(text: '${item.age}'),
                        ResponsiveText(text: '${item.job}'),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(12),
                height: 38,
                width: 171,
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
