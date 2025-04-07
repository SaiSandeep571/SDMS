import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:smartdrainage/DrainDetails/DrainDetailScreen.dart';
import 'package:smartdrainage/Home/views/model.dart';

class Drainstatus extends StatelessWidget {
  List<DrainModel> model;
  Drainstatus({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Live Status of Drains',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          for (var data in model)
            _drainstatbox(
                '${data.key}',
                '${data.address}',
                (data.level > 18)
                    ? "Clean"
                    : data.level > 8
                        ? "Partial"
                        : "Full",
                (data.level > 18)
                    ? Colors.green
                    : data.level > 8
                        ? Colors.orange
                        : Colors.red,
                data),
        ],
      ),
    );
  }

  _drainstatbox(String id, location, status, Color icolor, DrainModel model) {
    return InkWell(
      onTap: () {
        Get.to(
            () => DrainDetails(
                  model: model,
                ),
            transition: Transition.downToUp);
      },
      child: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: icolor.withOpacity(0.1),
                border: Border.all(
                    color: icolor.withOpacity(0.5)), // For clean status
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Drain ID:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            id,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        location,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: icolor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      status,
                      style: TextStyle(
                        color: icolor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
