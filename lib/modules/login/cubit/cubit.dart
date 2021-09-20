

import 'package:cars/layout/cars/buyer_layout.dart';
import 'package:cars/layout/cars/cubit/cubit.dart';
import 'package:cars/layout/cars/seller_layout.dart';
import 'package:cars/models/user_model.dart';
import 'package:cars/modules/login/cubit/states.dart';
import 'package:cars/shared/components/components.dart';
import 'package:cars/shared/components/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginCubit extends Cubit<LoginStates>
{
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  UserModel userModel;
   void userLogin({
  @required String email,
  @required String password,
})
  {
     emit(LoginLoadingState());
     FirebaseAuth.instance.signInWithEmailAndPassword(
         email: email,
         password: password,
     ).then((value){
       FirebaseFirestore.instance
           .collection('users')
           .doc(value.user.uid)
           .get()
           .then((value){
         print(value.data());
         userModel = UserModel.fromJson(value.data());
         if(value.get('isSeller') == false){

           print('BuyerLayout');
      //     navigateAndFinish(context , BuyerLayout());
         }else if(value.get('isSeller') == true){
           SellerLayout();
           //    navigateAndFinish(context, SellerLayout());
         //  print('SellerLayout');
         }
       });
       print(value.user.email);
       print(value.user.uid);
       emit(LoginSuccessState(value.user.uid));
     }).catchError((error){
        emit(LoginErrorState(error.toString()));
     });
  }


  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }

}
