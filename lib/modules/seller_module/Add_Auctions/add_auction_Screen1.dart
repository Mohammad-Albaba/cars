import 'package:cars/layout/cars/cubit/cubit.dart';
import 'package:cars/layout/cars/cubit/states.dart';
import 'package:cars/layout/cars/seller_layout.dart';
import 'package:cars/models/user_model.dart';
import 'package:cars/models/post_model.dart';
import 'package:cars/modules/seller_module/Add_Auctions/add_auction_Screen2.dart';
import 'package:cars/modules/seller_module/Add_Auctions/add_auction_Screen5.dart';
import 'package:cars/shared/components/components.dart';
import 'package:cars/shared/styles/colors.dart';
import 'package:cars/shared/styles/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class AddAuctionScreen1 extends StatelessWidget {

  final height = 175.0;
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){},
      builder: (context, state){
        var model = AppCubit.get(context).postModel;
        return Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                'Make Auction',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    StepProgressIndicator(
                      totalSteps: 100,
                      currentStep: 16,
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
                        'Describe your listing',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 23.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 60.0,
                      color: Colors.white,
                      child: Expanded(
                        flex: 1,
                        child: TextFormField(
                          // onSaved: onSaved,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter title';
                            }
                            return null;
                          },
                          //TextEditingController(text: postModel.title)
                          controller: titleController,
                          cursorColor: defaultColor,
                          maxLines: 1,  // <--- maxLines
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            hintText: 'Title',
                            hintStyle: Theme.of(context).textTheme.caption.copyWith(
                              fontSize: 16.0,
                            ),
                            fillColor: Colors.white,
                          ),
                        ),

                      ),
                    ),
                    SizedBox(height: 12.0,),
                    SizedBox( // <--- SizedBox
                      height: height,
                      child: TextFormField(
                        // onSaved: onSaved,
                        //TextEditingController(text: postModel.description)
                        controller: descriptionController,
                        cursorColor: defaultColor,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter description';
                          }
                          return null;
                        },
                        maxLines: height ~/ 20,  // <--- maxLines
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          hintText: 'Brief description',
                          hintStyle: Theme.of(context).textTheme.caption.copyWith(
                            fontSize: 16.0,
                          ),
                          fillColor: Colors.white,
                        ),
                      ),

                    ),

                    SizedBox(height: 30.0,),
                    defaultButton(
                        function: ()
                        {
                          if (_formKey.currentState.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }
                          // postModel.title = titleController.text;
                          // postModel.description = descriptionController.text;
                         navigateTo(context, AddAuctionScreen2(postModel: model,));
                          model.title = titleController.text;
                          model.description=descriptionController.text;
                        },
                        text: 'Next',
                        radius: 6.0,
                        isUpperCase: false,

                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },

    );
  }
}
