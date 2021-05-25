import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List countryData; //list variable(
  fetchCountryData() async {
    http.Response response =
    await http.get('https://corona.lmao.ninja/v2/countries');
    print(response.body);
    setState(() {
      countryData =
          json.decode(response.body); //decoding string format to json format
    });
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCountryData();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country Data'),
      ),
      body:countryData==null?Center(child: CircularProgressIndicator(),):ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            height: 130,
            decoration: BoxDecoration(
              color: Colors.white
              ,boxShadow: [BoxShadow(color: Colors.grey[100],blurRadius: 10,offset: Offset(0,10))]

          ),
         child: Row(
           children: [
             Container(
               margin: EdgeInsets.symmetric(horizontal: 10),
               child: Column(
                 children: [
                   Text(countryData[index]['country'],style: TextStyle(fontWeight: FontWeight.bold),),
                   Image.network(countryData[index]['countryInfo']['flag'],height: 40,width: 50,)
                 ],

               ),
             ),
             Expanded(child: Container(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text('CONFIRMED'+countryData[index]['cases'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                   Text('ACTIVE'+countryData[index]['cases'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue)),
                   Text('RECOVERED'+countryData[index]['cases'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green)),
                   Text('DEATHS'+countryData[index]['cases'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[800])),
                 ],
               ),
             ))
             
           ],
         ),
          );
        },
        itemCount: countryData == null ? 0 : countryData.length,
      ),
    );
  }
}
