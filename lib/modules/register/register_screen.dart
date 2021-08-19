import 'package:cars/layout/buyer_app/buyer_layout.dart';
import 'package:cars/layout/seller_app/seller_layout.dart';
import 'package:cars/modules/register/cubit/cubit.dart';
import 'package:cars/modules/register/cubit/states.dart';
import 'package:cars/shared/components/components.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum UserType{Seller, Buyer}
class RegisterScreen extends StatefulWidget
{
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var phoneController = TextEditingController();

  UserType groupValue = UserType.Seller;
  String value = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state)
        {
          if(state is CreateUserSuccessState)
          {
              navigateAndFinish(context, BuyerLayout());
          }
        },
        builder: (context, state){
          return Scaffold(
            appBar: AppBar(),
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
                          'REGISTER',
                          style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Register now to Mazad X',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),

                        Text(
                          'Account type',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                      children: [
                      Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: RadioListTile(
                        title: Text('Seller',
                            style: Theme.of(context).textTheme.headline4.copyWith(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                        ),
                        value: UserType.Seller,
                        groupValue: groupValue,
                        onChanged: (v){
                        this.groupValue = v;
                        setState(() {});
                        }),
                      ),
                      ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: RadioListTile(
                          title: Text('Buyer',
                              style: Theme.of(context).textTheme.headline4.copyWith(
                                color: Colors.black,
                                fontSize: 18,
                              ),),
                          value: UserType.Buyer,
                          groupValue: groupValue,
                          onChanged: (v){
                          this.groupValue = v;
                          setState(() {});
                          }),
                        ),
                        ),

                        ],
                      ),
                        SizedBox(
                          height: 20.0,
                        ),

                        defaultFormField(
                          controller: nameController,
                          type: TextInputType.name,
                          validate: (String value){
                            if(value.isEmpty){
                              return 'Please enter your User Name';
                            }
                          },
                          label: 'User Name',
                          prefix: Icons.person,
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
                          suffix: RegisterCubit.get(context).suffix,
                          onSubmit: (value)
                          {

                          },
                          isPassword: RegisterCubit.get(context).isPassword,
                          suffixPressed: (){
                            RegisterCubit.get(context).changePasswordVisibility();
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
                        defaultFormField(
                          controller: phoneController,
                          type: TextInputType.phone,
                          validate: (String value){
                            if(value.isEmpty){
                              return 'Please enter your phone';
                            }
                          },
                          label: 'Phone',
                          prefix: Icons.phone,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! RegisterLoadingState,
                          builder: (context) => defaultButton(
                            function: (){
                              if(formKey.currentState.validate()){
                                RegisterCubit.get(context).userRegister(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    phone: phoneController.text,
                                );
                              }
                            },
                            text: 'register',
                            isUpperCase: true,
                          ),
                          fallback: (context) => Center(child: CircularProgressIndicator()),
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
