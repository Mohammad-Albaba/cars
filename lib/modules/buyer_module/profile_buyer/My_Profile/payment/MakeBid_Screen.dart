import 'package:cars/modules/buyer_module/profile_buyer/My_Profile/test.dart';
import 'package:cars/modules/chats/chat_Screen.dart';
import 'package:cars/shared/components/components.dart';
import 'package:cars/shared/styles/colors.dart';
import 'package:cars/shared/styles/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MakeBidBuyer extends StatefulWidget {

  @override
  _MakeBidBuyerState createState() => _MakeBidBuyerState();
}

class _MakeBidBuyerState extends State<MakeBidBuyer> {
  var bidController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Form(
            key: formKey,
            child: Container(
              color: Colors.white,
              child: Column(
              children: [
                SizedBox(height: 100.0,child: Container(
                  color: bgColor,
                ),),
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(color: Colors.black26),
                ),
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: InkWell(child: new Icon(Icons.close),onTap: (){Navigator.pop(context);},),
                    title : Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: new Text('Make Bid',textAlign: TextAlign.center,),
                    ),
                  ),
                  SizedBox(
                    width: 13.0,
                  ),
                  Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 26.0,
                          ),
                          Text(
                            'Bid',
                            style: Theme.of(context).textTheme.bodyText2.copyWith(
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(height: 8.0,),
                          Container(
                            height: 50.0,
                            color: Colors.white,
                            child: TextFormField(
                              controller: bidController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Enter your Bid',
                                hintStyle: Theme.of(context).textTheme.caption.copyWith(
                                  fontSize: 14.0,
                                ),
                                border: OutlineInputBorder(),
                                suffix: Text('USD',style: Theme.of(context).textTheme.subtitle2,),
                              ),
                              validator: (String value)
                              {
                                if(value.isEmpty && value == null){
                                  return 'Bid must not be empty';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: 20.0,),
                          defaultButton(
                            function: (){
                              if(formKey.currentState != null && formKey.currentState.validate())
                                return showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) => AlertDialog(
                                    title: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(height: 15.0,),
                                            Container(
                                              width: 34.0,
                                              height: 34.0,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Theme.of(context).scaffoldBackgroundColor,
                                              ),
                                              child: Image(
                                                image: AssetImage('assets/images/a.jpg'),
                                                fit: BoxFit.cover,
                                              ),
                                            ),

                                            SizedBox(height: 12.0,),
                                            Text(
                                              'Congra tulations',
                                              style: Theme.of(context).textTheme.bodyText1,
                                            ),
                                          ],
                                        ),
                                        Positioned(
                                          top: 2.0,
                                          left: 2.0,
                                          child: InkWell(
                                            child: Container(
                                              width: 30.0,
                                              height: 30.0,
                                              padding: EdgeInsets.all(8.0),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(6.0),
                                                color: Colors.white,
                                              ),
                                              child: Icon(
                                                Icons.close,
                                                size: 18.0,
                                                color: Colors.black.withOpacity(0.7),
                                              ),
                                            ),
                                            onTap: (){
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    content: Text(
                                      'You win the bid “BMW M5 Power 510i 2021”',
                                      style: Theme.of(context).textTheme.caption.copyWith(
                                        fontSize: 14.0,
                                      ),
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                    ),
                                    actions: [
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: defaultButton(
                                          function: (){
                                             navigateTo(context, ChatScreen());
                                          },
                                          text: 'Contact Seller',
                                          width: 280,
                                          isUpperCase: false,
                                          radius: 6.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                            },
                            text: 'Make Bid',
                            radius: 6.0,
                            isUpperCase: false,
                          ),
                          SizedBox(height: 14.0,),
                          Row(
                            children: [
                              Text('Current Bid:',style: Theme.of(context).textTheme.subtitle2,),
                              Text('\$16,850',style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.blue),),
                            ],
                          ),
                          SizedBox(height: 14.0,),
                          Text(
                            'We require a valid credit card on file before you can bid. Winning bidders pay a 4.5% buyer’s fee to Cars & Bids on top of the winning bid amount. The minimum buyer’s fee is \$225, and the maximum is \$4,500. Bids are binding, so please bid wisely!',
                            style: Theme.of(context).textTheme.bodyText2.copyWith(
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(height: 60.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('By making bid you agree our',style: Theme.of(context).textTheme.subtitle2,),
                              Text('services & terms',style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.blue),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
              ],

              ),
            ),
          ),
        ),
    );
  }
}
