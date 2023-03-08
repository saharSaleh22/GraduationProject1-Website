import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:web_page/models/ordersModel.dart';
import 'package:web_page/models/rateModel.dart';
import 'dart:convert';
import '../models/foodModel.dart';
import '../models/signModel.dart';


String space="                  ";


String user="";
var rateVal=0.0;
String feedback="";

class rates extends StatefulWidget {
  static String routeName = "/dash";
  const rates({Key? key}) : super(key: key);

  @override
  State<rates> createState() => _rates();
}

class _rates extends State<rates> {
  List info = [];
  List valueMap = [];

  List<rateModel> myAllDaea = [];
  
  //int get index => this.index;
int m=0;
  _initData() async {
    
    var response = await http.get(
      Uri.parse("http://192.168.1.35:3002/rateGet"),
      headers: _setHeader(),
    );

    String jsonsDataString = response.body.toString();
    var response3 = jsonDecode(response.body);

    //print(response3[3]);
    // toString of Response's body is assigned to jsonDataString
    valueMap = jsonDecode(jsonsDataString);
    for (var data in valueMap) {
    

      myAllDaea.add(new rateModel(data['user'],
          data['feedback'], 
          data['rateVal']));
 
      user= data['user'];
      feedback= data['feedback'];
      rateVal= data['rateVal'];
m= myAllDaea.length;
      setState(() {
    user= data['user'];
      feedback= data['feedback'];
      rateVal= data['rateVal'];
      });
    }

 
    // setState(() {});
  }

  @override
  void initState() {
   // super.initState();
    // getData();
   setState(() {
     _initData();
   });
    
  }

  //setting the expansion function for the navigation rail
  bool isExpanded = false;
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(60.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //let's add the navigation menu for this project
            Row(
             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    //let's trigger the navigation expansion
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  icon: Icon(Icons.menu),
                  
                ),
                SizedBox(width:450,),
                  Text(
                    textAlign: TextAlign.center,
                            "   Ratings    ",
                            style: TextStyle(
                              
                                color: Color.fromARGB(255, 142, 75, 99),
                                fontWeight: FontWeight.w600,
                                fontSize: 35.0,
                                fontFamily: 'Merriweather'),
                          ),
                // CircleAvatar(
                //   // backgroundImage: NetworkImage(
                //   //     "https://faces-img.xcdn.link/image-lorem-face-3430.jpg"),
                //   radius: 26.0,
                // ),
              ],
            ),

            //Now let's start with the dashboard main rapports

            //Now let's set the article section
            SizedBox(
              height: 30.0,
            ),

            //let's set the filter section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                   
                    SizedBox(
                      width: 20.0,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                   // _buildCard(index),
                    DataTable(
                        headingRowColor: MaterialStateProperty.resolveWith(
                            (states) => Color.fromARGB(255, 208, 135, 162)),
                        columns: [
                                                    DataColumn(label: Text("user")),
                                                    DataColumn(label: Text("Rate")),
                          DataColumn(label: Text("Feedback")),
                        ],
                        
                        rows: [
                        //  _buildCard(index),
                         
                        ]),
                    //Now let's set the pagination
                    SizedBox(
                      height: 40.0,
                    ),
                  
                  ],
                ),
            //Now let's add the Table
            ListView.builder(
              shrinkWrap: true,
              itemCount: myAllDaea.length,
              itemBuilder: (_, int index) {
            
                return GestureDetector(
                 
                    //_onTapVideo(index);
                   // debugPrint(".............");
                    //debugPrint(index.toString());
                 
                   // setState(() {
                    //   // if (_playArea == false) {
                    //   //   _playArea = true;
                    //   // }
                    // });_buildCard(index)
                  child: _buildCard(index)
                );})
              
            ],
            )
          
        ),
      );
    
  }
        _buildCard(int index){
          
              return 
           DataTable(
            
          
                        headingRowColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.grey.shade200),
                        columns: [
                          
                          DataColumn( label: Container(width: 0,child: Text("ID"),),),
                          DataColumn(label: Container(width: 0,child: Text("ID"),),),
                          DataColumn(label: Container(width: 0,child: Text("ID"),),),
                     
                        ],
                        
                        rows: [ DataRow(cells: [
                           
                            DataCell(Text(myAllDaea[index].user,textAlign: TextAlign.center)),
                            DataCell(Text(myAllDaea[index].rateVal.toString(),textAlign: TextAlign.center)),
                            DataCell(Text(myAllDaea[index].feedback,textAlign: TextAlign.center)),
                      

                          ])
                        //  _buildCard(index),
                         
                        ]);
                
               
              }
        

}

_setHeader() => {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
