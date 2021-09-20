
import 'package:bloc/bloc.dart';
import 'package:cars/layout/cars/buyer_layout.dart';
import 'package:cars/layout/cars/cubit/cubit.dart';
import 'package:cars/layout/cars/cubit/states.dart';
import 'package:cars/layout/cars/seller_layout.dart';
import 'package:cars/models/user_model.dart';
import 'package:cars/modules/login/cubit/cubit.dart';
import 'package:cars/modules/register/cubit/cubit.dart';
import 'package:cars/shared/bloc_observer.dart';
import 'package:cars/modules/login/login_screen.dart';
import 'package:cars/shared/components/components.dart';
import 'package:cars/shared/components/constant.dart';
import 'package:cars/shared/network/local/cache_helper.dart';
import 'package:cars/shared/network/remote/dio_helper.dart';
import 'package:cars/shared/styles/themes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async
{
  print('on background message');
  print(message.data.toString());
  showToast(text: 'on background message', state: ToastStates.SUCCESS);
}
void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  
  var token = await FirebaseMessaging.instance.getToken();

  print(token);

  // foreground fcm
  FirebaseMessaging.onMessage.listen((event)
  {
    print('on message');
    print(event.data.toString());
    showToast(text: 'on message', state: ToastStates.SUCCESS);
  });

  // when click on notification to open app
  FirebaseMessaging.onMessageOpenedApp.listen((event)
  {
    print('on message opened app');
    print(event.data.toString());
    showToast(text: 'on message opened app', state: ToastStates.SUCCESS);

  });

  // background fcm
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

   uId = CacheHelper.getData(key: 'uId');

   Widget widget;

  UserModel userModel;
  if(uId != null) {
  await  FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .get()
        .then((value){
      print(value.data());
      userModel = UserModel.fromJson(value.data());
      if(value.get('isSeller') == false){
        print(' BuyerLayout');
        widget = BuyerLayout();
      }else if(value.get('isSeller') == true){
        widget = SellerLayout();
        print(' SellerLayout');
      }
    });
  }
  else{
    widget = SplashScreen();
  }

  runApp(
    MyApp(
        startWidget : widget,
  ));
}

class MyApp extends StatelessWidget
{
  final Widget startWidget;

  MyApp({
    this.startWidget,
  });
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((value){
      navigateAndFinish(context, startWidget,);
    });
    return MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (BuildContext context) => AppCubit()..getUserData()..userModel,
        ),
       BlocProvider(
          create: (BuildContext context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => LoginCubit()..userModel,
        ),
      ],
      child:  BlocConsumer<AppCubit, AppStates>(
            listener: (context, state){},
            builder: (context, state){
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: lightTheme,
                darkTheme: darkTheme,
                themeMode: ThemeMode.light,
                home: startWidget ,
              );
            },
          ),

    );
   }
 }

// class MyApp extends StatelessWidget
// {
//   final Widget startWidget;
//
//   MyApp({
//     this.startWidget,
//   });
//   @override
//   Widget build(BuildContext context) {
//     Future.delayed(Duration(seconds: 3)).then((value){
//       navigateAndFinish(context, startWidget,);
//     });
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (BuildContext context) => SellerCubit()..getUserData(),
//         ),
//         BlocProvider(
//           create: (BuildContext context) => BuyerCubit()..getUserData(),
//         ),
//       ],
//         child: BlocConsumer<BuyerCubit, BuyerStates>(
//         listener: (context, state){},
//         builder: (context, state) {
//           // return widget here based on BlocA's state
//           return BlocConsumer<SellerCubit, SellerStates>(
//             listener: (context, state){},
//             builder: (context, state){
//               return MaterialApp(
//                 debugShowCheckedModeBanner: false,
//                 theme: lightTheme,
//                 darkTheme: darkTheme,
//                 themeMode: ThemeMode.light,
//                 home: startWidget ,
//               );
//             },
//           );
//         },
//       ),
//     );
//
//    }
//  }



class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

   Future.delayed(Duration(seconds: 3)).then((value){

     navigateAndFinish(context, LoginScreen(),);
      }
    );
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


