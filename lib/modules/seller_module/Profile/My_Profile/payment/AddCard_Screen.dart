import 'package:cars/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddCardSeller extends StatelessWidget {
  var nameCardController = TextEditingController();
  var numberCardController = TextEditingController();
  var dateCardController = TextEditingController();
  var cvCardController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: 'Add Card',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Card Details',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'We require a valid credit card on file before you can bid.',
                style: Theme.of(context).textTheme.caption.copyWith(
                  fontSize: 14.0,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 26.0,
              ),
              Text(
                'Cardholder name',
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 10.0,),
              Container(
                color: Colors.white,
                child: TextFormField(
                  controller: nameCardController,
                  keyboardType: TextInputType.text,
                 decoration: InputDecoration(
                   hintText: 'Enter cardholder name',
                   hintStyle: Theme.of(context).textTheme.caption.copyWith(
                     fontSize: 14.0,
                   ),
                   border: OutlineInputBorder(),
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
              SizedBox(
                height: 14.0,
              ),
              Text(
                'Card number',
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 10.0,),
              Container(
                color: Colors.white,
                child: TextFormField(
                  controller: numberCardController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Enter card number',
                    hintStyle: Theme.of(context).textTheme.caption.copyWith(
                      fontSize: 14.0,
                    ),
                    border: OutlineInputBorder(),
                  ),
                  validator: (String value)
                  {
                    if(value.isEmpty){
                      return 'card number must not be empty';
                    }
                    return null;
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 26.0,
                        ),
                        Text(
                          'Expiry date',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        Container(
                          color: Colors.white,
                          child: TextFormField(
                            controller: dateCardController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: 'Enter Expiry Date',
                              hintStyle: Theme.of(context).textTheme.caption.copyWith(
                                fontSize: 14.0,
                              ),
                              border: OutlineInputBorder(),
                            ),
                            validator: (String value)
                            {
                              if(value.isEmpty){
                                return 'date must not be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 13.0,
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 26.0,
                        ),
                        Text(
                          'CVV',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        Container(
                          color: Colors.white,
                          child: TextFormField(
                            controller: cvCardController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: 'Enter CVV',
                              hintStyle: Theme.of(context).textTheme.caption.copyWith(
                                fontSize: 14.0,
                              ),
                              border: OutlineInputBorder(),
                            ),
                            validator: (String value)
                            {
                              if(value.isEmpty){
                                return 'CVV must not be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18.0,),
              defaultButton(
                function: (){
                }, text: 'Add Card',
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
