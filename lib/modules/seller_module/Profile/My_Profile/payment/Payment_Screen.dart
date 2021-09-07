import 'package:cars/modules/seller_module/Profile/My_Profile/payment/AddCard_Screen.dart';
import 'package:cars/shared/components/components.dart';
import 'package:cars/shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentSeller extends StatelessWidget {

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
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 5.0,
                child: Image(
                  image: NetworkImage('https://image.freepik.com/free-vector/black-credit-card_1017-6276.jpg'),
                  fit: BoxFit.cover,
                  height: 200.0,
                  width: double.infinity,
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
