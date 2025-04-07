import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:smartdrainage/DrainDetails/DrainDetailScreen.dart';
import 'package:smartdrainage/Home/views/drainstatus.dart';
import 'package:smartdrainage/Home/views/model.dart';
import 'package:smartdrainage/Home/views/overview.dart';
import 'package:smartdrainage/Home/views/recentalerts.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  int active = 0;
  int partial = 0;
  int clean = 0;

  List<DrainModel> DrainList = [];
  fetchData() async {
    FirebaseDatabase database = FirebaseDatabase.instance;
    await database.ref().child('drain/').onValue.listen((value) {
      active = 0;
      partial = 0;
      clean = 0;
      DrainList = [];
      for (var data in value.snapshot.children) {
        DrainModel model = DrainModel(
            name: data.child("name").value.toString(),
            address: data.child("addresss").value.toString(),
            key: data.key!,
            level:
                double.parse(data.child("level").value.toString()).toDouble());

        DrainList.add(model);
      }
      for (var data in DrainList) {
        if (data.level > 18) {
          clean++;
        }

        if (data.level < 18 && data.level > 8) {
          partial++;
        }

        if (data.level < 8) {
          active++;
        }
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              width: 414.w,
              height: 70.h,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
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
            SizedBox(
              height: 10.h,
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Overview(
                    clean: clean,
                    model: DrainList,
                    aleart: active,
                    partial: partial,
                  ),
                  Drainstatus(
                    model: DrainList,
                  ),
                  //  Recentalerts()
                ],
              )),
            )),
          ],
        ),
      ),
    );
  }
}
