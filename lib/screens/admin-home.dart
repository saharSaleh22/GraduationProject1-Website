import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/foodModel.dart';
import '../models/signModel.dart';
import '../ui/pages/login_page.dart';


class adminHome extends StatefulWidget {
  static String routeName = "/dash";
  const adminHome({Key? key}) : super(key: key);

  @override
  State<adminHome> createState() => _adminHome();
}

class _adminHome extends State<adminHome> {

  
  //int get index => this.index;
int m=0;


  @override
  void initState() {
   // super.initState();
    // getData();
   setState(() {
    // _initData();
   });
    
  }

  //setting the expansion function for the navigation rail
  bool isExpanded = false;
  Widget build(BuildContext context) {
    return Stack(
      // 

      children:[ SingleChildScrollView(
        child: Image.asset('assets/admin-background.png',fit: BoxFit.cover,width: double.infinity,  opacity: const AlwaysStoppedAnimation(.6),
      ),
      ),
      const Center(

        child: Text("Admin Home Page", style: TextStyle(
                              
                                color: Color.fromARGB(255, 125, 28, 62),
                                fontWeight: FontWeight.w600,
                                fontSize: 60.0,
                                fontFamily: 'Merriweather'),),
      ),      Row(
      
        
        children: [
          SizedBox(width: 600,height: 20,),
          Align( alignment: Alignment.bottomRight,child:Row(children: [
                      InkWell(
          
          child: const Text("logout",style: TextStyle(
                
                                
                                  color: Color.fromARGB(255, 125, 28, 62),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 25.0,
                                  fontFamily: 'Merriweather'),),
                                 // icon :Icons.arrow_back,
          onTap: () {
            Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
          },
        ),
        Icon(Icons.arrow_forward,color: Color.fromARGB(255, 125, 28, 62),
),
          ],) ,),



     ] ),
     ]
    );
    
  }
       


}

