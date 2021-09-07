import 'package:cars/shared/components/components.dart';
import 'package:cars/shared/network/local/url_launcher_helpers.dart';
import 'package:cars/shared/styles/colors.dart';
import 'package:cars/shared/styles/icon_broken.dart';
import 'package:flutter/material.dart';

class SupportBuyerScreen extends StatelessWidget {
  var connectController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: defaultAppBar(
        context: context,
        title: 'Support',
    ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 70.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.support_agent_outlined,size: 75.0,color: Colors.blue,),
                SizedBox(height: 30.0,),
                SizedBox(
                  width: 190.0,
                  child: Text(
                    'How we can help you?',
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: 25.0,
                  ),
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    color: Colors.white,
                    child: TextFormField(
                      controller: connectController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                        ),
                        labelText: 'Contact Live Chat',
                        hintText: 'Contact Live Chat',
                        prefixIcon: Icon(Icons.support_agent_outlined,color: Colors.blue,size: 24.0,),
                        suffixIcon: Icon(Icons.arrow_forward_ios,size: 18.0,),
                        border: OutlineInputBorder(),

                      ),
                    ),
                  ),
                ),
                SizedBox(height: 70.0,),
                InkWell(
                  child: CircleAvatar(
                    radius: 35.0,
                    backgroundColor: bgColor,
                    child: Icon(Icons.email_outlined,color: Colors.blue,size: 24.0,),
                  ),
                  onTap: (){
                    UrlLauncherHelper.urlLauncherHelper.sendEmail();
                  },
                ),
                Text(
                  'Send us an e-mail:',
                  style: Theme.of(context).textTheme.caption,
                ),
                SizedBox(height: 8.0,),
                Text(
                  'Support@mazadx.org',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
