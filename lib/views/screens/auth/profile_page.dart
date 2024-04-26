import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobhubv2_0/views/common/BackBtn.dart';
import 'package:jobhubv2_0/views/common/app_bar.dart';
import 'package:jobhubv2_0/views/common/drawer/drawer_widget.dart';
import 'package:jobhubv2_0/views/common/exports.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.drawer});
  final bool drawer;
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.h),
          child: CustomAppBar(
              child: Padding(
            padding: EdgeInsets.all(8.0.h),
            child: widget.drawer == false
                ? BackBtn()
                : DrawerWidget(color: Color(kDark.value)),
          ))),
      body: Center(
        child: ReusableText(
            text: "Profile Page",
            style: appStyle(40, Color(kDark.value), FontWeight.bold)),
      ),
    );
  }
}
