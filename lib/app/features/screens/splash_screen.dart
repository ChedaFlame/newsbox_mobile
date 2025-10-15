import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:newsbox/app/app_utils/common/theme_colors.dart';

import '../../app/routes/app_routes.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen( {super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    setState(() {
      Timer(const Duration(seconds: 3),
            () =>  Get.offNamed(Routes.root),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ThemeColors.white,
      body: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            Container(
              width: width,
              height: height,
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/newsbox.png',
                width: 250.0,
                height: 250.0,
                //fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
              bottom: 30.0,
              child: SizedBox(
                width: width,
                child: const SpinKitRing(
                  color: ThemeColors.primaryColor,
                  size: 50.0,
                  lineWidth: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
