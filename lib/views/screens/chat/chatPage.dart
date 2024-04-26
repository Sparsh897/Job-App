import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobhubv2_0/constants/app_constants.dart';
import 'package:jobhubv2_0/views/common/app_bar.dart';
import 'package:jobhubv2_0/views/common/app_style.dart';
import 'package:jobhubv2_0/views/common/drawer/drawer_widget.dart';
import 'package:jobhubv2_0/views/common/reusable_text.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.h),
          child: CustomAppBar(
              child: Padding(
            padding: EdgeInsets.all(8.0.h),
            child: DrawerWidget(color: Color(kDark.value)),
          ))),
      body: Center(
        child: ReusableText(
            text: "Profile Page",
            style: appStyle(40, Color(kDark.value), FontWeight.bold)),
      ),
    );
  }
}
