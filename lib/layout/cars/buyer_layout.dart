import 'package:cars/layout/cars/cubit/cubit.dart';
import 'package:cars/layout/cars/cubit/states.dart';
import 'package:cars/shared/styles/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/styles/colors.dart';

class BuyerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){},
      builder: (context, state){
        var cubit = AppCubit.get(context);
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
          body: cubit.screensBuyer[cubit.currentIndexBuyer],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndexBuyer,
            onTap: (index){
              cubit.changeBottomNavBuyer(index);
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
    );
  }

}