import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:jobhubv2_0/controllers/zoom_provider.dart';
import 'package:jobhubv2_0/controllers/zoom_provider.dart';
import 'package:jobhubv2_0/views/common/drawer/drawerScreen.dart';
import 'package:jobhubv2_0/views/common/exports.dart';
import 'package:jobhubv2_0/views/common/reusable_text.dart';
import 'package:jobhubv2_0/views/screens/applications/applied_jobs.dart';
import 'package:jobhubv2_0/views/screens/auth/profile_page.dart';
import 'package:jobhubv2_0/views/screens/bookmark/bookmarks_page.dart';
import 'package:jobhubv2_0/views/screens/chat/chatPage.dart';
import 'package:jobhubv2_0/views/screens/home/homePage.dart';
import 'package:provider/provider.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<ZoomNotifier>(
      builder: (context, zoonNotifier, child) {
        return ZoomDrawer(
            menuScreen: DrawerScreen(indexSetter: (index) {
              zoonNotifier.currentIndex = index;
            }),
            borderRadius: 30,
            menuBackgroundColor: Color(kLightBlue.value),
            angle: 0.0,
            mainScreen: currentScreen());
      },
    ));
  }

  Widget currentScreen() {
    var zoomnotifier = Provider.of<ZoomNotifier>(context);
    switch (zoomnotifier.currentIndex) {
      case 0:
        return HomePage();
      case 1:
        return ChatList();
      case 2:
        return BookMarksPage();
      case 3:
        return AppliedJobs();
      case 4:
        return ProfilePage(
          drawer: true,
        );
      default:
        return HomePage();
    }
  }
}
