import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/foodModel.dart';
import '../models/signModel.dart';

String name1 ="";
String name = "";
String description = "";
String space="                  ";
int price = 0;
String img = "";
String Ingridients = "";
String level="";
int MakingTime = 0;
int calories = 0;
String textpath="Meal";
      String path="recommended";
String pathdelete="deleteMeal";
String choosenText=" table of :";
class tables extends StatefulWidget {
  static String routeName = "/dash";
  const tables({Key? key}) : super(key: key);

  @override
  State<tables> createState() => _tables();
}

class _tables extends State<tables> {
  List info = [];
  List valueMap = [];

  List<mongofoodModel> myAllDaea = [];
  
  //int get index => this.index;
int m=0;
  _initData() async {
    
    var response = await http.get(
      Uri.parse("http://192.168.1.35:3002/$path"),
      headers: _setHeader(),
    );
   print("my path : "+path);
  //  if(path=="recommended"){
  //         pathdelete="deleteMeal";
  //  }
  //  else{
  //         pathdelete="deleteDrink";
  //  }
   print("deleete"+pathdelete);
    String jsonsDataString = response.body.toString();
    var response3 = jsonDecode(response.body);

    //print(response3[3]);
    // toString of Response's body is assigned to jsonDataString
    valueMap = jsonDecode(jsonsDataString);
    for (var data in valueMap) {
      myAllDaea.add(new mongofoodModel(data['name'], data['description'],
          data['price'], data['img'],data['calories'], data['level'],
          data['Ingridients'], data['MakingTime'],));
      // info.add(new signModel(data['email'], data['phone'],data['address'], data['firstname'],data['lastname']));
    
      name = data['name'];
      description = data['description'];
      price =  data['price'];
      img = data['img'];
      level= data['level'];
      Ingridients= data['Ingridients'];
      MakingTime= data['MakingTime'];
      calories= data['calories'];
m= myAllDaea.length;
      setState(() {
        // info.add(new signModel(data['email'], data['phone'],data['address'], data['firstname'],data['lastname']));
      
      name = data['name'];
      description = data['description'];
      price = data['price'];
      img = data['img'];
            level= data['level'];
      Ingridients= data['Ingridients'];
      MakingTime= data['MakingTime'];
      calories= data['calories'];
      });
    }
    myAllDaea.forEach((element) {
      print(
           'making : ${element.MakingTime}   phone :${element.name}  address :${element.description}  firstname :${element.price}  lastname :${element.img} ');
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
                            " ${textpath} tables",
                            style: const TextStyle(
                              
                                color: Color.fromARGB(255, 142, 75, 99),
                                fontWeight: FontWeight.w600,
                                fontSize: 35.0,
                                fontFamily: 'Merriweather'),
                          ),
                          SizedBox(width: 300,),
                // CircleAvatar(
                //   backgroundImage: AssetImage("assets/coach1.png" ),
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
                        items: [
                          DropdownMenuItem(
                            value: "Meals",
                            child: Text("Meals"),
                          ),
                          DropdownMenuItem(
                            value: "Drinks",
                            child: Text("Drinks"),
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
                          
                          DataColumn(label: Text("Calories")),
                          DataColumn(label: Text("Food Name ")),
                          DataColumn(label: Text("Recipe")),
                          DataColumn(label: Text("price")),
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
                          DataColumn(label: Container(width: 0,child: Text("ID"),),),
                        ],
                        
                        rows: [ DataRow(cells: [
                           
                            DataCell(Text(myAllDaea[index].calories.toString(),textAlign: TextAlign.center)),
                            DataCell(Text(myAllDaea[index].name.length>20?'${myAllDaea[index].name.substring(0,20)}...':myAllDaea[index].name+space.substring(0,20-myAllDaea[index].name.length),textAlign: TextAlign.center),),
                            DataCell(Text(myAllDaea[index].description.length>20?'${myAllDaea[index].description.substring(0,20)}...':myAllDaea[index].description,textAlign: TextAlign.center)),
                            DataCell(Text(myAllDaea[index].price.toString(),textAlign: TextAlign.center)),
                            DataCell(Text(myAllDaea[index].img,textAlign: TextAlign.center)),
                            DataCell(IconButton(onPressed: () {
                              print(",,,,,m  "+myAllDaea[index].name);
                              name1=myAllDaea[index].name;
                              getData();
                            },icon: Icon(Icons.delete,textDirection: TextDirection.rtl),)),

                          ])
                        //  _buildCard(index),
                         
                        ]);
                
               
              }
                void selected(value) {
    
    setState(() {
   if(value == "Drinks"){
         path="food";
          textpath="Drink";
        pathdelete="deleteDrink";

    }else if(value == "Meals"){
      path="recommended";
      textpath="Meal";
  pathdelete="deleteMeal";
    }
   pathdelete=pathdelete;
   print("deleete in 273"+pathdelete);

    myAllDaea.length=0;
     path=path;
     textpath=textpath;
     initState();
     print("my parthhh"+path);
    });

  }
    getData() async {
    var response = await http.post(
      Uri.parse("http://192.168.1.35:3002/$pathdelete"),
      body: jsonEncode({
        "name": name1,
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
