import 'package:cars/shared/components/components.dart';
import 'package:cars/shared/styles/colors.dart';
import 'package:cars/shared/styles/icon_broken.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {

  var messageController = TextEditingController();
  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(14.0),
          ),
        ),
        toolbarHeight: 170,
        backgroundColor: defaultColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 30.0,
                    ),
                    child: IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        IconBroken.Arrow___Left_2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex:6,
                  child: Center(
                    child: Text(
                    'Amr Awad',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: Colors.white,
                    ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      IconBroken.Call,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.0,),
            Padding(
              padding: const EdgeInsets.only(
                right: 14.0,
                left: 14.0,
              ),
              child: Row(
                children: [
                  Container(
                    height: 64.0,
                    width: 64.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        4.0,
                      ),
                      image: DecorationImage(
                        image:  NetworkImage('https://image.freepik.com/free-photo/white-premium-city-crossover-white_101266-526.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 11.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '2013 Hyundai Tucson ix 2WD',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Colors.white
                        ),
                      ),
                      SizedBox(
                        width: 220.0,
                        child: Text(
                          'SUV . Diesel . Automatic . Front 2WD . 1,995cc . 5 seats . LHD',
                          style: Theme.of(context).textTheme.caption.copyWith(
                            color: Colors.white,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: bgColor,
        child: Column(
          children: [
            buildMessage(),
            buildMyMessage(),
            Spacer(),
            Container(
              height: 94.0,
              decoration: BoxDecoration(
              color: Colors.white,
             boxShadow: [
              BoxShadow(
                color: Colors.white30,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Container(
                 width: 290,
                 height: 48.0,
                 child: TextField(
                   decoration: InputDecoration(
                       hintText: 'Say Hi',
                       hintStyle: Theme.of(context).textTheme.caption.copyWith(
                         fontSize: 14.0,
                       ),
                       border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(10.0),
                       ),
                   ),
                   controller: nameController,
                 ),
               ),
               SizedBox(width: 9.0,),
               InkWell(
                 child: Container(
                     height: 48.0,
                     width: 48.0,
                     decoration: BoxDecoration(
                       color: Colors.blue,
                       borderRadius: BorderRadius.circular(6.0),
                       boxShadow: [
                         BoxShadow(
                           color: Colors.white12,
                           offset: Offset(0.0, 1.0), //(x,y)
                           blurRadius: 6.0,
                         ),
                       ],
                     ),
                     child: Icon(IconBroken.Send, color: Colors.white,)
                 ),
                 onTap: (){
                 },
               ),
              ],
           ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMessage() => Align(
    alignment: AlignmentDirectional.centerStart,
    child: Padding(
      padding: const EdgeInsets.only(
        top: 20.0,
        right: 20.0,
        left: 20.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.only(
            bottomEnd: Radius.circular(10.0,),
            topStart:  Radius.circular(10.0,),
            topEnd:  Radius.circular(10.0,),
          ),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 10.0,
        ),
        child: Text(
          'Hello World',
        ),
      ),
    ),
  );
  Widget buildMyMessage() =>   Align(
    alignment: AlignmentDirectional.centerEnd,
    child: Padding(
      padding: const EdgeInsets.only(
        top: 20.0,
        right: 20.0,
        left: 20.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: defaultColor,
          borderRadius: BorderRadiusDirectional.only(
            bottomStart: Radius.circular(10.0,),
            topStart:  Radius.circular(10.0,),
            topEnd:  Radius.circular(10.0,),
          ),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 10.0,
        ),
        child: Text(
          'Hello World',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ),
  );

}
