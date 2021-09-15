import 'package:cars/modules/seller_module/Profile/My_Profile/payment/AddCard_Screen.dart';
import 'package:cars/shared/components/components.dart';
import 'package:cars/shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class PaymentBuyer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: 'Payments',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Your Cards',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Spacer(),
                  TextButton(
                      onPressed: (){
                        navigateTo(context, AddCardSeller());
                      },
                      child: Text(
                        'ADD',
                      )
                  ),
                ],
              ),
              // Card(
              //   clipBehavior: Clip.antiAliasWithSaveLayer,
              //   elevation: 5.0,
              //   child: Image(
              //     image: NetworkImage('https://image.freepik.com/free-vector/black-credit-card_1017-6276.jpg'),
              //     fit: BoxFit.cover,
              //     height: 200.0,
              //     width: double.infinity,
              //   ),
              // ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: visaCardColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Row(
                       children: [
                         Text('Mazad X',style: Theme.of(context).textTheme.bodyText1.copyWith(
                           color: Colors.white,
                         ),),
                         Spacer(),
                         Image(
                           height: 60,
                           width: 30,
                           image: NetworkImage('https://cdn-icons-png.flaticon.com/512/1148/1148114.png'),
                         ),
                       ],
                     ),
                     Text(
                        '6290 8821 7695 ****',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Colors.white,
                      ),),
                     Padding(
                       padding: const EdgeInsets.symmetric(vertical: 14.0),
                       child: Row(
                         children: [
                           Column(
                             children: [
                               Text(
                                 'Card holder',
                                 style: Theme.of(context).textTheme.bodyText2.copyWith(
                                   color: Colors.white,
                                 ),),
                               Text(
                                 'Ahamd Btata',
                                 style: Theme.of(context).textTheme.bodyText1.copyWith(
                                   color: Colors.white,
                                 ),),
                             ],
                           ),
                           Spacer(),
                           Column(
                             children: [
                               Text(
                                 'Expiry date',
                                 style: Theme.of(context).textTheme.bodyText2.copyWith(
                                   color: Colors.white,
                                 ),),
                               Text(
                                 '12 / 2022',
                                 style: Theme.of(context).textTheme.bodyText1.copyWith(
                                   color: Colors.white,
                                 ),),
                             ],
                           ),
                         ],
                       ),
                     ),

                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    'Transactions',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Spacer(),
                  TextButton(
                      onPressed: (){},
                      child: Text(
                        'SEE ALL',
                      )
                  ),
                ],
              ),
              Container(
                height: 450,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => buildTransactionItem(context),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 8.0,
                  ),
                  itemCount: 15,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
  Widget buildTransactionItem(context) =>
      Container(
        height: 90,
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 5.0,
          margin: EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  width: 48.0,
                  height: 48.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: bgColor,
                  ),
                  child:   Icon(CupertinoIcons.money_dollar_circle,color: Colors.blue,size: 20,),
                ),
                SizedBox(width: 12,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Make Bid',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),

                    Text(
                      'April 15',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Text(
                      'Make Bid to Mrecedes Benz 2019',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  '-\$80.50',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
