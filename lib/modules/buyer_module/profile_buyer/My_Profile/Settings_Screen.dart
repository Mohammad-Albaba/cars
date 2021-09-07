import 'package:cars/shared/components/components.dart';
import 'package:flutter/material.dart';

class SettingsBuyer extends StatefulWidget {
  @override
  _SettingsBuyerState createState() => _SettingsBuyerState();
}

class _SettingsBuyerState extends State<SettingsBuyer> {
  bool switchValue = true;
  bool switch2Value = false;
  bool switch3Value = true;
  bool switch4Value = false;
  bool switch5Value = false;
  bool switch6Value = true;
  bool switch7Value = false;
  bool switch8Value = true;
  bool switch9Value = true;
  bool switch10Value = true;
  bool switch11Value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: 'Settings',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'App SMS',
                style: Theme.of(context).textTheme.bodyText1,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Send me daily sms' , style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),),
                  Spacer(),
                  Switch(value: switchValue, onChanged: (value){
                    setState(() {
                      switchValue = value;
                    });
                  }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Send me week review sms' , style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),),
                  Spacer(),
                  Switch(value: switch2Value, onChanged: (value){
                    setState(() {
                      switch2Value = value;
                    });
                  }),
                ],

              ),
              SizedBox(height: 16.0,),
              Text(
                'General Notification',
                style: Theme.of(context).textTheme.bodyText1,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Play sound when bids are placed' , style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),),
                  Spacer(),
                  Switch(value: switch3Value, onChanged: (value){
                    setState(() {
                      switch3Value = value;
                    });
                  }),
                ],

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Play sound when bids are placed' , style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),),
                  Spacer(),
                  Switch(value: switch4Value, onChanged: (value){
                    setState(() {
                      switch4Value = value;
                    });
                  }),
                ],

              ),
              SizedBox(height: 16.0,),
              Text(
                'Followed List Notifications',
                style: Theme.of(context).textTheme.bodyText1,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Notify me 2 hours before auction ends' , style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),),
                  Spacer(),
                  Switch(value: switch5Value, onChanged: (value){
                    setState(() {
                      switch5Value = value;
                    });
                  }),
                ],

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Notify me when there’s new bids' , style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),),
                  Spacer(),
                  Switch(value: switch6Value, onChanged: (value){
                    setState(() {
                      switch6Value = value;
                    });
                  }),
                ],

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Notify me when there’s new comments' , style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),),
                  Spacer(),
                  Switch(value: switch7Value, onChanged: (value){
                    setState(() {
                      switch7Value = value;
                    });
                  }),
                ],

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Notify me when questions are answered' , style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),),
                  Spacer(),
                  Switch(value: switch8Value, onChanged: (value){
                    setState(() {
                      switch8Value = value;
                    });
                  }),
                ],

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Notify me with the auctions’ results' , style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),),
                  Spacer(),
                  Switch(value: switch9Value, onChanged: (value){
                    setState(() {
                      switch9Value = value;
                    });
                  }),
                ],

              ),
              SizedBox(height: 16.0,),
              Text(
                'Seller Notifications',
                style: Theme.of(context).textTheme.bodyText1,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Send new comments via sms' , style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),),
                  Spacer(),
                  Switch(value: switch10Value, onChanged: (value){
                    setState(() {
                      switch10Value = value;
                    });
                  }),
                ],

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Send new bids via sms' , style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),),
                  Spacer(),
                  Switch(value: switch11Value, onChanged: (value){
                    setState(() {
                      switch11Value = value;
                    });
                  }),
                ],

              ),
            ],
          ),
        ),
      ),
    );
  }
}
