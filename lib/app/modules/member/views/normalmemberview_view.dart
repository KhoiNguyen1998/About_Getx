import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_ttr/app/data/model/author.dart';
import 'package:flutter_getx_ttr/until/const/const.dart';
import 'package:flutter_getx_ttr/until/responsive_text.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NormalMember extends GetView {
  const NormalMember({
    Key? key,
    required this.item,
  }) : super(key: key);

  final User item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(13, 20, 16, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 72,
            height: 18,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: blueBorderColor),
            ),
            child: Text(
              confirmedpersonaldocuments,
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSans(
                fontSize: 8,
                fontWeight: FontWeight.w400,
                color: blueBorderColor,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
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
                  minFontSize: 8,
                  maxFontSize: 15,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.notoSans(fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
