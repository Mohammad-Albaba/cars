import 'package:cars/layout/buyer_app/buyer_layout.dart';
import 'package:cars/layout/seller_app/seller_layout.dart';
import 'package:cars/modules/login/cubit/cubit.dart';
import 'package:cars/modules/login/cubit/states.dart';
import 'package:cars/modules/register/register_screen.dart';
import 'package:cars/shared/components/components.dart';
import 'package:cars/shared/network/local/cache_helper.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget
{
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state){
          if(state is LoginErrorState){
              showToast(
                  text: state.error,
                  state: ToastStates.ERROR,
              );
          }
          if(state is LoginSuccessState){
            CacheHelper.saveData(
                key: 'uId',
                value: state.uId,
            ).then((value){
              navigateAndFinish(context, BuyerLayout());
              // navigateAndFinish(context, SellerLayout());
            });
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
                            function: (){
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
      ),
    );
  }
}
