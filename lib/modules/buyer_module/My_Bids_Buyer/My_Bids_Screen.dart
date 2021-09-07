import 'package:cars/shared/components/components.dart';
import 'package:cars/shared/styles/icon_broken.dart';
import 'package:flutter/material.dart';

class MyBidsScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 150,
            centerTitle: true,
            title: Column(
              children: [
                SizedBox(height: 16.0,),
                Text(
                  'My Bids',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 16.0,),
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
                    label: 'Search in my bids',

                    prefix: Icons.search,
                  ),
                ),
                SizedBox(height: 16.0,),
              ],
            ),
            bottom: PreferredSize(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0,right: 16.0),
                  child: Container(
                    child: TabBar(
                        labelColor: Colors.blue,
                        isScrollable: true,
                        unselectedLabelColor: Colors.black.withOpacity(0.8),
                        indicatorColor: Colors.blue,
                        tabs: [
                          Tab(
                            child: Text('Active'),
                          ),
                          Tab(
                            child: Text('Unactive'),
                          ),
                          Tab(
                            child: Text('Win'),
                          ),
                        ]),
                  ),
                ),
                preferredSize: Size.fromHeight(30.0)),
          ),
          body: TabBarView(
            children: <Widget>[
              Container(
                child: SingleChildScrollView(
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => buildPostItem(context),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 8.0,
                    ),
                    itemCount: 10,
                  ),
                ),
              ),
              Container(
                child: SingleChildScrollView(
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => buildPostItem(context),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 8.0,
                    ),
                    itemCount: 10,
                  ),
                ),
              ),
              Container(
                child: SingleChildScrollView(
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => buildPostItem(context),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 8.0,
                    ),
                    itemCount: 10,
                  ),
                ),
              ),
            ],
          )),
    );
  }
  Widget buildPostItem(context) =>
      Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 2,
        margin: EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 82.0,
                width: 92.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    4.0,
                  ),
                  image: DecorationImage(
                    image:  NetworkImage('https://t3.ftcdn.net/jpg/00/02/93/78/240_F_2937807_uozaLMnBDFle2HwKqsle2HIp9PV2Qx.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 190.0,
                      child: Text(
                        '2013 Hyundai Tucson ix 2WD',
                        maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                    SizedBox(
                      width: 200.0,
                      child: Text(
                        'Elriyad - Saudi Arabia,',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                IconBroken.Time_Circle,
                                size: 16.0,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                '1 Day',
                                style: Theme.of(context).textTheme.caption.copyWith(
                                    color: Colors.black
                                ),
                              ),
                            ],
                          ),
                          onTap: (){},
                        ),
                        SizedBox(width: 5.0,),
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(
                                5.0
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'High Bid',
                                  style: Theme.of(context).textTheme.caption.copyWith(
                                    color: Colors.blue,
                                  ),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  '\$16,150',
                                  style: Theme.of(context).textTheme.caption.copyWith(
                                      color: Colors.black
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: (){},
                        ),
                        SizedBox(width: 5.0,),
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(
                              5.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'My Bid',
                                  style: Theme.of(context).textTheme.caption.copyWith(
                                    color: Colors.blue,
                                  ),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  '\$16,950',
                                  style: Theme.of(context).textTheme.caption.copyWith(
                                      color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: (){},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}

