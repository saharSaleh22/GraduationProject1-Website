import 'dart:typed_data';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:web_page/widgets/input_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:web_page/widgets/agree.dart';
import 'package:web_page/widgets/gender.dart';
import 'Login.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _Home();
}
  class _Home extends State<Home> {

   final  controller=TextEditingController();
   final  controller1=TextEditingController();
   final  controller2=TextEditingController();
   final  controller3=TextEditingController();
   final  controller4=TextEditingController();
   final  controller5=TextEditingController();
    String mytext="";
        String success="";
    // ignore: non_constant_identifier_names
    String back_image="assets/white2.png";
    int id=0;
    String name="";
    String description="";
    int price=0;
   String choosenLevel="    difficulty level    ";
String Ingridients = "";
String level="";
int MakingTime = 0;
int calories = 0;
      String filee="";
      String pathdrink="";
      String pathfood="";
      String path="";
      String uploaded="";
      String choosenText="   Add to     ";
            postData() async {
    var response = http.post(Uri.parse("http://192.168.1.35:3002/$path"),
        body: jsonEncode({
                 "id":id,
          "name":name,
          "description":description,

          "price":price,
          "img":mytext,
          "Ingridients":Ingridients ,
          "MakingTime":MakingTime ,
          "calories": calories,
          "level":choosenLevel ,
        }),
        headers: _setHeader(),
        );
  
    print("img : "+mytext+" , name :"+name +" ,price :"+price.toString());
 
  // setState(()
  //   {
  //      success="the date added successfuly!";
  //   }
   
 // );
  }
      late String  filename ;
  void _PickFile()async {
    print("object inside _PickFile");
    FilePickerResult? result;

  try{
    result = await FilePicker.platform.pickFiles(type: FileType.custom,
          allowedExtensions: ['jpg', 'png', 'doc', 'docx', 'xls', 'xlsx', 'txt'],
        );
  } catch(e)
  { print(e);
    }
      if(result != null) {
        try{

          Uint8List? uploadfile = result.files.single.bytes;
        
          filename = result.files.single.name;
          print(filename);
           setState(() {
           filee=filename; 
          }); 
       setState(() { mytext="assets/image/"+filee; 
       uploaded="Uplouded";
                                  });
        
      }catch(e) {
          print(e);
        }

      }
      

  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 240, 244),
      body: Padding(
        padding:
            EdgeInsets.only(top: 60.0, bottom: 60.0, left: 120.0, right: 120.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
          elevation: 5.0,
          child: Container(
            child: Row(
              children: <Widget>[
                Container(
                  width: 0,
                  height: 0,
                  color: Color.fromARGB(255, 46, 96, 158),
                 
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: 0.0, right: 10.0, left: 0.0, bottom: 0.0),
                  child: Row(
                    children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(  topLeft: Radius.circular(40),bottomLeft: Radius.circular(40),),
                              child: Image.asset(back_image)),
                            Container(
                              color: Color.fromARGB(255, 142, 75, 99),
                              child: DropdownButton(
                                
                                
                              hint: Text(choosenText),
                              items: [
                                DropdownMenuItem(
                                  value: "drink menu",
                                  child: Text("drink menu"),
                                ),
                                DropdownMenuItem(
                                  value: "meals menu",
                                  child: Text("meals menu"),
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
                            ),
                          ],
                        ),
                        SizedBox(width: 10,height: 80,),
                      Column(
                        children: <Widget>[
                          const SizedBox(height: 35.0),
                          Text(
                            "Add ${path}",
                            style: TextStyle(
                                color: Color.fromARGB(255, 142, 75, 99),
                                fontWeight: FontWeight.w600,
                                fontSize: 35.0,
                                fontFamily: 'Merriweather'),
                          ),
                          const SizedBox(height: 35.0),

                          //InputField Widget from the widgets folder
                      
                               

                       

                           Row(
                             children: [
                               LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          children: <Widget>[
            Container(
              width: 40.0,
              child: Text(
                "name",
                textAlign: TextAlign.left,
                style: TextStyle(
                                color: Color.fromARGB(255, 168, 77, 94)
                          ),
              ),
            ),
            // SizedBox(
            //   width: 10.0,
            // ),
            Container(
              width: MediaQuery.of(context).size.width / 8,
              color: Color.fromARGB(255, 223, 198, 203),
              child: TextField(
                controller: controller,
                style: TextStyle(
                      fontSize: 15.0,
                ),
                decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 199, 213, 225),
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 199, 213, 225),
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      hintText: "Please Enter Name for ${path}",
                      fillColor: Color.fromARGB(255, 199, 213, 225),
                      
                ),
                onChanged: (val){
                      setState(() {
                      name=val;
                });}
              ),
            ),
          ],
        );
      },
    ),
    SizedBox(
              width: 20.0,
            ),
                               LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          children: <Widget>[
            Container(
              width: 60.0,
              child: Text(
                "Calories",
                textAlign: TextAlign.left,
                style: TextStyle(
                                color: Color.fromARGB(255, 168, 77, 94)
                          ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 8,
              color: Color.fromARGB(255, 223, 198, 203),
              child: TextField(
                controller: controller1,
                style: TextStyle(
                      fontSize: 15.0,
                ),
                decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 199, 213, 225),
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 199, 213, 225),
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      hintText: "Please Enter Calories for ${path}",
                      fillColor: Color.fromARGB(255, 199, 213, 225),
                      
                ),
                onChanged: (val){
                      setState(() {
                      calories=int.parse(val) ;
                });}
              ),
            ),
          ],
        );
      },
    ),
                             ],
                           ),

                          SizedBox(height: 35.0),
                              Row(
                              children: [  LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          children: <Widget>[
            Container(
              width: 40.0,
              child: Text(
                "Price",
                textAlign: TextAlign.left,
                style: TextStyle(
                            color: Color.fromARGB(255, 168, 77, 94)
                          ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 8,
              color: Color.fromARGB(255, 223, 198, 203),
              child: TextField(
                controller: controller2,
                style: TextStyle(
                      fontSize: 15.0,
                ),
                decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 199, 213, 225),
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 199, 213, 225),
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      hintText: "Please Enter the Price",
                      fillColor: Color.fromARGB(255, 199, 213, 225),
                      
                ),
                onChanged: ( val){
                      setState(() {
                      price=int.parse(val) ;
                 // print(price);
                });}
              ),
            ),
          ],
        );
      },
    ),
                               
 SizedBox(
              width: 20.0,
            ),
                           LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          children: <Widget>[
            Container(
              width: 60.0,
              child: Text(
                "Making time",
                textAlign: TextAlign.left,
                style: TextStyle(
                            color: Color.fromARGB(255, 168, 77, 94)
                          ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 8,
              color: Color.fromARGB(255, 223, 198, 203),
              child: TextField(
                controller: controller3,
                style: TextStyle(
                      fontSize: 15.0,
                ),
                decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 199, 213, 225),
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 199, 213, 225),
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      hintText: "Please Enter making time for ${path}",
                      fillColor: Color.fromARGB(255, 199, 213, 225),
                      
                ),
                onChanged: (val){
                      setState(() {
                      MakingTime=int.parse(val) ;
                });}
              ),
            ),
          ],
        );
      },
    ),
                              ],
                            ),
                            SizedBox(height: 35,),

                          //Gender Widget from the widgets folder
                          //Gender(),

                          //InputField Widget from the widgets folder
                        LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          children: <Widget>[
            Container(
              width: 80.0,
              child: Text(
                "${path} Ingredients",
                textAlign: TextAlign.left,
                style: TextStyle(
                            color: Color.fromARGB(255, 168, 77, 94)
                          ),
              ),
            ),
            SizedBox(
              width: 40.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3.7,
              color: Color.fromARGB(255, 223, 198, 203),
              child: TextField(
                controller: controller4,
                style: TextStyle(
                      fontSize: 15.0,
                ),
                decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 199, 213, 225),
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 199, 213, 225),
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      hintText: "Please Add the ${path} Ingredints",
                      fillColor: Color.fromARGB(255, 199, 213, 225),
                      
                ),
                onChanged: (val){
                      setState(() {
                      Ingridients=val;
                });}
              ),
            ),
          ],
        );
      },
    ),

                          SizedBox(height: 35.0),

                          //InputField Widget from the widgets folder
                          // InputField(
                          //     label: "Recipe", content: "Please Enter the Recipe"),
  LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          children: <Widget>[
            Container(
              width: 80.0,
              child: Text(
                "Recipe",
                textAlign: TextAlign.left,
                style: TextStyle(
                            color: Color.fromARGB(255, 168, 77, 94)
                          ),
              ),
            ),
            SizedBox(
              width: 40.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3.7,
              color: Color.fromARGB(255, 223, 198, 203),
              child: TextField(
                controller: controller5,
                style: TextStyle(
                      fontSize: 15.0,
                ),
                decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 199, 213, 225),
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 199, 213, 225),
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      hintText: "Please Enter the Recipe",
                      fillColor: Color.fromARGB(255, 199, 213, 225),
                      
                ),
                onChanged: (val){
                      setState(() {
                      description=val;
                });}
              ),
            ),
          ],
        );
      },
    ),
                          SizedBox(height: 35.0),

                

                          
                          Row(
                            children: [
                                SizedBox(width: 80,),
     DropdownButton(
                          
                        hint: Text(choosenLevel),
                        items: [
                          DropdownMenuItem(
                            value: "Hard",
                            child: Text("hard"),
                          ),
                          DropdownMenuItem(
                            value: "Easy",
                            child: Text("easy"),
                          ),
                           DropdownMenuItem(
                            value: "Normal",
                            child: Text("Normal"),
                          ),
                        
                        ],
                        onChanged: (value) {
                           print("this is my value"+value!);
                         selected2(value);
                            hint: Text(
                "Select Your Field"
              );
              setState(() {
                choosenLevel=value;
              });

                        }),
                              
                                  Text("${path} photo",style: TextStyle(
                                color: Color.fromARGB(255, 142, 75, 99),)) ,
                                   SizedBox(
                            width: 20.0,
                          ),
                           ElevatedButton(
                                //color: Colors.grey[200],
                                
                                onPressed: () {
                                  _PickFile();
                                   
                                },
                                child: Text("  Upload ${path}  photo "),
                                 style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(255, 142, 75, 99),
                                ),
                                
                              ),
                                 SizedBox(
                            width: 20.0,
                          ), 
                          Text('${uploaded}') ,
                            ],
                          ),

                         

                          //Membership Widget from the widgets folder
                          // Aggrenment(),

                          SizedBox(
                            height: 35.0,
                          ),

                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: 140.0,
                              ),
                              ElevatedButton(
                                //color: Colors.grey[200],
                                
                                onPressed: () {
                                  if(name==null||description==null||price==0||mytext==null||Ingridients==null||MakingTime==0||choosenLevel==null||calories==0){
                                     setState(()
                                        {

                               // success="you should fill all the data !";
                                    showGeneralDialog(
                  barrierLabel: 'label',
                  barrierDismissible: true,
                  barrierColor: Colors.black.withOpacity(0.5),
                  transitionDuration: Duration(milliseconds: 300),
                  context: context,
                  transitionBuilder: (context, anim1, anim2, child) {
                    return SlideTransition(
                      position: Tween(begin: Offset(0, 1), end: Offset(0, 0))
                          .animate(anim1),
                      child: child,
                    );
                  },
                  pageBuilder: (context, anim1, anim2) {
                    return Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 500,
                        width: 350,
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Material(
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  // mainAxisAlignment:
                                  //     MainAxisAlignment.start,
                                  children: [
                                    SizedBox.shrink(),
                                    IconButton(
                                        icon: Icon(Icons.cancel),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          setState(() {
                                            //_success = !_success;
                                          });
                                        })
                                  ],
                                ),
                                Image.asset(
                                  false
                                      ? 'assets/success.png'
                                      : 'assets/fail2.png',
                                  height: 200,
                                ),
                                const Text(
                                  true ? 'fail' : 'Oh-ooh',
                                  style: TextStyle(
                                    color: false
                                        ? Color(0xff81cffc)
                                        : Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                                const Text(
                                  true
                                      ? 'you should fill all the data  '
                                      : 'It seems that you are out of tune...\ntry again or you will be thrown tomatoes!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15,
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 235,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
                                     });
                                  }
                                  else{
                                    
                                     postData(); 

                                        showGeneralDialog(
                  barrierLabel: 'label',
                  barrierDismissible: true,
                  barrierColor: Colors.black.withOpacity(0.5),
                  transitionDuration: Duration(milliseconds: 300),
                  context: context,
                  transitionBuilder: (context, anim1, anim2, child) {
                    return SlideTransition(
                      position: Tween(begin: Offset(0, 1), end: Offset(0, 0))
                          .animate(anim1),
                      child: child,
                    );
                  },
                  pageBuilder: (context, anim1, anim2) {
                    return Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 500,
                        width: 350,
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Material(
                          child: Container(
                            color: Colors.white,
                            child: Column(
                             // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  // mainAxisAlignment:
                                  //     MainAxisAlignment.start,
                                  children: [
                                    SizedBox.shrink(),
                                    IconButton(
                                        icon: Icon(Icons.cancel),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          setState(() {
                                            //_success = !_success;
                                          });
                                        })
                                  ],
                                ),
                                Image.asset(
                                  true
                                      ? 'assets/success2.png'
                                      : 'assets/fail.JPG',
                                  height: 200,
                                ),
                                const Text(
                                  true ? 'Success' : 'Oh-ooh',
                                  style: TextStyle(
                                    color: true
                                        ? Color(0xff81cffc)
                                        : Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                                const Text(
                                  true
                                      ? 'the data added successfully to your database '
                                      : 'It seems that you are out of tune...\ntry again or you will be thrown tomatoes!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15,
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 235,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                 
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  })
                  
                  ; controller.clear();
                  controller1.clear();
                  controller2.clear();
                  controller3.clear();
                  controller4.clear();
                  controller5.clear();

                                  }
                                 // print(name);
                                
                                   
                                },
                                child: Text("  Add ${path}  "),
                                 style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(255, 142, 75, 99),
                                ),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              ElevatedButton(
                                // color: Colors.lightBlue,
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(255, 142, 75, 99),
                                ),
                                child: Text(
                                  "   Cancel  ",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                               SizedBox(
                                width: 20.0,
                              ),
                                Text('${success}'),
                            ],
                           
                            
                          ),
                         
                        
                        ],
                       
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  void selected(value) {
       if(value == "drink menu"){
         path="Drink";
         back_image="assets/drink_background.png";
    }else if(value == "meals menu"){
      path="Meal";
       back_image="assets/food_background.png";
    }
    setState(() {
     back_image=back_image;
     path=path;
     print("my parthhh"+path);
    });

  }
    void selected2(value) {
       if(value == "Easy"){
         choosenLevel="Easy";
    }else if(value == "Normal"){
         choosenLevel="Normal";
    }
    else if(value == "Hard"){
         choosenLevel="Hard";
    }
    setState(() {

     choosenLevel=choosenLevel;
     print("my parthhh"+choosenLevel);
    });

  }

}
_setHeader() =>{
  'Content-type':'application/json',
  'Accept':'application/json',
};