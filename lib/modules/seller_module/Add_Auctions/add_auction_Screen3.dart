import 'package:cars/layout/cars/cubit/cubit.dart';
import 'package:cars/layout/cars/cubit/states.dart';
import 'package:cars/models/post_model.dart';
import 'package:cars/modules/seller_module/Add_Auctions/add_auction_Screen4.dart';
import 'package:cars/shared/components/components.dart';
import 'package:cars/shared/styles/colors.dart';
import 'package:cars/shared/styles/icon_broken.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class AddAuctionScreen3 extends StatefulWidget {
  PostModel postModel;
  AddAuctionScreen3({
    this.postModel
  });
  @override
  _AddAuctionScreen3State createState() => _AddAuctionScreen3State();
}

class _AddAuctionScreen3State extends State<AddAuctionScreen3> {
  final height = 175.0;

  List typeCars = ['Small Cars','Hatchbck Cars','SUV Cars','4*4 Cars',];
  String dropDownValueType = 'Small Cars';

  List brandsCars = ['BMW','SCODA','NISSAN','HONDA','KIA'];
  String dropDownValueBrand = 'BMW';

  List makeCars = ['Gaza','Austria','Armenia','Angola','Bahamas',];

  String dropDownValueMake = 'Gaza';

  List modelCars = ['Sedan','Coupe','Sports Car','Station Wagon','Hatchback',];

  String dropDownValueModel = 'Sedan';

  List engineCars = ['Inline','Flat','V Engine',];

  String dropDownValueEngine = 'Inline';

  List gearboxCars = ['Manual transmission','Automatic','Continuously variable',];

  String dropDownValueGearbox = 'Manual transmission';

  List colorCars = ['Black','Yellow','Red','Blue',];

  String dropDownValueColor = 'Black';


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
                    currentStep: 48,
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
                     'Tell us basic features of your car ',
                     textAlign: TextAlign.center,
                     style: Theme.of(context).textTheme.bodyText1.copyWith(
                       fontSize: 23.0,
                       fontWeight: FontWeight.bold,
                     ),
                        ),
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: Container(
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
                              value: this.dropDownValueType,
                              onChanged: (v){
                                setState(() {
                                  this.dropDownValueType = v ;
                                });
                              },
                              hint:Text("Type"),
                              items: typeCars.map((e){
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
                      ),
                      SizedBox(width: 11.0,),
                      Expanded(
                        child: Container(
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
                              value: this.dropDownValueBrand,
                              onChanged: (v){
                                setState(() {
                                  this.dropDownValueBrand = v ;
                                });
                              },
                               hint:Text("Brand"),
                              items: brandsCars.map((e){
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
                      ),

                    ],
                  ),
                  SizedBox(height: 12.0,),

                  Row(
                    children: [
                      Expanded(
                        child: Container(
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
                              value: this.dropDownValueMake,
                              onChanged: (v){
                                this.dropDownValueMake = v ;
                                setState(() {
                                });
                              },
                              hint:Text("Make"),
                              items: makeCars.map((e){
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
                      ),
                      SizedBox(width: 11.0,),
                      Expanded(
                        child: Container(
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
                              value: this.dropDownValueModel,
                              onChanged: (v){
                                setState(() {
                                  this.dropDownValueModel = v ;
                                });
                              },
                              hint:Text("Model"),
                              items: modelCars.map((e){
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
                      ),

                    ],
                  ),
                  SizedBox(height: 12.0,),
                  // text field
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 55.0,
                          color: Colors.white,
                          child: TextField(
                            cursorColor: defaultColor,
                            maxLines: 1,  // <--- maxLines
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              filled: true,
                              hintText: 'Year',
                              hintStyle: Theme.of(context).textTheme.caption.copyWith(
                                fontSize: 14.0,
                              ),
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 11.0,),
                      Expanded(
                        child: Container(
                          height: 55.0,
                          color: Colors.white,
                          child: TextField(
                            cursorColor: defaultColor,
                            maxLines: 1,  // <--- maxLines
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              filled: true,
                              hintText: 'Mileage (mi)',
                              hintStyle: Theme.of(context).textTheme.caption.copyWith(
                                fontSize: 14.0,
                              ),
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 12.0,),

                  //drop
                  Row(
                    children: [
                      Expanded(
                        child: Container(
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
                              value: this.dropDownValueEngine,
                              onChanged: (v){
                                this.dropDownValueEngine = v ;
                                setState(() {
                                });
                              },
                              hint:Text("Engine"),
                              items: engineCars.map((e){
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
                      ),
                      SizedBox(width: 11.0,),
                      Expanded(
                        child: Container(
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
                              value: this.dropDownValueGearbox,
                              onChanged: (v){
                                setState(() {
                                  this.dropDownValueGearbox = v ;
                                });
                              },
                              hint:Text("Gearbox"),
                              items: gearboxCars.map((e){
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
                      ),
                    ],
                  ),
                  SizedBox(height: 12.0,),

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
                        value: this.dropDownValueColor,
                        onChanged: (v){
                          setState(() {
                            this.dropDownValueColor = v ;
                          });
                        },
                        hint: Text('Country'),
                        items: colorCars.map((e){
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

                  SizedBox(height: 30.0,),
                  defaultButton(
                      function: (){
                        navigateTo(context, AddAuctionScreen4());
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
