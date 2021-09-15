import 'package:cars/layout/cars/cubit/cubit.dart';
import 'package:cars/layout/cars/cubit/states.dart';
import 'package:cars/models/user_model.dart';
import 'package:cars/shared/components/components.dart';
import 'package:cars/shared/styles/colors.dart';
import 'package:cars/shared/styles/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyProfileBuyer extends StatefulWidget {


  @override
  _MyProfileBuyerState createState() => _MyProfileBuyerState();
}

class _MyProfileBuyerState extends State<MyProfileBuyer> {
  var nameController = TextEditingController();

  var bioController = TextEditingController();

  var phoneController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){},
      builder: (context, state){
        var userModel = AppCubit.get(context).userModel;
        var profileImage = AppCubit.get(context).profileImage;

        nameController.text = userModel.name;
        bioController.text = userModel.bio;
        phoneController.text = userModel.phone;
        return Scaffold(
          appBar: defaultAppBar(
            context: context,
            title: 'My Profile',
            // theme: AppBarTheme(
            //   systemOverlayStyle: SystemUiOverlayStyle(
            //     statusBarColor: Colors.white,
            //     statusBarIconBrightness: Brightness.dark,
            //   ),
            // ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  if(state is UserUpdateLoadingState)
                    LinearProgressIndicator(),
                  if(state is UserUpdateLoadingState)
                    SizedBox(height: 10.0,),
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      CircleAvatar(
                        radius: 64.0,
                        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                        child: CircleAvatar(
                          radius: 60.0,
                          backgroundImage: profileImage == null ?
                          NetworkImage('${userModel.image}',)
                              : FileImage(profileImage),
                        ),
                      ),
                      IconButton(
                        icon: CircleAvatar(
                          radius: 20.0,
                          child: Icon(IconBroken.Camera,
                            size: 16.0,
                          ),
                        ),
                        onPressed: (){
                          AppCubit.get(context).getProfileImage();
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  if(AppCubit.get(context).profileImage != null)
                    Row(
                      children: [
                        if(AppCubit.get(context).profileImage != null)
                          Expanded(
                            child: Column(
                              children: [
                                defaultButton(
                                    function: (){
                                      AppCubit.get(context).uploadProfileImage(
                                        name: nameController.text,
                                        phone: phoneController.text,
                                        bio: bioController.text,
                                      );
                                    },
                                    text: 'upload profile'
                                ),
                                if(state is UserUpdateLoadingState)
                                  SizedBox(height: 5.0,),
                                if(state is UserUpdateLoadingState)
                                  LinearProgressIndicator(),
                              ],
                            ),
                          ),
                      ],
                    ),
                   SizedBox(height: 20.0,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Full name',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: defaultFormField(
                      controller: nameController,
                      type: TextInputType.name,
                      validate: (String value)
                      {
                        if(value.isEmpty){
                          return 'name must not be empty';
                        }
                        return null;
                      },
                      prefix: IconBroken.User,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Mobile number',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: defaultFormField(
                      controller: phoneController,
                      type: TextInputType.phone,
                      validate: (String value)
                      {
                        if(value.isEmpty){
                          return 'name must not be empty';
                        }
                        return null;
                      },
                      prefix: IconBroken.Call,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Address',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: defaultFormField(
                      controller: bioController,
                      type: TextInputType.text,
                      validate: (String value)
                      {
                        if(value.isEmpty){
                          return 'name must not be empty';
                        }
                        return null;
                      },
                      prefix: IconBroken.Location,
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),

                  defaultButton(
                      function: (){
                        AppCubit.get(context).updateUser(
                            name: nameController.text,
                            phone: phoneController.text,
                            bio: bioController.text,
                        );
                      }, text: 'Save',
                      radius: 6.0
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
