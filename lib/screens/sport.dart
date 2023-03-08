import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:web_page/widgets/input_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:web_page/widgets/agree.dart';
import 'package:web_page/widgets/gender.dart';
import 'Login.dart';


class sportAdd extends StatefulWidget {
  @override
  State<sportAdd> createState() => _sportAdd();
}
  class _sportAdd extends State<sportAdd> {
   final  controller=TextEditingController();
   final  controller1=TextEditingController();
   final  controller2=TextEditingController();
   final  controller3=TextEditingController();


   // String mytext=""; 
     String mytexti="";  String mytextv="";
        String success="";
    String back_image="assets/white2.png";

    String title="";
    int time=0;
    String thumbnail="";
    String videoUrl="";
   

      String filee="";
      String pathdrink="";
      String pathfood="";
      String path="";
      String path2="";
      String choosenText="   Add to     ";
            postData() async {
    var response = http.post(Uri.parse("http://192.168.1.35:3002/$path"),
        body: jsonEncode({
                 "title":title,
          "time":time,
          "thumbnail":mytexti,

          "videoUrl":mytextv,
          
        }),
        headers: _setHeader(),
        );
  
    print("img : "+mytexti+"ggg  "+mytextv+" , title :"+title +" ,time :"+time.toString());
 
  setState(()
    {
       //success="the date added successfuly!";
    }
   
  );
  }
      late String  filename ;
  void _PickFile()async {
    print("object inside _PickFile");
    FilePickerResult? result;

  try{
    result = await FilePicker.platform.pickFiles(type: FileType.custom,
          allowedExtensions: ['jpg', 'png', 'gif', 'mp4', 'xls', 'xlsx', 'txt'],
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
       setState(() { mytexti="assets/image/"+filee; 
                                  });
         
      }catch(e) {
          print(e);
        }

      }
      

  }

    void _PickFilev()async {
    print("object inside _PickFile");
    FilePickerResult? result;

  try{
    result = await FilePicker.platform.pickFiles(type: FileType.custom,
          allowedExtensions: ['jpg', 'png', 'gif', 'mp4', 'xls', 'xlsx', 'txt'],
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
   
            setState(() { mytextv="assets/videos/"+filee; 
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
                  color: Color.fromARGB(255, 120, 128, 138),
                 
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: 0.0, right: 0.0, left: 0.0, bottom: 0.0),
                  child: Row(
                    children: [
                      Stack(
                          children: [
                            ClipRRect(
                            
                              borderRadius: BorderRadius.only(  topLeft: Radius.circular(40),bottomLeft: Radius.circular(40),),
                              child: Container(
                            
                                child: Image.asset(back_image))),
                            Container(
                              color: Color.fromARGB(255, 142, 75, 99),
                              child:   DropdownButton(
                             borderRadius: BorderRadius.only(  topLeft: Radius.circular(40)),

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
                            ),
                          ],
                        ),
                      
                        SizedBox(width: 10,height: 80,),
                      Column(
                        children: <Widget>[
                           SizedBox(height: 20,),
                          Text(
                            "Add $path2 Exercises",
                            style: TextStyle(
                                color: Color.fromARGB(255, 142, 75, 99),
                                fontWeight: FontWeight.w600,
                                fontSize: 35.0,
                                fontFamily: 'Merriweather'),
                          ),
                          const SizedBox(height: 60.0),

                          //InputField Widget from the widgets folder
                      
                               

                            LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          children: <Widget>[
            Container(
              width: 80.0,
              child: const Text(
                " Exercise Name",
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
                      hintText: "Please Enter Exercise name ",
                      fillColor: Color.fromARGB(255, 199, 213, 225),
                      
                ),
                onChanged: (val){
                      setState(() {
                      title=val ;
                });}
              ),
            ),
          ],
        );
      },
    ),

                          SizedBox(height: 40.0),

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
                "repeat X",
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
                      hintText: "Please Enter the Suggested Time",
                      fillColor: Color.fromARGB(255, 199, 213, 225),
                      
                ),
                onChanged: (val){
                      setState(() {
                      time=int.parse(val) ;
                });}
              ),
            ),
          ],
        );
      },
    ),

                          SizedBox(height: 40.0),

                          //InputField Widget from the widgets folder
                          // InputField(
                  
                          
                          Row(
                            children: [
                              
                                  Text("Add Exercise photo",style: TextStyle(
                                color: Color.fromARGB(255, 142, 75, 99),)) ,
                                   SizedBox(
                            width: 20.0,
                          ),
                           ElevatedButton(
                                //color: Colors.grey[200],
                                
                                onPressed: () {
                                  _PickFile();
                                   
                                },
                                child: Text("  Upload Exercise photo "),
                                 style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(255, 142, 75, 99),
                                ),
                                
                              ),
                                 SizedBox(
                            width: 20.0,
                          ), 
                          Text('${mytexti}') ,
                            ],
                          ),

                          SizedBox(height: 40.0),
                           Row(
                            children: [
                              
                                  Text("Add Exercise video",style: TextStyle(
                                color: Color.fromARGB(255, 142, 75, 99),)) ,
                                   SizedBox(
                            width: 20.0,
                          ),
                           ElevatedButton(
                                //color: Colors.grey[200],
                                
                                onPressed: () {
                                  _PickFilev();
                                   
                                },
                                child: Text("  Upload  Exercise video "),
                                 style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(255, 142, 75, 99),
                                ),
                                
                              ),
                                 SizedBox(
                            width: 20.0,
                          ), 
                          Text('${mytextv}') ,
                            ],
                          ),

                          //Membership Widget from the widgets folder
                          // Aggrenment(),

                          SizedBox(
                            height: 100.0,
                          ),

                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: 140.0,
                              ),
                              ElevatedButton(
                                //color: Colors.grey[200],
                                
                                onPressed: () {
                                  if(title==null||mytexti==null||time==0||mytextv==null){
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox.shrink(),
                                    IconButton(
                                        icon: Icon(Icons.cancel),
                                        onPressed: () {
                                          Navigator.pop(context);
                                      
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
                  });
                  controller.clear();
                  controller1.clear();
                  setState(){
                    mytexti="";
                    mytextv="";
                  }
                                  }
                                 // print(name);
                                
                                   
                                },
                                child: Text("  Add $path2 Exercise  "),
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
       if(value == "Warm-Up Exercises"){
        back_image="assets/warm_up.png";

         path="Warm";
         path2="Warm-Up";
        
    }else if(value == "Build Exercises"){
   back_image="assets/build2.png";

      path="Build";
      path2="Build";
    }
    else if(value == "Overweight Exercises"){
     back_image="assets/over.png";

      path="Overweight";
      path2="Overweight";
    }
    else if(value == "Thigh Exercises"){
    back_image="assets/thigh.png";

      path="Thigh";
      path2="Thigh";
    }
    else if(value == "Stomach Exercises"){
    back_image="assets/stomach.png";

      path="Stomach";
      path2="Stomach";
    }
    else if(value == "Cardio Exercises"){
   back_image="assets/build2.png";

      path="Warm";
      path2="Cardio";
    }
        else if(value == "Yoga Exercises"){
   back_image="assets/yoga.png";

      path="Warm";
      path2="Yoga";
    }
        else if(value == "Zomba Exercises"){
   back_image="assets/zomba.png";

      path="Warm";
      path2="Zomba";
    }
        else if(value == "Leg Exercises"){
   back_image="assets/thigh.png";

      path="Warm";
      path2="Leg";
    }
        else if(value == "Arm Exercises"){
   back_image="assets/build2.png";

      path="Warm";
      path2="Arm";
    }
        else if(value == "back Exercises"){
   back_image="assets/build2.png";

      path="Warm";
      path2="Back";
    }
        else if(value == "Gainweight Exercises"){
   back_image="assets/build2.png";

      path="Warm";
      path2="Gainweight";
    }
    setState(() {
     back_image=back_image;
     path=path;
     path2=path2;
     print("my parthhh"+path);
    });

  }


}
_setHeader() =>{
  'Content-type':'application/json',
  'Accept':'application/json',
};