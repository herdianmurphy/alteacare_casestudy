import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Toolbar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  Toolbar({required this.title});

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(title, style: TextStyle(color: ColorResource().mainGreen)),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      );
    } else if (Platform.isIOS) {
      return AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(title, style: TextStyle(color: ColorResource().mainGreen)),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      );
    }
    return Container();
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
