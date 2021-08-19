import 'package:cars/modules/seller_module/My_Auctions/active_auctions.dart';
import 'package:cars/modules/seller_module/My_Auctions/unactive_auctions.dart';
import 'package:cars/shared/styles/colors.dart';
import 'package:cars/shared/styles/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAuctionScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: defaultColor,
            actions: [
              IconButton(
                color: Colors.white,
                icon: Icon(IconBroken.Notification),
                onPressed: (){},
              ),
              IconButton(
                color: Colors.white,
                icon: Icon(IconBroken.Search),
                onPressed: (){},
              ),
            ],
            title: Text('My Listings',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
            ),),
            bottom: TabBar(
              indicatorWeight: 3.0,
              labelStyle: TextStyle(
                fontSize: 18.0,
              ),
              labelPadding: EdgeInsets.symmetric(horizontal: 30.0),
              isScrollable: true,
              tabs: [
                Tab(text: 'Active',),
                Tab(text: 'Unactive',),
              ],
            ),
          ),
          body: TabBarView(
            children: [
                ActiveAuctions(),
               UnActiveAuctions(),
            ],
          ),
        ),
    );
  }
}
