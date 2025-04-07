import 'package:flutter/material.dart';

class Recentalerts
 extends StatelessWidget {
  const Recentalerts
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return    Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Alerts',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),

          
          SizedBox(height: 10,),


          _drainstatbox('Critical','#1001','3 hours',Colors.red,),
          _drainstatbox('Warning','#1002','3 hours',Colors.orange,),
          _drainstatbox('Resolved','#1003','3 hours',Colors.green,),
        ],
      ),
    );
  }

 _drainstatbox(String cond,id,time, Color icolor) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: icolor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 75,
                width: 5,
                color: icolor,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        cond,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: icolor,
                        ),
                      ),
                      Text(
                        ': Drain ID ' ,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                    id,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text('Debris Pit Full (95%) - Immediate action required'),
                  
                  SizedBox(height: 4),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ],
          ),
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
  }
