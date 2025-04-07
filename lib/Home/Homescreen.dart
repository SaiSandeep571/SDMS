import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:smartdrainage/DrainDetails/DrainDetailScreen.dart';
import 'package:smartdrainage/Home/views/drainstatus.dart';
import 'package:smartdrainage/Home/views/overview.dart';
import 'package:smartdrainage/Home/views/recentalerts.dart';
class Homescreen
 extends StatelessWidget {
  const Homescreen
  ({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              width: 414.w,
              height: 70.h,
              padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Icon(Icons.arrow_back),
                  ),
                  Spacer(),
                  Text(
                        'SDMS',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                  Spacer(),
                  Container(
                    child: Icon(Icons.menu),
                  )
                ],
              ),
            ),
            SizedBox(height: 10.h,),
            Expanded(child: 
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: SingleChildScrollView(child: 
              Column(
                children: [
                  Overview(),

                  InkWell(onTap: (){
                    Get.to(()=>DrainDetails(),
                      );
                  },
                    child: Drainstatus()),

                  Recentalerts()
                ],
              )),
            )),
          ],
        ),
      ),
    );
  }
}