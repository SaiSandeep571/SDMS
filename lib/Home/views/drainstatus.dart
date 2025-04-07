import 'package:flutter/material.dart';

class Drainstatus extends StatelessWidget {
  const Drainstatus({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
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

          
          SizedBox(height: 10,),


          _drainstatbox('#1001','Main Street & 5th Ave','Clean',Colors.green,),
          _drainstatbox('#1002','Main Street & 5th Ave','Near Full',Colors.orange,),
          _drainstatbox('#1003','Main Street & 5th Ave','Clogged',Colors.red,),
        ],
      ),
    );
  }

 _drainstatbox(String id,location,status, Color icolor) {
    return Container(
      child: Column(
        children: [
          Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: icolor.withOpacity(0.1),
           border: Border.all(
            color: icolor.withOpacity(0.5)
           ), // For clean status
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
                    color:icolor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
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