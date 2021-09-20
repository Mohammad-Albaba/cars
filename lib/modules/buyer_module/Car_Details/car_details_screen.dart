import 'dart:ui';
import 'package:cars/layout/cars/cubit/cubit.dart';
import 'package:cars/layout/cars/cubit/states.dart';
import 'package:cars/modules/buyer_module/profile_buyer/My_Profile/payment/AddCard_Screen.dart';
import 'package:cars/modules/buyer_module/profile_buyer/My_Profile/payment/MakeBid_Screen.dart';
import 'package:cars/shared/components/components.dart';
import 'package:cars/shared/styles/colors.dart';
import 'package:cars/shared/styles/icon_broken.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel{
  final String image;

  BoardingModel({
    @required this.image,
  });
}
class CarDetails extends StatefulWidget
{
  @override
  _CarDetailsState createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/bg.png',

    ),
    BoardingModel(
      image: 'assets/images/bg.png',
    ),
    BoardingModel(
      image: 'assets/images/bg.png',
    ),
  ];
  // ExpansionList
  List _data = generateItems(1);

  Widget _buildListPanel(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ExpansionPanelList(
          expansionCallback: (int index, isExpanded){
            setState(() {
              _data[index].isExpanded = !isExpanded;
            });
          },
          children: _data.map<ExpansionPanel>((item){
            return ExpansionPanel(
              headerBuilder: (BuildContext context, isExpanded){
                return ListTile(
                  title: Text('Details'),
                );
              },
              body: Column(
                children: [
                  ListTile(
                    title: Text('Item No'),
                    trailing: Text('ICI460943'),
                  ),
                  ListTile(
                    title: Text('Vin Number'),
                    trailing: Text('KMHJU81VBDU597429'),
                  ),
                  ListTile(
                    title: Text('Vechicle Type'),
                    trailing: Text('SUV'),
                  ),
                  ListTile(
                    title: Text('Model'),
                    trailing: Text('Tucson ix'),
                  ),
                  ListTile(
                    title: Text('Class / Grade'),
                    trailing: Text('LX20 2WD A/T Smart Key'),
                  ),
                  ListTile(
                    title: Text('Odometer Reading'),
                    trailing: Text('. Km (Not actual'),
                  ),
                  ListTile(
                    title: Text('Transmission'),
                    trailing: Text('Automatic'),
                  ),
                  ListTile(
                    title: Text('Driver type'),
                    trailing: Text('Front 2WD'),
                  ),
                  ListTile(
                    title: Text('Steering'),
                    trailing: Text('LHD'),
                  ),
                  ListTile(
                    title: Text('Number of Passengers'),
                    trailing: Text('5'),
                  ),
                  ListTile(
                    title: Text('Exterior Color'),
                    trailing: Text('White'),
                  ),
                ],
              ),
              isExpanded: item.isExpanded,
            );
          }).toList(),

        ),
        Container(child: SizedBox(height: 13.0,),color: Colors.white,),

        ExpansionPanelList(
          expansionCallback: (int index, isExpandedTwo){
            setState(() {
              _data[index].isExpandedTwo = !isExpandedTwo;
            });
          },
          children: _data.map<ExpansionPanel>((item){
            return ExpansionPanel(
              headerBuilder: (BuildContext context, isExpandedTwo){
                return ListTile(
                  title: Text('Options'),
                );
              },
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Safety Devices'),
                    SizedBox(height: 8.0,),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0,),
                        color: bgColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('.Driver Airbag'),
                          Text('.Side Airbag'),
                          Text('.ABS (Anti-lock Brake System)'),
                          Text('.EPS (Electric Power Steering)'),
                          Text('.Spare Tire (Tire Mobility Kit)'),
                          Text('.Passenger Airbag'),
                          Text('.Park Assist Sensor'),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.0,),
                    Text('Exterior Option'),
                    SizedBox(height: 8.0,),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0,),
                        color: bgColor,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('.Rear Spoiler'),
                          Spacer(),
                          Text('.Roof Rack'),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.0,),
                    Text('Interior Option'),
                    SizedBox(height: 8.0,),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0,),
                        color: bgColor,
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('.Air Condinitior'),
                              Text('.Heading Seat'),
                              Text('.Power Streering'),
                              Text('.Cruise Control'),
                              Text('.Radio'),
                              Text('.USB'),
                              Text('.Auto Floding Sdie miror'),
                              Text('.Smart Key'),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('.Full Auto Air Conditioner'),
                              Text('.Leather Seats '),
                              Text('.Heated Steering'),
                              Text('.Steering Romocon'),
                              Text('.CD Player'),
                              Text('.Bluetooth'),
                              Text('.Power Windows'),
                              Text('.Button Start/Stop'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              isExpanded: item.isExpandedTwo,
            );
          }).toList(),

        ),
      ],
    );

  }

  List sortComments = ['Newest','Oldest',];
  String dropDownValueSort = 'Newest';
  var commentsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){},
      builder: (context, state){
        return Scaffold(
          body: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: 300.0,
                      width: double.infinity,
                      child: PageView.builder(
                        onPageChanged: (int index){},
                        physics: BouncingScrollPhysics(),
                        controller: boardController,
                        itemBuilder: (context , index) => buildBoardingItem(boarding[index]),
                        itemCount: 3,
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      child: SmoothPageIndicator(
                          controller: boardController,
                          effect: ExpandingDotsEffect(
                            dotColor: Colors.white,
                            activeDotColor: defaultColor,
                            dotHeight: 10,
                            expansionFactor: 4.0,
                            dotWidth: 10,
                            spacing: 5.0,
                          ),
                          count: boarding.length
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0,right: 16.0,top: 12.0,bottom: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '2013 Hyundai Tucson ix 2WD',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          'SUV . Diesel . Automatic . Front 2WD . 1,995cc . 5 seats . LHD',
                          style: Theme.of(context).textTheme.caption,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 10.0,),
                        Row(
                          children: [
                            Text(
                              'Higher Bid',
                              style: Theme.of(context).textTheme.caption,
                            ),
                            Spacer(),
                            Text(
                              'USD 18,500',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 13.0,),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          child: _buildListPanel(),
                        ),
                        SizedBox(height: 13.0,),
                        Container(
                          width: double.infinity,
                          height: 210.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Contact Seller',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                SizedBox(height: 13.0,),
                                Row(
                                  children: [
                                    Image(
                                      image: NetworkImage(
                                          'https://image.freepik.com/free-vector/realistic-car-headlights-ad-composition-headlights-with-green-purple-illumination_1284-56577.jpg'
                                      ),
                                      height: 62.0,
                                      width: 62.0,
                                      fit: BoxFit.cover,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Ahmad Tarboosh',
                                            style: Theme.of(context).textTheme.bodyText1,
                                          ),
                                          Text(
                                            'Elriyad, UAE',
                                            style: Theme.of(context).textTheme.caption,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(Icons.arrow_forward_ios, size: 16.0,color: Colors.black54,),
                                  ],
                                ),
                                SizedBox(height: 13.0,),
                                Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        height:45.0,
                                        child: ElevatedButton(
                                          onPressed: (){},
                                          child: Text(
                                            'Call',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0,
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.blue,
                                            side: BorderSide(width:2, color:Colors.blue), //border width and color
                                            elevation: 3, //elevation of button
                                            shape: RoundedRectangleBorder( //to set border radius to button
                                                borderRadius: BorderRadius.circular(6)
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10.0,),
                                    Expanded(
                                      child: SizedBox(
                                        height: 45.0,
                                        child: ElevatedButton(
                                          onPressed: (){},
                                          child: Text(
                                            'Message',
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0,
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.white,
                                            side: BorderSide(width:2, color:Colors.blue), //border width and color
                                            elevation: 3, //elevation of button
                                            shape: RoundedRectangleBorder( //to set border radius to button
                                                borderRadius: BorderRadius.circular(6)
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0,),
                        Container(
                          padding: EdgeInsets.all(16.0),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Bids & Comments',
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 50,
                                    width: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: DropdownButton<String>(
                                        isExpanded: true,
                                        underline: Container(),
                                        value: this.dropDownValueSort,
                                        onChanged: (v){
                                          setState(() {
                                            this.dropDownValueSort = v ;
                                          });
                                        },
                                        hint:Text("Newest"),
                                        items: sortComments.map((e){
                                          return DropdownMenuItem<String>(
                                            child: Text(e,style: Theme.of(context).textTheme.subtitle2.copyWith(
                                              fontSize: 14.0,
                                            ),),
                                            value: (e),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 13.0,),
                              Container(
                                height: 50.0,
                                color: Colors.white,
                                child: TextFormField(
                                  controller: commentsController,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    hintText: 'Add a comment...',
                                    hintStyle: Theme.of(context).textTheme.caption.copyWith(
                                      fontSize: 14.0,
                                    ),
                                    border: OutlineInputBorder(),
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: InkWell(
                                        child: CircleAvatar(
                                            radius: 15.0,
                                            child: Icon(Icons.arrow_forward_outlined,size: 13.0,)),
                                        onTap: (){},
                                      ),
                                    ),
                                  ),
                                  validator: (String value)
                                  {
                                    if(value.isEmpty){
                                      return 'name must not be empty';
                                    }
                                    return null;
                                  },

                                ),
                              ),

                              Container(
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) => buildCommentItem(context),
                                  separatorBuilder: (context, index) => myDivider(),
                                  itemCount: 4,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  top: 16.0,
                                  bottom: 8.0,
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 5.0,
                                  color: Colors.grey[300],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Recommend Cars',
                                      style: Theme.of(context).textTheme.bodyText1,

                                    ),
                                    Spacer(),
                                    Row(
                                      children: [
                                        Text(
                                          'SEE ALL',
                                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                            color: defaultColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 205.0,
                                width: double.infinity,
                                child: ListView.separated(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) => buildCategoryRecommendCarsItem(context),
                                  separatorBuilder: (context, index) => SizedBox(
                                    width: 12.0,
                                  ),
                                  itemCount: 10,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  top: 16.0,
                                  bottom: 8.0,
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 5.0,
                                  color: Colors.grey[300],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                Container(
                  height: 83.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      defaultButton(
                        function: ()
                        {
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
                                      CircleAvatar(
                                          radius: 35.0,
                                          backgroundColor: bgColor,
                                          child: Icon(Icons.payment ,size: 20.0,color: Colors.blue,)
                                      ),
                                      SizedBox(height: 12.0,),
                                      Text(
                                        'Add card to bid',
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
                                'We require a valid credit card on file before you can bid.',
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
                                      navigateTo(context, AddCardBuyer());
                                    },
                                    text: 'Add Card',
                                    width: 280,
                                    isUpperCase: false,
                                    radius: 6.0,
                                  ),
                                ),
                              ],
                            ),
                          );

                        },
                        text: 'Place Your Bid',
                        width: 288,
                        radius: 8.0,
                        isUpperCase: false,
                      ),
                      SizedBox(width: 10.0,),
                      InkWell(
                        child: Container(
                            height: 45.0,
                            width: 45.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 6.0,
                                ),
                              ],
                            ),
                            child: Icon(Icons.favorite_border, color: Colors.blue,)
                        ),
                        onTap: (){
                          navigateTo(context, MakeBidBuyer());
                        },
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        );
      },
    );

  }

  Widget buildBoardingItem(BoardingModel model) => Image(
    width: double.infinity,
    fit: BoxFit.cover,
    image: AssetImage('${model.image}'),
  );
}
class Item{
  String expandedValue;
  String headerValue;
  bool isExpanded;
  bool isExpandedTwo;

  Item({this.expandedValue,this.headerValue,this.isExpanded=false,this.isExpandedTwo=false});
}
List<Item> generateItems(int numberOfItems){
  return List.generate(numberOfItems, (index){
    return Item(
        headerValue: 'Details $index',
        expandedValue: 'This is item number $index'
    );
  });
}

Widget buildCommentItem(context) =>
    Padding(
      padding: const EdgeInsets.only(bottom: 16.0,),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
                radius: 15.0,
                backgroundColor: bgColor,
                child: Icon(Icons.person_outline_outlined ,size: 15.0,)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Mohammad Ayman',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                // if(AppCubit.get(context).comment != null)
                SizedBox(
                  width: 200,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Lorem Ipsum is simply dummy text of the printing',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Row(
                children: [
                  Text('Bid',style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Colors.grey,
                  ),),
                  SizedBox(width: 5.0,),
                  Text(
                    '\$10,550',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

Widget buildCategoryRecommendCarsItem(context) => Container(
  child:   Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            width: 190.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Image(
              image: NetworkImage(
                  'https://image.freepik.com/free-photo/blue-sport-sedan-parked-yard_114579-5078.jpg'
              ),
              height: 138.0,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 30.0,
                  height: 30.0,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.white,
                  ),
                  child: InkWell(
                    child: Icon(
                      Icons.favorite_border,
                      size: 14.0,
                      color: Colors.black.withOpacity(0.7),
                    ),
                    onTap: (){},
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
        child: Text(
          'BMW M5 Power',
          textAlign: TextAlign.start,
          maxLines: 1,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Text(
          'York, PA 17406',
          textAlign: TextAlign.start,
          maxLines: 1,
          style: Theme.of(context).textTheme.subtitle1.copyWith(
            color: Colors.grey,
          ),
        ),
      ),
    ],
  ),
);