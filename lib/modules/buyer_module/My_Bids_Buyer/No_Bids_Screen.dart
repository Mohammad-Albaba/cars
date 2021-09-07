import 'package:cars/shared/components/components.dart';
import 'package:flutter/material.dart';

class NoBids extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.error,
                size: 75.0,
                color: Colors.cyan,
              ),
              SizedBox(height: 18.0,),
              Text('You have not submitted any bids yet.',style: Theme.of(context).textTheme.bodyText1,),
              SizedBox(height: 12.0,),
              Text('Want to buy car?',style: Theme.of(context).textTheme.subtitle2,),
              SizedBox(height: 32.0,),
              defaultButton(
                function: (){

                },
                text: 'Browse auctions',
                radius: 6.0,
                isUpperCase: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
