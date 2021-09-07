import 'package:cars/layout/cars/cubit/cubit.dart';
import 'package:cars/layout/cars/cubit/states.dart';
import 'package:cars/models/cars_model.dart';
import 'package:cars/models/post_model.dart';
import 'package:cars/modules/seller_module/Add_Auctions/add_auction_Screen2.dart';
import 'package:cars/modules/seller_module/Add_Auctions/done_Screen.dart';
import 'package:cars/shared/components/components.dart';
import 'package:cars/shared/styles/colors.dart';
import 'package:cars/shared/styles/icon_broken.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class AddAuctionScreen6 extends StatefulWidget {
  @override
  _AddAuctionScreen6State createState() => _AddAuctionScreen6State();
}

class _AddAuctionScreen6State extends State<AddAuctionScreen6> {
  bool switchValue = true;
  bool switch2Value = false;
  bool switch3Value = true;
  bool switch4Value = false;
  var minimalPriceController = TextEditingController();
  var depositAmountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){},
      builder: (context, state){
        return Scaffold(
          appBar:  defaultAppBar(
          backgroundColor: bgColor,
          context: context,
            title: 'Make Auction',
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                StepProgressIndicator(
                  totalSteps: 100,
                  currentStep: 100,
                  size: 8,
                  padding: 0,
                  selectedColor: Colors.white,
                  unselectedColor: Colors.blue,
                  roundedEdges: Radius.circular(10),
                  selectedGradientColor: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.blue, Colors.blueAccent],
                  ),
                  unselectedGradientColor: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.tealAccent,Colors.cyanAccent],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Text(
                    'Auction settings',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16.0,bottom: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Fixed minimal price' , style: Theme.of(context).textTheme.bodyText2.copyWith(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),),
                      Spacer(),
                      Switch(value: switchValue, onChanged: (value){
                        setState(() {
                          switchValue = value;
                        });
                      }),
                    ],
                  ),
                ),
                Container(
                  height: 55.0,
                  color: Colors.white,
                  child: Expanded(
                    flex: 1,
                    child: TextFormField(
                      // onSaved: onSaved,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter minimal price';
                        }
                        return null;
                      },
                      controller: minimalPriceController,
                      cursorColor: defaultColor,
                      maxLines: 1,  // <--- maxLines
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        hintText: 'Minimal price at USD',
                        hintStyle: Theme.of(context).textTheme.caption.copyWith(
                          fontSize: 16.0,
                        ),
                        fillColor: Colors.white,
                      ),
                    ),

                  ),
                ),
                SizedBox(height: 18.0,),
                Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16.0,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Flexible price' , style: Theme.of(context).textTheme.bodyText2.copyWith(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),),
                      Spacer(),
                      Switch(value: switch2Value, onChanged: (value){
                        setState(() {
                          switch2Value = value;
                        });
                      }),
                    ],

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16.0,bottom: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Deposit required' , style: Theme.of(context).textTheme.bodyText2.copyWith(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),),
                      Spacer(),
                      Switch(value: switch3Value, onChanged: (value){
                        setState(() {
                          switch3Value = value;
                        });
                      }),
                    ],

                  ),
                ),
                Container(
                  height: 55.0,
                  color: Colors.white,
                  child: Expanded(
                    flex: 1,
                    child: TextFormField(
                      // onSaved: onSaved,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter deposit amount';
                        }
                        return null;
                      },
                      controller: depositAmountController,
                      cursorColor: defaultColor,
                      maxLines: 1,  // <--- maxLines
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        hintText: 'Deposit Amount to make bid',
                        hintStyle: Theme.of(context).textTheme.caption.copyWith(
                          fontSize: 16.0,
                        ),
                        fillColor: Colors.white,
                      ),
                    ),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Offers available' , style: Theme.of(context).textTheme.bodyText2.copyWith(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),),
                      Spacer(),
                      Switch(value: switch4Value, onChanged: (value){
                        setState(() {
                          switch4Value = value;
                        });
                      }),
                    ],

                  ),
                ),
                defaultButton(
                    function: (){
                      navigateTo(context, DoneScreen());
                    },
                    text: 'Send to review',
                    radius: 6.0,
                  isUpperCase: false,
                ),
              ],
            ),
          ),
        );
      },

    );
  }
}
