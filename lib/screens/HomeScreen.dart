import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_with_api/providers/Fetchingprovider.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Consumer<ApiProvider>(builder: (context, providerObject, child) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) {
                  var result = providerObject.model?.data;
                  if(result == null){
                    providerObject.fetching();
                    return Center(
                            child: CircularProgressIndicator(),
                    );
                  }
                  else{
                  return Container(
                    margin: EdgeInsets.all(30),
                    child: Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)), child: Image.network(result[index]["imgUrl"], )),
                        SizedBox(height: 5),
                        Text( result[index]["title"] ,style: TextStyle(fontSize: 25 , fontWeight:FontWeight.bold), ),
                        SizedBox(height: 5),
                        Text(result[index]["description"] ,style: TextStyle(foreground: Paint()..color = Colors.black54), )
                      ],
                    ),
                  );}},
                itemCount: providerObject.model?.data.length ,
              ),
            )
          ],
        );
      }),
    );
  }
}
