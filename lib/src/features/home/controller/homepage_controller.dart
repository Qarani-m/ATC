import 'package:get/get.dart';

import 'package:atc/src/features/events/home_events.dart';
import 'package:atc/src/features/home/screen/home_main.dart';
import 'package:atc/src/features/hostel_finder/screen/hostelfinder_home.dart';
import 'package:atc/src/features/market_place/screens/home_market.dart';
import 'package:atc/src/features/settings/screens/settings_home.dart';
import 'package:flutter/material.dart';

class HomePageController extends GetxController {
  List<Widget> pages = [
    const HomePage(),
    HostelFinderHome(),
    const MarketPlaceHome(),
    const EventsHome(),

    // const SettingsHome(),
  ];
  RxInt currentPageIndex = 0.obs;

  void changePage(){

  }
}
