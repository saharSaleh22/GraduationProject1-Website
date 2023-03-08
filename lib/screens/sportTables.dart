import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;import 'dart:convert';
import 'package:web_page/models/sportModel.dart';

import '../models/foodModel.dart';
import '../models/signModel.dart';

String title = "";
String title2="";

String videoUrl = "";
int time = 0;
int time1 = 0;

String thumbnail = "";
String path="trainingfirst";
String pathdelete="deleteStomach";
String textpath="Stomach";
String choosenText=" table of :";
class Sporttables extends StatefulWidget {
  static String routeName = "/dash";
  const Sporttables({Key? key}) : super(key: key);

  @override
  State<Sporttables> createState() => _Sporttables();
}

class _Sporttables extends State<Sporttables> {
  List info = [];
  List valueMap = [];

  List<mongoModel> myAllDaea = [];
  
  //int get index => this.index;
int m=0;
  _initData() async {
    
    var response = await http.get(
      Uri.parse("http://192.168.1.35:3002/$path"),
      headers: _setHeader(),
    );
   print("my path : "+path);
    String jsonsDataString = response.body.toString();
    var response3 = jsonDecode(response.body);

    //print(response3[3]);
    // toString of Response's body is assigned to jsonDataString
    valueMap = jsonDecode(jsonsDataString);
    for (var data in valueMap) {
      
      myAllDaea.add(new mongoModel(data['title'], 
          data['time'], data['videoUrl'],data['thumbnail'],));
      // info.add(new signModel(data['email'], data['phone'],data['address'], data['firstname'],data['lastname']));
      title = data['title'];
      time = data['time'];
      videoUrl = data['videoUrl'];
      thumbnail =  data['thumbnail'];
     
m= myAllDaea.length;
      setState(() {
        // info.add(new signModel(data['email'], data['phone'],data['address'], data['firstname'],data['lastname']));
      title = data['title'];
      time = data['time'];
      videoUrl = data['videoUrl'];
      thumbnail =  data['thumbnail'];
      });
    }
    myAllDaea.forEach((element) {
       print(
          'email : ${element.title}   phone :${element.time}  address :${element.thumbnail}  ');
    });
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
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                   SizedBox(width:380,),
                  Text(
                    textAlign: TextAlign.center,
                            " ${textpath} Exercises",
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
                    DropdownButton(
                          
                        hint: Text(choosenText),
                        // ignore: prefer_const_literals_to_create_immutables
                        items: [
                        const DropdownMenuItem(
                            value: "Warm-Up Exercises",
                            child: Text("Warm-Up Exercises"),
                          ),
                          const DropdownMenuItem(
                            value: "Build Exercises",
                            child: Text("Build Exercises"),
                          ),
                            const DropdownMenuItem(
                            value: "Overweight Exercises",
                            child: Text("Overweight Exercises"),
                          ),
                            const DropdownMenuItem(
                            value: "Thigh Exercises",
                            child: Text("Thigh Exercises"),
                          ),
                          const DropdownMenuItem(
                            value: "Stomach Exercises",
                            child: Text("Stomach Exercises"),
                          ),
                          const DropdownMenuItem(
                            value: "Cardio Exercises",
                            child: Text("Cardio Exercises"),
                          ),
                          const DropdownMenuItem(
                            value: "Yoga Exercises",
                            child: Text("Yoga Exercises"),
                          ),
                          const DropdownMenuItem(
                            value: "Zomba Exercises",
                            child: Text("Zomba Exercises"),
                          ),
                          const DropdownMenuItem(
                            value: "Leg Exercises",
                            child: Text("Leg Exercises"),
                          ),
                          const DropdownMenuItem(
                            value: "Arm Exercises",
                            child: Text("Arm Exercises"),
                          ),
                          const DropdownMenuItem(
                            value: "back Exercises",
                            child: Text("back Exercises"),
                          ),
                           const DropdownMenuItem(
                            value: "Gainweight Exercises",
                            child: Text("Gainweight Exercises"),
                          ),
                        
                        ],
                        onChanged: (value) {
                           print("this is my value"+value!);
                          selected(value);
                            hint: Text(
                "Select Your Field"
              );
              setState(() {
                choosenText=value;
              });

                        }),
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
                          DataColumn(label: Text("Title")),
                          DataColumn(label: Text("Time ")),
                          DataColumn(label: Text("Exercise Video")),
                          DataColumn(label: Text("image")),
                          DataColumn(label: Text("delete")),
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
                          DataColumn(label: Container(width: 0,child: Text("ID"),),),
                          DataColumn(label: Container(width: 0,child: Text("ID"),),),
                         

                        
                        ],
                        
                        rows: [ DataRow(cells: [
                           
                            DataCell(Text(myAllDaea[index].title)),
                            DataCell(Text(myAllDaea[index].time.toString())),
                            DataCell(Text(myAllDaea[index].videoUrl)),
                            DataCell(Text(myAllDaea[index].thumbnail)),
                            DataCell(IconButton(onPressed: () {
                              print(myAllDaea[index].title);
                              title2=myAllDaea[index].title;
                              print("....."+title2);
                              getData();
                            },icon: Icon(Icons.delete),)),
                          ])
                        //  _buildCard(index),
                         
                        ]);
                
               
              }
  void selected(value) {

       if(value == "Warm-Up Exercises"){
         path="Warmget";
         pathdelete="deleteBuild";
         textpath="Warm-Up";
    }else if(value == "Build Exercises"){
      path="trainingfourth";
      textpath="Build";
         pathdelete="deleteBuild";
    }
    else if(value == "Overweight Exercises"){
      path="trainingthird";
      textpath="Overweight";
         pathdelete="deleteOver";
    }
    else if(value == "Thigh Exercises"){
      path="trainingsecond";
      textpath="Thigh";
         pathdelete="deleteThigh";
    }
    else if(value == "Stomach Exercises"){
      path="trainingfirst";
      textpath="Stomach";
         pathdelete="deleteStomach";
    }
    else if(value == "Cardio Exercises"){


      path="Warmget";
      textpath="Cardio";
    }
        else if(value == "Yoga Exercises"){


      path="Warmget";
      textpath="Yoga";
    }
        else if(value == "Zomba Exercises"){


      path="Warmget";
      textpath="Zomba";
    }
        else if(value == "Leg Exercises"){


      path="Warmget";
      textpath="Leg";
    }
        else if(value == "Arm Exercises"){


      path="Warmget";
      textpath="Arm";
    }
        else if(value == "back Exercises"){


      path="Warmget";
      textpath="Back";
    }
        else if(value == "Gainweight Exercises"){


      path="Warmget";
      textpath="Gainweight";
    }
  
    setState(() { 
      textpath=textpath;
        pathdelete=pathdelete;
    myAllDaea.length=0;
     path=path; 
          initState();
     print("my parthhh"+path);
    });

  }
      getData() async {
    var response = await http.post(
      Uri.parse("http://192.168.1.35:3002/$pathdelete"),
      body: jsonEncode({
        "title": title2,
      }),
      headers: _setHeader(),
    );
    String jsonsDataString = response.body
        .toString();
            setState(() {
        myAllDaea.length=0; // toString of Response's body is assigned to jsonDataString
   initState();});
    var _data = jsonDecode(jsonsDataString).toString();
    print(_data);

  }
}

_setHeader() => {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
