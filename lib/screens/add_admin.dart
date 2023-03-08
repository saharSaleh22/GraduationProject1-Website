// ignore_for_file: unnecessary_null_comparison

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:web_page/widgets/input_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:web_page/widgets/agree.dart';
import 'package:web_page/widgets/gender.dart';
import 'Login.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Admin extends StatefulWidget {
  @override
  State<Admin> createState() => _Admin();
}
  class _Admin extends State<Admin> {

 final  controller=TextEditingController();       // String success="";
 final  controller1=TextEditingController();       // String success="";
 final  controller2=TextEditingController();       // String success="";
 final  controller3=TextEditingController();       // String success="";
 final  controller4=TextEditingController();       // String success="";

    String name="";
    String realname="";
    String phone="";
    String img="";
    String password="";
    String re_password="";
      String mytext="";
            String filee="";

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
                                  });
        
      }catch(e) {
          print(e);
        }

      }
      

  }


            postData() async {
    var response = http.post(Uri.parse("http://192.168.1.35:3002/addCoach"),
        body: jsonEncode({
              
          "name":name,
          "password":password,
          "phone":phone,
          "img":mytext,
          "name2":realname,
          

        }),
        headers: _setHeader(),
        );
  
 
  setState(()
    {
      // success="the date added successfuly!";
    }
   
  );
  }
      late String  filename ;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 240, 244),
      body: Padding(
        padding:
            EdgeInsets.only(top: 100.0, bottom: 60.0, left: 100.0, right: 100.0),
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
                       ClipRRect(
                              borderRadius: BorderRadius.only(  topLeft: Radius.circular(40),bottomLeft: Radius.circular(40),),
                              child: Image.asset("assets/exe_back.png")),
                   
                        SizedBox(width: 30,height: 80,),
                      Column(
                        children: <Widget>[
                            const SizedBox(height: 20.0),

                          Text(
                            "Add Coach",
                            style: TextStyle(
                                color: Color.fromARGB(255, 142, 75, 99),
                                fontWeight: FontWeight.w600,
                                fontSize: 35.0,
                                fontFamily: 'Merriweather'),
                          ),
                          const SizedBox(height: 30.0),



                       

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
                "Coach Name",
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
                 keyboardType: TextInputType.emailAddress,
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
                     
                      hintText: "Please Add Coach Name",
                      fillColor: Color.fromARGB(255, 199, 213, 225),
                      
                ),
                onChanged: (val){
                      setState(() {
                      realname=val;
                });}
              ),
            ),
          ],
        );
      },
    ),
  SizedBox(
                            height: 30.0,
                          ),
                        LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          children: <Widget>[
            Container(
              width: 80.0,
              child: Text(
                "Coach Email",
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
                 keyboardType: TextInputType.emailAddress,
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
                     
                      hintText: "Please Add Coach Email",
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
                            height: 30.0,
                          ),
                           LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          children: <Widget>[
            Container(
              width: 80.0,
              child: Text(
                "Coach phone",
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
                controller: controller2,
                 keyboardType: TextInputType.emailAddress,
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
                     
                      hintText: "Please Add Coach Phone",
                      fillColor: Color.fromARGB(255, 199, 213, 225),
                      
                ),
                onChanged: (val){
                      setState(() {
                      phone=val;
                });}
              ),
            ),
          ],
        );
      },
    ),
  SizedBox(
                            height: 30.0,
                          ),

                            LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          children: <Widget>[
            Container(
              width: 80.0,
              child: Text(
                "Coach Password",
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
                controller: controller3,
                 obscureText: true,
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
                      hintText: "Please Add Coach Password",
                      fillColor: Color.fromARGB(255, 199, 213, 225),
                      
                ),
                onChanged: (val){
                      setState(() {
                      password=val;
                });}
              ),
            ),
          ],
        );
      },
    ),
     SizedBox(
                            height: 30.0,
                          ),
                               
                                    LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          children: <Widget>[
            Container(
              width: 80.0,
              child: Text(
                "Re-Enter Coach Password",
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
                 obscureText: true,
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
                      hintText: "Please Re_Enter Coach Password",
                      fillColor: Color.fromARGB(255, 199, 213, 225),
                      
                ),
                onChanged: (val){
                      setState(() {
                      re_password=val;
                });}
              ),
            ),
          ],
        );
      },
    ),
          

                         
                         SizedBox(
                            height: 30.0,
                          ),
                            Row(
                              children: [
                                ElevatedButton(
                                    //color: Colors.grey[200],
                                    
                                    onPressed: () {
                                      _PickFile();
                                       
                                    },
                                    child: Text("  Upload coach  photo "),
                                     style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(255, 142, 75, 99),
                                    ),
                                    
                                  ),
                                          SizedBox(
                            width: 20.0,
                          ), 
                          Text('${mytext}') ,
                              ],
                            ),
 SizedBox(
                                height: 30.0,
                              ),
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: 140.0,
                              ),
                              ElevatedButton(
                                //color: Colors.grey[200],
                                
                                onPressed: () {
                                  print("name :"+name+"password :"+password);
                                  if(name==""||password==""||re_password==""){
                                    print("inside if :");

                                     setState(()
                                        {
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
                                  else if ( re_password!=password) {
                                    setState(()
                                        {
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
                                      ? 'the password doesnt match  '
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
                  });
                  controller.clear();
                  controller1.clear();
                  controller2.clear();
                  controller3.clear();
                  controller4.clear();
                                  }
                                 // print(name);
                                
                                   
                                },
                                child: Text("  Add Coach  "),
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
                              //  Text('${success}'),
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
  


}
_setHeader() =>{
  'Content-type':'application/json',
  'Accept':'application/json',
};