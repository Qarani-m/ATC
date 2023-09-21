// ignore_for_file: deprecated_member_use


import 'package:atc/src/constants/colors.dart';
import 'package:atc/src/features/home/controller/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    HomePageController homePageController  =Get.put(HomePageController());

  var _selectedColor = AppColors.secondaryColor;
    return  Scaffold(
      backgroundColor: AppColors.whiteColor,
      bottomNavigationBar: SalomonBottomBar(
      currentIndex:homePageController.currentPageIndex.value,
      onTap: (index) {
        setState(() {
          print(index);
          homePageController.currentPageIndex.value =index;

        });
      },
      // onTap: (i) => setState(() => _currentIndex = i; ),
      selectedItemColor: AppColors.accentColor,
      items: [
        /// Home
        SalomonBottomBarItem(
          icon: SvgPicture.asset(
            "assets/images/svg/home.svg",
            color: _selectedColor,
            height: 20.h,
          ),
          title: Text(
            "Home",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          selectedColor: _selectedColor,
        ),
        SalomonBottomBarItem(
          icon: SvgPicture.asset("assets/images/svg/book.svg",
              color: _selectedColor, height: 20.h),
          title: Text(
            "Hostel",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          selectedColor: _selectedColor,
        ),
        SalomonBottomBarItem(
          icon: SvgPicture.asset("assets/images/svg/comment.svg",
              color: _selectedColor, height: 20.h),
          title: Text(
            "Market",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          selectedColor: _selectedColor,
        ),
        SalomonBottomBarItem(
          icon: SvgPicture.asset("assets/images/svg/user.svg",
              color: _selectedColor, height: 20.h),
          title: Text(
            "Events",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          selectedColor: _selectedColor,
        ),
      ],
    ),
      body: Obx(()=> homePageController.pages[homePageController.currentPageIndex.value]),
    );
  }
}
