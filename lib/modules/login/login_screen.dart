import 'package:cars/layout/cars/buyer_layout.dart';
import 'package:cars/layout/cars/cubit/cubit.dart';
import 'package:cars/layout/cars/seller_layout.dart';
import 'package:cars/models/user_model.dart';
import 'package:cars/modules/login/cubit/cubit.dart';
import 'package:cars/modules/login/cubit/states.dart';
import 'package:cars/modules/register/cubit/cubit.dart';
import 'package:cars/modules/register/register_screen.dart';
import 'package:cars/shared/components/components.dart';
import 'package:cars/shared/components/constant.dart';
import 'package:cars/shared/network/local/cache_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget
{
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  UserModel userModel;
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state){
        if(state is LoginSuccessState){
          CacheHelper.saveData(
            key: 'uId',
            value: state.uId,
          ).then((value){
            FirebaseFirestore.instance
                .collection('users')
                .doc(uId)
                .get()
                .then((value){
              print(value.data());
              userModel = UserModel.fromJson(value.data());
              if(value.get('isSeller') == false){
                print(' BuyerLayout');
                navigateAndFinish(context, BuyerLayout());
              }else if(value.get('isSeller') == true){
                navigateAndFinish(context, SellerLayout());
                print(' SellerLayout');
              }
            });

            //   if(userModel.isSeller == true){
            //       navigateAndFinish(context, SellerLayout());
            //   }
            //       navigateAndFinish(context, BuyerLayout());
            // }).catchError((error){
            //   error.toString();
            /////////////////////
            // UserModel userModel;
            // void typeUser()
            // {
            //   FirebaseFirestore.instance
            //       .collection('users')
            //       .doc(uId)
            //       .get()
            //       .then((value){
            //     userModel = UserModel.fromJson(value.data());
            //     if(userModel.isSeller == true){
            //       MaterialPageRoute(
            //         builder: (context) => SellerLayout(),
            //       );
            //     }
            //     MaterialPageRoute(
            //       builder: (context) => BuyerLayout(),
            //     );
            //   }).catchError((error){
            //     error.toString();
            //   });
            //
            // }

            // if(AppCubit.get(context).userModel.isSeller == true){
            //   navigateAndFinish(context, SellerLayout());
            // }else
            //   {
            //     navigateAndFinish(context, BuyerLayout());
            //   }
          });
          }
          if(state is LoginErrorState){
              showToast(
                  text: state.error,
                  state: ToastStates.ERROR,
              );
          }
      },
      builder: (context, state){
        return Scaffold(
          appBar: AppBar(
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'LOGIN',
                        style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Login now to Mazad X',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      defaultFormField(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        validate: (String value){
                          if(value.isEmpty){
                            return 'Please enter your email address';
                          }
                        },
                        label: 'Email Address',
                        prefix: Icons.email_outlined,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      defaultFormField(
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        suffix: LoginCubit.get(context).suffix,
                        onSubmit: (value){
                          if(formKey.currentState.validate()){
                            LoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text
                            );
                          }
                        },
                        isPassword: LoginCubit.get(context).isPassword,
                        suffixPressed: (){
                          LoginCubit.get(context).changePasswordVisibility();
                        },
                        validate: (String value){
                          if(value.isEmpty){
                            return 'Password is too short';
                          }
                        },
                        label: 'Password',
                        prefix: Icons.lock_outline,
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      ConditionalBuilder(
                        condition: state is! LoginLoadingState,
                        builder: (context) => defaultButton(
                          function: () async{
                            if(formKey.currentState.validate())
                            {
                              LoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text
                              );
                            }
                          },
                          text: 'login',
                          isUpperCase: true,
                        ),
                        fallback: (context) => Center(child: CircularProgressIndicator()),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                          ),

                          defaultTextButton(
                            function:  (){
                              navigateTo(
                                  context,
                                  RegisterScreen()
                              );
                            },
                            text: 'register',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
