import 'package:flutter/material.dart';

class CarsSignInScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image(
              image: AssetImage('assets/images/bg.png'),
              fit: BoxFit.cover,
            ),
          ),
            Positioned(
              top: 320,
              width: MediaQuery.of(context).size.width,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Mazad X',
                  style: TextStyle(
                    fontSize: 42.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Buy & Sell cars online',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
              ],
                ),
            ),

         Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisSize: MainAxisSize.max,
           mainAxisAlignment: MainAxisAlignment.end,
           children: [
             Container(
               height: 370,
               width: double.infinity,
               decoration: BoxDecoration(
                      color: Colors.white,
                       borderRadius: BorderRadius.only(
                         topRight: Radius.circular(25),
                         topLeft: Radius.circular(25),
                       ),
                     ),
             ),
           ],
         ),

        ],

      ),
    );
  }
}
