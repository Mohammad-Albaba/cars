import 'dart:io';

import 'package:cars/layout/cars/cubit/states.dart';
import 'package:cars/models/user_model.dart';
import 'package:cars/models/post_model.dart';
import 'package:cars/modules/buyer_module/Cars_Buyer/cars_Screen.dart';
import 'package:cars/modules/buyer_module/Home_Buyer/home_Screen.dart';
import 'package:cars/modules/buyer_module/My_Bids_Buyer/My_Bids_Screen.dart';
import 'package:cars/modules/buyer_module/profile_buyer/Profile_Screen.dart';
import 'package:cars/modules/seller_module/Add_Auctions/add_auction_Screen1.dart';
import 'package:cars/modules/seller_module/Add_Auctions/add_auction_Screen2.dart';
import 'package:cars/modules/seller_module/My_Auctions/my_auction_Screen.dart';
import 'package:cars/modules/seller_module/Profile/profile_Screen.dart';
import 'package:cars/shared/components/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  UserModel userModel;

  void getUserData()
  {
    emit(AppGetUserLoadingState());

    FirebaseFirestore.instance.collection('users')
        .doc(uId)
        .get()
        .then((value){
      print(value.data());
      userModel = UserModel.fromJson(value.data());
      emit(AppGetUserSuccessState());
    })
        .catchError((error){
      print(error.toString());
      emit(AppGetUserErrorState(error.toString()));
    });
  }

  int currentIndexBuyer = 0;

  List<Widget> screensBuyer = [
    HomeScreen(),
    CarsScreen(),
    MyBidsScreen(),
    ProfileBuyerScreen(),
  ];

  void changeBottomNavBuyer(int index)
  {
    currentIndexBuyer = index;
    emit(AppChangeBottomNavState());
  }

  int currentIndexSeller = 0;

  List<Widget> screensSeller = [
    MyAuctionScreen(),
    AddAuctionScreen1(),
    ProfileSellerScreen(),
  ];

  void changeBottomNavSeller(int index)
  {
    currentIndexSeller = index;
    emit(AppChangeBottomNavState());
  }


  File profileImage;
  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile  =await picker.getImage(
      source: ImageSource.gallery,
    );
    if(pickedFile != null)
    {
      profileImage = File(pickedFile.path);
      emit(AppProfileImagePickedSuccessState());
    }else{
      print('No image selected');
      emit(AppProfileImagePickedErrorState());
    }
  }

  void uploadProfileImage({
    @required String name,
    @required String phone,
    @required String bio,
  }){
    emit(UserUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage.path).pathSegments.last}')
        .putFile(profileImage)
        .then((value) {
      value.ref.getDownloadURL().then((value){
        //emit(UploadProfileImageSuccessState());
        print(value);
        updateUser(
          name: name,
          phone: phone,
          bio: bio,
          image: value,
        );
      }).catchError((error){
        emit(UploadProfileImageErrorState());
      });
    }).catchError((error){
      emit(UploadProfileImageErrorState());
    });
  }

  // void updateUserImages({
  //   @required String name,
  //   @required String phone,
  //   @required String bio,
  // })
  // {
  //   emit(UserUpdateLoadingState());
  //
  //   if(profileImage != null)
  //   {
  //     uploadProfileImage();
  //   }else
  //     {
  //       updateUser(
  //         name: name,
  //         phone: phone,
  //         bio: bio,
  //       );
  //     }
  // }

  void updateUser(
      {
        @required String name,
        @required String phone,
        @required String bio,
        String image,
      }
      ){
    UserModel model = UserModel(
      name: name,
      phone: phone,
      bio: bio,
      email: userModel.email,
      image: image??userModel.image,
      uId: userModel.uId,
      isPhoneVerified: false,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uId)
        .update(model.toMap())
        .then((value){
      getUserData();
    })
        .catchError((error){
      emit(UserUpdateErrorState());
    });
  }

  ////////////////////////////////////
  File postImage;

  Future<void> getPostImage() async {
    final pickedFile  =await picker.getImage(
      source: ImageSource.gallery,
    );
    if(pickedFile != null)
    {
      postImage = File(pickedFile.path);
      emit(PostImagePickedSuccessState());
    }else{
      print('No image selected');
      emit(PostImagePickedErrorState());
    }
  }

  void removePostImage()
  {
    postImage = null;
    emit(RemovePostImageState());
  }

  void uploadPostImage({
    @required String dateTime,
    @required String title,
    @required String description,
  }){
    emit(CreatePostLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(postImage.path).pathSegments.last}')
        .putFile(postImage)
        .then((value) {
      value.ref.getDownloadURL().then((value)
      {
        print(value);
        createPost(
          title: title,
          description: description,
          dateTime: dateTime,
          postImage: value,
        );
      }).catchError((error)
      {
        emit(CreatePostErrorState());
      }
      );
    }).catchError((error)
    {
      emit(CreatePostErrorState());
    }
    );
  }

  PostModel postModel = PostModel();
  void createPost({
    String postImage,
    @required String dateTime,
    @required String title,
    @required String description,
  }){
    emit(CreatePostLoadingState());

    postModel = PostModel(
        uId: userModel.uId,
        postImage: postImage??'',
        dateTime: dateTime,
        title: title,
        description: description,
    );

    FirebaseFirestore.instance
        .collection('posts')
        .add(postModel.toMap())
        .then((value)
    {
      print(value);
      emit(CreatePostSuccessState());
    })
        .catchError((error){
      emit(CreatePostErrorState());
    });
  }
}
