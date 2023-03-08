import 'package:flutter/material.dart';
import 'package:web_page/screens/add_admin.dart';
import 'package:web_page/screens/home.dart';
import 'package:web_page/screens/sport.dart';
import 'package:web_page/screens/sportTables.dart';
import 'package:web_page/screens/tw.dart';

import 'coachHome.dart';

class DashboardScreen2 extends StatefulWidget {
   static String routeName = "/dash";
  const DashboardScreen2({Key? key}) : super(key: key);

  @override
  State<DashboardScreen2> createState() => _DashboardScreenState2();
}

class _DashboardScreenState2 extends State<DashboardScreen2> {
  //setting the expansion function for the navigation rail
  bool isExpanded = true;
  bool tw1=false;
  int selectedIndex=0;
  PageController pageController =PageController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Row(
        children: [
          //Let's start by adding the Navigation Rail
          NavigationRail(
            
              extended: isExpanded,
              backgroundColor: Color.fromARGB(255, 254, 218, 218),
              unselectedIconTheme:
                  IconThemeData(color: Colors.white, opacity: 1),
              unselectedLabelTextStyle: TextStyle(
                color: Colors.white,
              ),
              selectedIconTheme:
                  IconThemeData(color:Color.fromARGB(255, 157, 93, 93),),
                  onDestinationSelected: (newIndex){
                    setState((){
                     selectedIndex=newIndex;
                     if(selectedIndex==1)
                     {
                      tw1=true;
                     }
                     pageController.animateToPage(newIndex, duration: Duration(milliseconds: 1), curve: Curves.bounceOut);
                    });
                  
                  },
              // ignore: prefer_const_literals_to_create_immutables
              destinations: [
                 const NavigationRailDestination(
                  
                  icon: Icon(Icons.home),
                  label: Text("Home Page",selectionColor:Color.fromARGB(255, 157, 93, 93) ,style:TextStyle( color:Color.fromARGB(255, 137, 136, 144))),
                ),
                const NavigationRailDestination(
                  
                  icon: Icon(Icons.brunch_dining),
                  label: Text("Food Tables",selectionColor:Color.fromARGB(255, 157, 93, 93) ,style:TextStyle( color:Color.fromARGB(255, 137, 136, 144))),
                ),
                const NavigationRailDestination(
                  icon: Icon(Icons.ramen_dining),
                  label: Text("add Food",selectionColor:Color.fromARGB(255, 157, 93, 93) ,style:TextStyle( color:Color.fromARGB(255, 137, 136, 144)),),
                ),
                const NavigationRailDestination(
                  icon: Icon(Icons.self_improvement),
                  label: Text("Add Exercise",selectionColor:Color.fromARGB(255, 157, 93, 93) ,style:TextStyle( color:Color.fromARGB(255, 137, 136, 144)),),
                ),
               
                  const NavigationRailDestination(
                  icon: Icon(Icons.fitness_center),
                  label: Text("Exercises Tables",selectionColor:Color.fromARGB(255, 157, 93, 93) ,style:TextStyle( color:Color.fromARGB(255, 137, 136, 144)),),
                ),
              ],
              selectedIndex: selectedIndex),
          Expanded(
            
            child: PageView(
              controller:pageController,
              children: [
                coachHome(),
                tables(),
                
                  Home(),
                  sportAdd(),
          
                   Sporttables(),          
                Container(color: Color.fromARGB(26, 146, 38, 38),),
                Container(color: Color.fromARGB(255, 182, 25, 25),),
              ],
            ),
          ),
        ],
      ),
      //let's add the floating action button
    
    );
  }
}
