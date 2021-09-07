import 'package:bloc/bloc.dart';
import 'package:cars/layout/cars/buyer_layout.dart';
import 'package:cars/layout/cars/cubit/cubit.dart';
import 'package:cars/layout/cars/cubit/states.dart';
import 'package:cars/layout/cars/seller_layout.dart';
import 'package:cars/shared/bloc_observer.dart';
import 'package:cars/modules/login/login_screen.dart';
import 'package:cars/shared/components/components.dart';
import 'package:cars/shared/components/constant.dart';
import 'package:cars/shared/network/local/cache_helper.dart';
import 'package:cars/shared/network/remote/dio_helper.dart';
import 'package:cars/shared/styles/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

   uId = CacheHelper.getData(key: 'uId');

  Widget widget;

  if(uId != null)
  {
       // widget = UserType.Seller();
        widget = BuyerLayout();
        //widget = SellerLayout();

    // this.groupValue == UserType.Seller?
    // SellerLayout():
    // BuyerLayout();
  }else{
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
    return BlocProvider(
        create: (BuildContext context) => AppCubit()..getUserData(),
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


