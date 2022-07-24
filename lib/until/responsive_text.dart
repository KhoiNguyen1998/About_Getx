import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_ttr/until/const/const.dart';

class ResponsiveText extends StatelessWidget {
  const ResponsiveText({Key? key, required this.text}) : super(key: key);
  final text;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      group: myGroup,
      presetFontSizes: [10],
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}
