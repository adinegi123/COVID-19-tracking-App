import 'package:flutter/material.dart';
class WorldwidePanel extends StatelessWidget {
  final Map worldData;

  const WorldwidePanel({Key key, this.worldData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: [
          StatusPanel(
            title:"CONFIRMED",
            panelColor:Colors.red[100],
            textColor:Colors.red,
            count:worldData['cases'].toString()//to covert the json values to string format
          ),
          StatusPanel(
              title:"ACTIVE",
              panelColor:Colors.blue[100],
              textColor:Colors.blue,
              count:worldData['active'].toString()
          ),
          StatusPanel(
              title:"RECOVERED",
              panelColor:Colors.green[100],
              textColor:Colors.green,
              count:worldData['recovered'].toString()
          ),
          StatusPanel(
              title:"DEATHS",
              panelColor:Colors.grey,
              textColor:Colors.black,
              count:worldData['deaths'].toString()
          ),
        ],
      ),
    );
  }
}
class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel({Key key, this.panelColor, this.textColor, this.title, this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;//device width
    return Container(
      padding: EdgeInsets.all(10),
      height: 800,width: width/2,
      color:panelColor,
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [Text(title,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 16,color:textColor),),Text(count,style:TextStyle(fontWeight:FontWeight.bold,fontSize: 16,color: textColor),)],
      ),
    );
  }
}




