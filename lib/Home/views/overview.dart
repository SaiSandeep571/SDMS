import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartdrainage/Home/views/model.dart';

class Overview extends StatelessWidget {
  List<DrainModel> model;

  int clean, aleart, partial;
  Overview(
      {super.key,
      required this.model,
      required this.clean,
      required this.aleart,
      required this.partial});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _statbox('Total Drains', '${model.length}', '^ 12% from last month',
              Colors.blue, Colors.blue, Icons.bolt),
          _statbox('Active Alerts', '$aleart', '3 new alerts', Colors.red,
              Colors.red, Icons.warning_rounded),
          _statbox('Near Threshold', '$partial', '5 new alerts', Colors.orange,
              Colors.orange, Icons.settings),
          _statbox('Clean Drains', '$clean', '3 cleaned today', Colors.green,
              Colors.green, Icons.check_circle_outline),
        ],
      ),
    );
  }

  Container _statbox(String title, value, subtitle, Color textColor, iconColor,
      IconData icon) {
    return Container(
      height: 150.h,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 15,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: iconColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        icon,
                        color: iconColor,
                        size: 28,
                      ),
                    ),
                  ],
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 14,
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
    );
  }
}
