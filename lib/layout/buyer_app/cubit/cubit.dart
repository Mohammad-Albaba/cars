import 'package:cars/layout/buyer_app/cubit/states.dart';
import 'package:cars/models/cars_model.dart';
import 'package:cars/modules/buyer_module/Cars_Buyer/cars_Screen.dart';
import 'package:cars/modules/buyer_module/Home_Buyer/home_Screen.dart';
import 'package:cars/modules/buyer_module/My_Bids_Buyer/My_Bids_Screen.dart';
import 'package:cars/modules/buyer_module/profile_buyer/Profile_Screen.dart';
import 'package:cars/shared/components/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BuyerCubit extends Cubit<BuyerStates>{
  BuyerCubit() : super(BuyerInitialState());

  static BuyerCubit get(context) => BlocProvider.of(context);

  UserModel model;

  void getUserData()
  {
    emit(BuyerGetUserLoadingState());

    FirebaseFirestore.instance.collection('users')
        .doc(uId)
        .get()
        .then((value){
        print(value.data());
        model = UserModel.fromJson(value.data());
        emit(BuyerGetUserSuccessState());
    })
        .catchError((error){
          print(error.toString());
          emit(BuyerGetUserErrorState(error.toString()));
    });
  }

  int currentIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    CarsScreen(),
    MyBidsScreen(),
    ProfileScreen(),
  ];
  // List<String> titles =
  // [
  //   'Mazad X',
  //   'Cars',
  //   'MyBids',
  //   'Profile',
  // ];
  void changeBottomNav(int index)
  {
    currentIndex = index;
    emit(BuyerChangeBottomNavState());
  }
}
