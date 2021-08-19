import 'package:cars/layout/buyer_app/cubit/cubit.dart';
import 'package:cars/layout/buyer_app/cubit/states.dart';
import 'package:cars/shared/styles/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/styles/colors.dart';

class BuyerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => BuyerCubit()..getUserData(),
      child: BlocConsumer<BuyerCubit, BuyerStates>(
        listener: (context, state){},
        builder: (context, state){
          var cubit = BuyerCubit.get(context);
          return Scaffold(
            // appBar: AppBar(

            //   backgroundColor: defaultColor,
              // title: Text(
              //     cubit.titles[cubit.currentIndex],
              //   style: TextStyle(
              //     color: Colors.white,
              //   ),
              // ),
           // ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index){
                cubit.changeBottomNav(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.Home,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.directions_car_sharp,
                  ),
                  label: 'Cars',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.Document,
                  ),
                  label: 'My Bids',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.User,
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          );
        },
      ),
    );
  }

}