import 'package:cars/shared/components/components.dart';
import 'package:flutter/material.dart';

class TermsConditionSeller extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: 'Support',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
              'Lorem lpsum',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: Colors.blue,
              ),
               maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              ),
              SizedBox(height: 8.0,),
              Container(
                width: double.infinity,
                child: Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                  style: Theme.of(context).textTheme.bodyText2,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ),
              ),
              SizedBox(height: 22.0,),
              Text(
                'MazadX Terms',
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: Colors.blue,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              ),
              SizedBox(height: 8.0,),
              Container(
                width: double.infinity,
                child: Text(
                  'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden.',
                  style: Theme.of(context).textTheme.bodyText2,
                  maxLines: 20,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ),
              ),
              SizedBox(height: 22.0,),
              Text(
                'MazadX Conditions',
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: Colors.blue,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              ),
              SizedBox(height: 8.0,),
              Container(
                width: double.infinity,
                child: Text(
                  'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.',
                  style: Theme.of(context).textTheme.bodyText2,
                  maxLines: 20,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
