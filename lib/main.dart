import 'package:cars/layout/buyer_app/buyer_layout.dart';
import 'package:cars/layout/seller_app/seller_layout.dart';
import 'package:cars/shared/network/cars_signin_screen.dart';
import 'package:cars/modules/login/login_screen.dart';
import 'package:cars/shared/components/components.dart';
import 'package:cars/shared/components/constant.dart';
import 'package:cars/shared/network/local/cache_helper.dart';
import 'package:cars/shared/styles/themes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await CacheHelper.init();

   uId = CacheHelper.getData(key: 'uId');

  Widget widget;

  if(uId != null)
  {
       widget = BuyerLayout();
    // this.groupValue == UserType.Seller?
    // SellerLayout():
    // BuyerLayout();
  }else{
    widget = LoginScreen();
  }

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      home: SplashScreen(startWidget: widget,)));
}

class SplashScreen extends StatelessWidget {
  final Widget startWidget;

  SplashScreen({
    this.startWidget
    });
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((value){
      navigateAndFinish(context, startWidget,);
    });
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

          // child: SvgPicture.network(
          //   'https://commons.wikimedia.org/wiki/File:Bg_Cars.svg',
          //   placeholderBuilder: (BuildContext context) => Container(
          //       padding: const EdgeInsets.all(30.0),
          //       child: const CircularProgressIndicator()),
          // ),
          ),


          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
        ],

      ),
    );
  }
}


