
import 'package:cars/modules/buyer_module/Car_Details/car_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';
import '../../../shared/components/components.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/icon_broken.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List location = ['Gaza Strip','Armenia','Angola','Bahamas',];

  String dropDownValue = 'Gaza Strip';
  var searchController = TextEditingController();

  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4',
    )
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
         shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(14.0),
          ),
        ),
        toolbarHeight: 170,
        backgroundColor: defaultColor,
        title: Column(
          children: [
            Row(
              children: [
                Text(
                  'Mazad X',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),),
                 Spacer(),
                Center(
            child: Container(
            height: 30,
            width: 115,
            decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(6.0),
            ),
            child: Stack(
              children: <Widget>[
                DropdownButton<String>(
                  value: dropDownValue,
                  //icon: Icon(Icons.arrow_downward),
                  iconSize: 20,
                  iconEnabledColor: Colors.black.withOpacity(0.6),
                  elevation: 16,
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  underline: Container(),
                  onChanged: (String newValue) {
                    setState(() {
                      dropDownValue = newValue;
                    });
                  },
                  items: location
                      .map<DropdownMenuItem<String>>((e) {
                    return DropdownMenuItem<String>(
                      value: e,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Text("$e"),
                      ),
                    );
                  }).toList(),
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Icon(Icons.location_on_outlined,size: 18,color: Colors.black.withOpacity(0.6),)),
              ],
            ),
          ),
                  ),
                IconButton(
                  color: Colors.white,
                  icon: Icon(IconBroken.Notification),
                  onPressed: (){},
                ),
              ],
            ),
            SizedBox(height: 25.0,),
            Container(
              height: 45.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: defaultFormField(
                controller: searchController,
                type: TextInputType.text,
                onChange: (value)
                {
                },
                validate: (String value)
                {
                  if(value.isEmpty)
                  {
                    return 'search must not be empty';
                  }
                  return null;
                },
                label: 'Search for cars',

                prefix: Icons.search,
              ),
            ),
          ],
        ),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 5.0,
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {}, // Handle your callback.
                splashColor: Colors.brown.withOpacity(0.5),
                child: Ink(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/ads.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Text(
                          'New Auctions',
                          style: Theme.of(context).textTheme.bodyText1,

                        ),
                        Spacer(),
                        Row(
                          children: [
                            Text(
                              'VIEW All',
                              style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: defaultColor,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: defaultColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    child: Container(
                      height: 230.0,
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => buildCategoryNewAuctionItem(context),
                        separatorBuilder: (context, index) => SizedBox(
                          width: 8.0,
                        ),
                        itemCount: 10,
                      ),
                    ),
                    onTap: (){
                      navigateTo(context, CarDetails());
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Brands',
                      style: Theme.of(context).textTheme.bodyText1,

                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 110.0,
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => buildCategoryBrandItem(context),
                      separatorBuilder: (context, index) => SizedBox(
                        width: 8.0,
                      ),
                      itemCount: 10,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Text(
                          'Hot Auctions',
                          style: Theme.of(context).textTheme.bodyText1,

                        ),
                        Icon(Icons.whatshot_rounded,color: Colors.amberAccent,),
                        Spacer(),
                        Row(
                          children: [
                            Text(
                              'VIEW All',
                              style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: defaultColor,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: defaultColor,
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
                    height: 230.0,
                    width: double.infinity,
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => buildCategoryHotAuctionItem(context),
                      separatorBuilder: (context, index) => SizedBox(
                        width: 8.0,
                      ),
                      itemCount: 10,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),                    child: Row(
                      children: [
                        Text(
                          'Videos',
                          style: Theme.of(context).textTheme.bodyText1,

                        ),
                        Spacer(),
                        Row(
                          children: [
                            Text(
                              'VIEW All',
                              style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: defaultColor,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: defaultColor,
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
                    height: 165,
                    width: double.infinity,
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => buildCategoryVideoItem(context),
                      separatorBuilder: (context, index) => SizedBox(
                        width: 8.0,
                      ),
                      itemCount: 10,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 5.0,
                    margin: EdgeInsets.all(5.0),
                    child: InkWell(
                      onTap: () {}, // Handle your callback.
                      splashColor: Colors.brown.withOpacity(0.5),
                      child: Ink(
                        height: 180,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:NetworkImage('https://image.freepik.com/free-psd/blank-billboard-mockup_53876-12218.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),                    child: Row(
                      children: [
                        Text(
                          'Newly Auctions',
                          style: Theme.of(context).textTheme.bodyText1,

                        ),
                        Spacer(),
                        Row(
                          children: [
                            Text(
                              'VIEW All',
                              style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: defaultColor,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: defaultColor,
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
                    height: 230.0,
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => buildCategoryNewlyAuctionItem(context),
                      separatorBuilder: (context, index) => SizedBox(
                        width: 8.0,
                      ),
                      itemCount: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }

  Widget buildCategoryNewAuctionItem(context) => Card(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Image(
                image: NetworkImage(
                  'https://img.freepik.com/free-photo/blue-jeep-parking-public-zone_114579-4042.jpg?size=626&ext=jpg'
                ),
                height: 138.0,
                width: 188.0,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.black.withOpacity(.7,),
              ),
              margin: EdgeInsets.only(right: 20, bottom: 6.0),
              padding : EdgeInsets.all(3.0),
              width: 150.0,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          Icon(
                            IconBroken.Time_Circle,
                            size: 16.0,
                            color: Colors.white.withOpacity(0.7),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '5:55:17',
                            maxLines: 1,
                            style: Theme.of(context).textTheme.caption.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      onTap: (){},
                    ),
                  ),
                  SizedBox(width: 5.0,),
                  Expanded(
                    child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Bid',
                            style: Theme.of(context).textTheme.caption.copyWith(
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '\$16,150',
                            style: Theme.of(context).textTheme.caption.copyWith(
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),
                      onTap: (){},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8.0,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0,left: 8.0,right: 8.0),
          child: Text(
            '1995 Suzuki Wagon R',
            textAlign: TextAlign.start,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0,left: 8.0,right: 8.0),
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

  Widget buildCategoryBrandItem(context) => Container(
    width: 90,
    height: 80,
    child: Card(
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
           Column(
            children: [
              SizedBox(height: 10,),
              Container(
                width: 48.0,
                height: 48.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: SvgPicture.asset(
                  'assets/images/pngfind.svg',
                  width: 48,
                  height: 48,
                ),
              ),


              SizedBox(height: 10,),
              Text(
                'York',
                textAlign: TextAlign.start,
                maxLines: 1,
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                  color: Colors.grey,
                ),
              ),
            ],
           )
         ],
      ),
    ),
  );

  Widget buildCategoryHotAuctionItem(context) => Card(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Image(
                image: NetworkImage(
                    'https://image.freepik.com/free-psd/white-car-isolated_176382-1481.jpg'
                ),
                height: 138.0,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 20.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white.withOpacity(.9,),
                    ),
                    child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            IconBroken.Time_Circle,
                            size: 16.0,
                            color: Colors.blue.withOpacity(0.7),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '01h 02m 45s',
                            maxLines: 1,
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                      onTap: (){},
                    ),
                  ),
                  ElevatedButton(onPressed: (){}, child: Text(
                      '\$16,000'
                  )),
                ],
              ),
            ),

          ],
        ),
        SizedBox(
          height: 8.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
          child: Text(
            '2006 Mini Cooper S John Cooper',
            textAlign: TextAlign.start,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
          child: Text(
            '30,200 Miles,6-Speed Manual',
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

  Widget buildCategoryVideoItem(context) => Padding(
    padding: const EdgeInsets.only(left: 4.0,bottom: 8.0),
    child: Container(
      width: 280.0,
      height: 230,
      child: Stack(
        alignment: Alignment.center,
        children: [
            _controller.value.isInitialized
              ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),

          )
              : Container(),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              });
            },
            backgroundColor: Colors.white12,
            child: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              color: Colors.white,size: 32.0,
            ),
          ),
        ],
      ),
    ),
  );

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }


  Widget buildCategoryNewlyAuctionItem(context) => Card(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Image(
                image: NetworkImage(
                    'https://image.freepik.com/free-photo/blue-automobile-isolated-white-background_39420-48.jpg'
                ),
                height: 138.0,
                width: 228.0,
                fit: BoxFit.cover,
              ),
            ),
            Row(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white.withOpacity(.9,),
                      ),
                      child: InkWell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,

                          children: [
                            Icon(
                              IconBroken.Time_Circle,
                              size: 16.0,
                              color: Colors.blue.withOpacity(0.7),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              '01h 02m 45s',
                              maxLines: 1,
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                        onTap: (){},
                      ),
                    ),
                    ElevatedButton(onPressed: (){}, child: Text(
                        '\$16,000'
                    )),
                  ],
                ),
              ],
            ),

          ],
        ),
        SizedBox(
          height: 8.0,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
          child: Text(
            '1995 Suzuki Wagon R',
            textAlign: TextAlign.start,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
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
}
