import 'package:cars/layout/seller_app/cubit/states.dart';
import 'package:cars/models/cars_model.dart';
import 'package:cars/modules/seller_module/Add_Auctions/add_auction_Screen.dart';
import 'package:cars/modules/seller_module/My_Auctions/my_auction_Screen.dart';
import 'package:cars/modules/seller_module/Profile/profile_Screen.dart';
import 'package:cars/shared/components/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SellerCubit extends Cubit<SellerStates>{
  SellerCubit() : super(SellerInitialState());

  static SellerCubit get(context) => BlocProvider.of(context);

  UserModel model;

  void getUserData()
  {
    emit(SellerGetUserLoadingState());

    FirebaseFirestore.instance.collection('users')
        .doc(uId)
        .get()
        .then((value){
        print(value.data());
        model = UserModel.fromJson(value.data());
        emit(SellerGetUserSuccessState());
    })
        .catchError((error){
          print(error.toString());
          emit(SellerGetUserErrorState(error.toString()));
    });
  }

  int currentIndex = 0;

  List<Widget> screens = [
    MyAuctionScreen(),
    AddAuctionScreen(),
    ProfileScreen()
  ];

  // List<String> titles =
  // [
  //   'My Auctions',
  //   'Add Auctions',
  //   'Profile',
  // ];

  void changeBottomNav(int index)
  {
    currentIndex = index;
    emit(SellerChangeBottomNavState());
  }
}
