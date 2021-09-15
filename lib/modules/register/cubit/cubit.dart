import 'package:cars/models/user_model.dart';
import 'package:cars/modules/register/cubit/states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RegisterCubit extends Cubit<RegisterStates>
{
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);


  void userRegister({
    @required bool isSeller,
    @required String name,
    @required String email,
    @required String password,
    @required String phone,
})
  {
     emit(RegisterLoadingState());
     FirebaseAuth.instance
         .createUserWithEmailAndPassword(
       email: email,
       password: password,
     ).then((value){
       userCreate(
         uId: value.user.uid,
         isSeller: isSeller,
         name: name,
         email: email,
         phone: phone,
       );
     }).catchError((error){
       emit(RegisterErrorState(error.toString()));
     });
  }

  void userCreate({
    @required bool isSeller,
    @required String name,
    @required String email,
    @required String phone,
    @required String uId,
  }){
    UserModel model = UserModel(
      isSeller: isSeller,
      name: name,
      email: email,
      phone: phone,
      uId: uId,
      bio: 'write you bio ...',
      image: 'https://image.freepik.com/free-vector/modern-vertical-banners-ramadan-kareem-cover-ramadan-mubarak-flyer-background-template-design-element-vector-illustration_3482-5035.jpg',
      isPhoneVerified: false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value){
          emit(CreateUserSuccessState());
    })
        .catchError((error){
      emit(CreateUserErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterChangePasswordVisibilityState());
  }
}
