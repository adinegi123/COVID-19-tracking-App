import 'package:covid_app_final/datasource.dart';
import 'package:covid_app_final/pages/faqs.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class Infopanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(context)=>FAQPage()));
            },
            child: Container(
              color: primaryBlack,
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("FAQS",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                  Icon(Icons.arrow_forward,color: Colors.white,)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              launch('https://covid19responsefund.org/en');
            },
            child: Container(
              color: primaryBlack,
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("DONATE",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                  Icon(Icons.arrow_forward,color: Colors.white,)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){

            },
            child: GestureDetector(
              onTap: (){
                launch('https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters');
              },
              child: Container(
                color: primaryBlack,
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("MYTH BUSTERS",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                    Icon(Icons.arrow_forward,color: Colors.white,)
                  ],
                ),
              ),
            ),
          )


        ],
      ),
    );
  }
}
