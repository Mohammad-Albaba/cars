import 'package:cars/layout/cars/seller_layout.dart';
import 'package:cars/modules/seller_module/Add_Auctions/add_auction_Screen1.dart';
import 'package:cars/modules/seller_module/My_Auctions/active_auctions.dart';
import 'package:cars/modules/seller_module/My_Auctions/my_auction_Screen.dart';
import 'package:cars/modules/seller_module/Profile/profile_Screen.dart';
import 'package:cars/shared/components/components.dart';
import 'package:cars/shared/styles/colors.dart';
import 'package:cars/shared/styles/icon_broken.dart';
import 'package:flutter/material.dart';

class DoneScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: CircleAvatar(
            backgroundColor: Colors.black12,
            child: Icon(
              Icons.close,
              color: Colors.black54,
            ),
          ),
        ),
        titleSpacing: 120.0,
        title: Text(
          'Done',
          textAlign: TextAlign.center,
        ),
      ),
       body: Padding(
         padding: const EdgeInsets.all(16.0),
         child: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_outline,
                size: 75.0,
                color: Colors.cyan,
              ),
              SizedBox(height: 18.0,),
              Text('Congratulations',style: Theme.of(context).textTheme.bodyText1,),
              SizedBox(height: 12.0,),
              Text('Auction has been submitted for review',style: Theme.of(context).textTheme.subtitle2,),
              SizedBox(height: 32.0,),
              defaultButton(
                  function: (){

                  },
                  text: 'My Auctions',
                  radius: 6.0,
                  isUpperCase: false,
              ),
            ],
      ),
         ),
       ),
    );
  }
}
