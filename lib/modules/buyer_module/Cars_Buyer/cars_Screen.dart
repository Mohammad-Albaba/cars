import 'package:cars/shared/components/components.dart';
import 'package:cars/shared/styles/colors.dart';
import 'package:cars/shared/styles/icon_broken.dart';
import 'package:flutter/material.dart';

class CarsScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 150,
            centerTitle: true,
            title: Column(
              children: [
                SizedBox(height: 16.0,),
                Text(
                  'Auctions',
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
                    label: 'Search for cars',

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
                            child: Text('All'),
                          ),
                          Tab(
                            child: Text('Ending Soon'),
                          ),
                          Tab(
                            child: Text('No reserve'),
                          ),
                          Tab(
                            child: Text('Lowest mileage'),
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
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Container(
                    height: 180.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        4.0,
                      ),
                      image: DecorationImage(
                        image:  NetworkImage('https://image.freepik.com/free-photo/happy-buyer-sitting-new-vehicle-holding-car-keys_342744-750.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          5.0,
                        ),
                        color: Colors.black.withOpacity(0.7),
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            child: Padding(
                              padding: const EdgeInsets.all(
                                5.0,
                              ),
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
                                    '1 Day',
                                    style: Theme.of(context).textTheme.caption.copyWith(
                                        color: Colors.white
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
                                  5.0
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'High Bid',
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
                                    '\# Bid',
                                    style: Theme.of(context).textTheme.caption.copyWith(
                                      color: Colors.white.withOpacity(0.7),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    '16',
                                    style: Theme.of(context).textTheme.caption.copyWith(
                                        color: Colors.white
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
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    IconBroken.Chat,
                                    size: 16.0,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    'comments 126',
                                    style: Theme.of(context).textTheme.caption.copyWith(
                                        color: Colors.white.withOpacity(0.7)
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: (){},
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0,),
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                style: Theme.of(context).textTheme.subtitle1,

              ),
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,',
                style: Theme.of(context).textTheme.caption,
              ),

            ],
          ),
        ),
      );
  }

