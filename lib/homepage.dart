import 'package:covid_app_final/Panels/mosteffectedcountries.dart';
import 'package:covid_app_final/Panels/worldwidepanel.dart';
import 'package:covid_app_final/datasource.dart';
import 'package:covid_app_final/pages/countryPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Panels/infopanel.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}


class _HomepageState extends State<Homepage> {
  Map worldData;//map variable

  fetchWorldWideData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData =
          json.decode(response.body); //decoding string format to json format
    });
  }
    List countryData;//list variable
  fetchCountryData() async {
      http.Response response = await http.get(
          'https://corona.lmao.ninja/v2/countries');
      print(response.body);
      setState(() {
        countryData =
            json.decode(response.body); //decoding string format to json format
      });
    }


    @override
  void initState() {
    // TODO: implement initState
      fetchWorldWideData();
      fetchCountryData();
      super.initState();

  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("COVID-19 TRACKER"),
          centerTitle: false,
        ),
        body: SingleChildScrollView(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              height: 100,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              color: Colors.orange[100],
              child: Text(
                  Datasource.quote, style: TextStyle(color: Colors.orange[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 18

              )),),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('WorldWide', style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 22),),
                  GestureDetector(
                    onTap: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryPage()));
                    },
                    child: Container(

                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: primaryBlack,

                        )

                        ,
                        child: Text('Regional', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),)),
                  ),
                ],
              ),
            ),
            worldData == null ? CircularProgressIndicator() : WorldwidePanel(
              worldData: worldData,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              child: Text('Most affected Countries', style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 22),),
            ),
            countryData==null?Container():MostAffectedPanel(countryData: countryData,),
            Infopanel(),
            SizedBox(height:20,),
            Center(child: Text('WE ARE TOGETHER IN THIS FIGHT',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),
            SizedBox(height:50)


          ],
        )),
      );
    }
  }

