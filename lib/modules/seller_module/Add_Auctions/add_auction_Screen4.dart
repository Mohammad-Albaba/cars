import 'package:cars/layout/cars/cubit/cubit.dart';
import 'package:cars/layout/cars/cubit/states.dart';
import 'package:cars/modules/seller_module/Add_Auctions/add_auction_Screen5.dart';
import 'package:cars/shared/components/components.dart';
import 'package:cars/shared/styles/colors.dart';
import 'package:cars/shared/styles/icon_broken.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class AddAuctionScreen4 extends StatefulWidget {
  @override
  _AddAuctionScreen4State createState() => _AddAuctionScreen4State();
}

class _AddAuctionScreen4State extends State<AddAuctionScreen4> {
  bool _checkbox1 = true;
  bool _checkbox2= true;
  bool _checkbox3= true;
  bool _checkbox4= true;
  bool _checkbox5= true;
  bool _checkbox6= true;
  bool _checkbox7= true;
  bool _checkbox8= false;
  bool _checkbox9= false;
  bool _checkbox10= false;
  bool _checkbox11= false;
  bool _checkbox12= false;
  bool _checkbox13= false;
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
                    currentStep: 64,
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
                     'What additional features do you offer? ',
                     textAlign: TextAlign.center,
                     style: Theme.of(context).textTheme.bodyText1.copyWith(
                       fontSize: 23.0,
                       fontWeight: FontWeight.bold,
                     ),
                        ),
                  ),
                   defaultCheckBox(
                    title: 'Driver Airbag',
                    isCheckbox: _checkbox1,
                    onChange: (isCheckbox){
                      setState(() {
                        _checkbox1 = !_checkbox1;
                      });
                    }
                  ),
                  defaultCheckBox(
                      title: 'Smart Key',
                      isCheckbox: _checkbox2,
                      onChange: (isCheckbox){
                        setState(() {
                          _checkbox2 = !_checkbox2;
                        });
                      }
                  ),
                  defaultCheckBox(
                      title: 'ABS (Anti-lock Brake System)',
                      isCheckbox: _checkbox3,
                      onChange: (isCheckbox){
                        setState(() {
                          _checkbox3 = !_checkbox3;
                        });
                      }
                  ),
                  defaultCheckBox(
                      title: 'EPS (Electric Power Steering)',
                      isCheckbox: _checkbox4,
                      onChange: (isCheckbox){
                        setState(() {
                          _checkbox4 = !_checkbox4;
                        });
                      }
                  ),
                  defaultCheckBox(
                      title: 'Spare Tire (Tire Mobility Kit)',
                      isCheckbox: _checkbox5,
                      onChange: (isCheckbox){
                        setState(() {
                          _checkbox5 = !_checkbox5;
                        });
                      }
                  ),
                  defaultCheckBox(
                      title: 'Passenger Airbag',
                      isCheckbox: _checkbox6,
                      onChange: (isCheckbox){
                        setState(() {
                          _checkbox6 = !_checkbox6;
                        });
                      }
                  ),
                  defaultCheckBox(
                      title: 'Park Assist Sensor',
                      isCheckbox: _checkbox7,
                      onChange: (isCheckbox){
                        setState(() {
                          _checkbox7 = !_checkbox7;
                        });
                      }
                  ),
                  defaultCheckBox(
                      title: 'Air Condinitor',
                      isCheckbox: _checkbox8,
                      onChange: (isCheckbox){
                        setState(() {
                          _checkbox8 = !_checkbox8;
                        });
                      }
                  ),
                  defaultCheckBox(
                      title: 'Heading Seat',
                      isCheckbox: _checkbox9,
                      onChange: (isCheckbox){
                        setState(() {
                          _checkbox9 = !_checkbox9;
                        });
                      }
                  ),
                  defaultCheckBox(
                      title: 'Power Steering',
                      isCheckbox: _checkbox10,
                      onChange: (isCheckbox){
                        setState(() {
                          _checkbox10 = !_checkbox10;
                        });
                      }
                  ),
                  defaultCheckBox(
                      title: 'Cruise Control',
                      isCheckbox: _checkbox11,
                      onChange: (isCheckbox){
                        setState(() {
                          _checkbox11 = !_checkbox11;
                        });
                      }
                  ),
                  defaultCheckBox(
                      title: 'Smart Key',
                      isCheckbox: _checkbox12,
                      onChange: (isCheckbox){
                        setState(() {
                          _checkbox12 = !_checkbox12;
                        });
                      }
                  ),
                  defaultCheckBox(
                      title: ' USB',
                      isCheckbox: _checkbox13,
                      onChange: (isCheckbox){
                        setState(() {
                          _checkbox13 = !_checkbox13;
                        });
                      }
                  ),

                  SizedBox(height: 30.0,),
                  defaultButton(
                      function: (){
                        navigateTo(context, AddAuctionScreen5());
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
