import 'package:flutter/material.dart';

import '../../../shared/styles/icon_broken.dart';

class UnActiveAuctions extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 5.0,
            margin: EdgeInsets.all(8.0),
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Image(
                  image: NetworkImage('https://image.freepik.com/free-photo/red-luxury-sedan-road_114579-5079.jpg'),
                  fit: BoxFit.cover,
                  height: 200.0,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'communicate with friends',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => buildPostItem(context),
            separatorBuilder: (context, index) => SizedBox(
              height: 8.0,
            ),
            itemCount: 10,
          ),
          SizedBox(
            height: 8.0,
          ),
        ],
      ),
    );
  }
  Widget buildPostItem(context) => Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5.0,
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
                        image:  NetworkImage('https://image.freepik.com/free-photo/grey-metallic-jeep-with-blue-stripe-it_114579-4080.jpg'),
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
