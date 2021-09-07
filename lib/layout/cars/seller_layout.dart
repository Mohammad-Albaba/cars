import 'package:cars/layout/cars/cubit/cubit.dart';
import 'package:cars/layout/cars/cubit/states.dart';
import 'package:cars/shared/styles/icon_broken.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){},
      builder: (context, state){
        var cubit = AppCubit.get(context);
        return Scaffold(
          body: cubit.screensSeller[cubit.currentIndexSeller],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndexSeller,
            onTap: (index){
              cubit.changeBottomNavSeller(index);
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
