import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jobhubv2_0/constants/app_constants.dart';
import 'package:jobhubv2_0/views/common/app_bar.dart';
import 'package:jobhubv2_0/views/common/app_style.dart';
import 'package:jobhubv2_0/views/common/drawer/drawer_widget.dart';
import 'package:jobhubv2_0/views/common/heading_widget.dart';
import 'package:jobhubv2_0/views/common/reusable_text.dart';
import 'package:jobhubv2_0/views/common/search.dart';
import 'package:jobhubv2_0/views/screens/auth/profile_page.dart';
import 'package:jobhubv2_0/views/screens/jobs/widgets/popular_jobs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(40.h),
            child: CustomAppBar(
                actions: [
                  Padding(
                    padding: EdgeInsets.all(12.0.h),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => ProfilePage(drawer: false));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(50.h)),
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                          height: 25.w,
                          width: 25.w,
                        ),
                      ),
                    ),
                  )
                ],
                child: Padding(
                  padding: EdgeInsets.all(8.0.h),
                  child: DrawerWidget(color: Color(kDark.value)),
                ))),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Search \n Find & Apply",
                  style: appStyle(38, Color(kDark.value), FontWeight.bold),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SearchWidget(
                  onTap: () {},
                ),
                SizedBox(
                  height: 30.h,
                ),
                HeadingWidget(text: "Popular Jobs"),
                SizedBox(
                  height: 15.h,
                ),
                PopularJobs(),
                SizedBox(
                  height: 15.h,
                ),
                HeadingWidget(text: "Recently Posted"),
              ],
            ),
          ),
        )));
  }
}
