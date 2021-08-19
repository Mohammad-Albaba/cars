import 'package:cars/layout/seller_app/cubit/cubit.dart';
import 'package:cars/layout/seller_app/cubit/states.dart';
import 'package:cars/shared/styles/icon_broken.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SellerCubit()..getUserData(),
      child: BlocConsumer<SellerCubit, SellerStates>(
        listener: (context, state){},
        builder: (context, state){
          var cubit = SellerCubit.get(context);
          return Scaffold(
            // appBar: AppBar(
            //   title: Text(
            //       cubit.titles[cubit.currentIndex],
            //   ),
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
                      IconBroken.Document,
                  ),
                  label: 'My Auctions',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.Plus,
                  ),
                  label: 'Add Auction',
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




///////////////////////////////////
// extends StatelessWidget {
//
// @override
// Widget build(BuildContext context) {
//   return BlocProvider(
//     create: (BuildContext context) => CarsCubit()..getUserData(),
//     child: BlocConsumer<CarsCubit, CarsStates>(
//       listener: (context, state){},
//       builder: (context, state){
//         return Scaffold(
//           appBar: AppBar(
//             title: Text(
//               'News Feed',
//             ),
//           ),
//           body: ConditionalBuilder(
//             condition: CarsCubit.get(context).model != null,
//             builder:(context)
//             {
//               var model = CarsCubit.get(context).model;
//
//               return Column(
//                 children: [
//                   if(!FirebaseAuth.instance.currentUser.emailVerified)
//                     Container(
//                       color: Colors.amber.withOpacity(.6),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 20.0,
//                         ),
//                         child: Row(
//                           children: [
//                             Icon(
//                                 Icons.info_outline
//                             ),
//                             SizedBox(width: 15.0,),
//                             Expanded(
//                                 child: Text('Please verify your email',)),
//                             SizedBox(
//                               width: 15.0,
//                             ),
//                             defaultTextButton(
//                               function: (){
//                                 FirebaseAuth.instance.currentUser.sendEmailVerification()
//                                     .then((value){
//                                   showToast(
//                                       text: 'check your email',
//                                       state: ToastStates.SUCCESS
//                                   );
//                                 })
//                                     .catchError((error){
//
//                                 });
//                               },
//                               text: 'send',
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                 ],
//               );
//             } ,
//             fallback: (context) => Center(child: CircularProgressIndicator()),
//           ),
//         );
//       },
//     ),
//   );
// }
// }
