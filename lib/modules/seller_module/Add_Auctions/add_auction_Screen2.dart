import 'package:cars/layout/cars/cubit/cubit.dart';
import 'package:cars/layout/cars/cubit/states.dart';
import 'package:cars/models/post_model.dart';
import 'package:cars/modules/seller_module/Add_Auctions/add_auction_Screen3.dart';
import 'package:cars/shared/components/components.dart';
import 'package:cars/shared/styles/colors.dart';
import 'package:cars/shared/styles/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class AddAuctionScreen2 extends StatefulWidget {
  PostModel postModel;
  AddAuctionScreen2({
    this.postModel
  });
  @override
  _AddAuctionScreen2State createState() => _AddAuctionScreen2State();
}

class _AddAuctionScreen2State extends State<AddAuctionScreen2> {
  final height = 175.0;

  List countrys = ['Austria','Armenia','Angola','Bahamas','Gaza'];

  String dropDownValue = 'Gaza';

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
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  StepProgressIndicator(
                    totalSteps: 100,
                    currentStep: 32,
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
                    padding: const EdgeInsets.all(40.0),
                    child: Text(
                      'Where’s your vehicle located? ',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: DropdownButton<String>(
                          isExpanded: true,
                          underline: Container(),
                          value: this.dropDownValue,
                          onChanged: (v){
                            setState(() {
                              this.dropDownValue = v ;
                            });
                          },
                          hint: Text('Country'),
                          items: countrys.map((e){
                            return DropdownMenuItem<String>(
                                child: Text(e,style: Theme.of(context).textTheme.bodyText1.copyWith(
                                  fontSize: 14.0,
                                ),),
                               value: (e),
                            );
                          }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.0,),
                  Container(
                    color: Colors.white,
                    child: Expanded(
                      child: Container(
                        height: 55.0,
                        child: TextField(
                          cursorColor: defaultColor,
                          maxLines: 1,  // <--- maxLines
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            hintText: 'Street address',
                            hintStyle: Theme.of(context).textTheme.caption.copyWith(
                              fontSize: 14.0,
                            ),
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.0,),
                  Container(
                    height: 55.0,
                    color: Colors.white,
                    child: Expanded(
                      child: TextField(
                        cursorColor: defaultColor,
                        maxLines: 1,  // <--- maxLines
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          hintText: 'Suite, apartment number',
                          hintStyle: Theme.of(context).textTheme.caption.copyWith(
                            fontSize: 14.0,
                          ),
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.0,),
                  Container(
                    height: 55.0,
                    color: Colors.white,
                    child: Expanded(
                      child: TextField(
                        cursorColor: defaultColor,
                        maxLines: 1,  // <--- maxLines
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          hintText: 'City',
                          hintStyle: Theme.of(context).textTheme.caption.copyWith(
                            fontSize: 14.0,
                          ),
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  defaultButton(
                      function: (){
                        navigateTo(context, AddAuctionScreen3());
                      },
                      text: 'Next',
                      radius: 6.0,
                      isUpperCase: false,
                  ),
                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
