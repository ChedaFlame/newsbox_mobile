import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../features/screens/home_screen.dart';



class RootView extends StatefulWidget {
  final int? currentIndex;
  const RootView(this.currentIndex, {super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  final currentIndex = 0.obs;

  List<Widget> pages = [
    HomeScreen(),
    Container(),
    Container(),
   ];

  Widget get currentPage => pages[currentIndex.value];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Obx(() {
      return Scaffold(
          body: currentPage,
      );
    });
  }



}




