import 'package:cars/layout/cars/cubit/cubit.dart';
import 'package:cars/layout/cars/cubit/states.dart';
import 'package:cars/models/post_model.dart';
import 'package:cars/modules/seller_module/Add_Auctions/add_auction_Screen1.dart';
import 'package:cars/modules/seller_module/Add_Auctions/add_auction_Screen3.dart';
import 'package:cars/modules/seller_module/Add_Auctions/add_auction_Screen6.dart';
import 'package:cars/shared/components/components.dart';
import 'package:cars/shared/styles/colors.dart';
import 'package:cars/shared/styles/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class AddAuctionScreen5 extends StatefulWidget {
  @override
  _AddAuctionScreen5State createState() => _AddAuctionScreen5State();
}

class _AddAuctionScreen5State extends State<AddAuctionScreen5> {
  final height = 150.0;
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){},
      builder: (context, state){
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar:  defaultAppBar(
          backgroundColor: bgColor,
          context: context,
            title: 'Make Auction',
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  StepProgressIndicator(
                    totalSteps: 100,
                    currentStep: 80,
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
                  if(state is CreatePostLoadingState)
                    LinearProgressIndicator(),
                  if(state is CreatePostLoadingState)
                  SizedBox(height: 50.0,),
                  Text(
                    'Upload photos',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 50.0,),
                  Container(
                    height: 55.0,
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

                        // child: TextField(
                        //   controller: titleController,
                        //   cursorColor: defaultColor,
                        //   maxLines: 1,  // <--- maxLines
                        //   decoration: InputDecoration(
                        //     border: OutlineInputBorder(),
                        //     filled: true,
                        //     hintText: 'Title',
                        //     hintStyle: Theme.of(context).textTheme.caption.copyWith(
                        //       fontSize: 16.0,
                        //     ),
                        //     fillColor: Colors.white,
                        //   ),
                        // ),
                      ),

                    ),
                  ),
                  SizedBox(height: 12.0,),
                  SizedBox( // <--- SizedBox
                    height: height,
                    child: TextFormField(
                      // onSaved: onSaved,
                      controller: descriptionController,
                      cursorColor: defaultColor,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter description';
                        }
                        return null;
                      },
                      maxLines: height ~/ 40,  // <--- maxLines
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        hintText: 'Brief description',
                        hintStyle: Theme.of(context).textTheme.caption.copyWith(
                          fontSize: 16.0,
                        ),
                        fillColor: Colors.white,
                      ),

                      // child: TextField(
                      //   controller: descriptionController,
                      //   cursorColor: defaultColor,
                      //   maxLines: height ~/ 20,  // <--- maxLines
                      //   decoration: InputDecoration(
                      //     border: OutlineInputBorder(),
                      //     filled: true,
                      //     hintText: 'Brief description',
                      //     hintStyle: Theme.of(context).textTheme.caption.copyWith(
                      //       fontSize: 16.0,
                      //     ),
                      //     fillColor: Colors.white,
                      //   ),
                      // ),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  if(AppCubit.get(context).postImage!= null)
                    Column(
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Container(
                              height: 140.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                image: DecorationImage(
                                  image: FileImage(AppCubit.get(context).postImage),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: CircleAvatar(
                                radius: 20.0,
                                child: Icon(
                                  Icons.close,
                                  size: 16.0,
                                ),
                              ),
                              onPressed: (){
                                AppCubit.get(context).removePostImage();
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0,),
                        defaultButton(
                          function: (){
                            var now = DateTime.now();
                            if(AppCubit.get(context).postImage == null){
                              AppCubit.get(context).createPost(
                                dateTime: now.toString(),
                                title: titleController.text,
                                description: descriptionController.text,
                              );
                            }else
                            {
                              AppCubit.get(context).uploadPostImage(
                                dateTime: now.toString(),
                                title: titleController.text,
                                description: descriptionController.text,
                              );
                            }
                            navigateTo(context, AddAuctionScreen6());
                          },
                         text: 'Next',
                          radius: 6.0,
                        ),
                      ],
                    ),
                  SizedBox(height: 50.0,),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: ()
                          {
                            AppCubit.get(context).getPostImage();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                IconBroken.Image,
                              ),
                              SizedBox(width: 5.0,),
                              Text('add photo'),
                            ],),
                        ),
                      ),
                      Text(
                        '# tags',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Center(
          //   child: Padding(
          //     padding: const EdgeInsets.all(16.0),
          //     child: Container(
          //       height: height,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(6.0),
          //         color: Colors.white,
          //         border: Border.all(
          //           color: Colors.grey,
          //           width: 1,
          //         ),
          //       ),
          //       child: InkWell(
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Icon(Icons.cloud_upload_outlined, color: Colors.grey,),
          //             SizedBox(width: 8,),
          //             Text('Click here to select photos'),
          //           ],
          //         ),
          //         onTap: (){},
          //       ),
          //     ),
          //   ),
          // ),
        );
      },

    );
  }
}
