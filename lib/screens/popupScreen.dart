// // ignore_for_file: dead_code

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class popUp extends StatefulWidget {
//   const popUp({super.key});

//   @override
//   State<popUp> createState() => _popUpState();
// }

// class _popUpState extends State<popUp> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child:
//         showGeneralDialog(
//                   barrierLabel: 'label',
//                   barrierDismissible: true,
//                   barrierColor: Colors.black.withOpacity(0.5),
//                   transitionDuration: Duration(milliseconds: 300),
//                   context: context,
//                   transitionBuilder: (context, anim1, anim2, child) {
//                     return SlideTransition(
//                       position: Tween(begin: Offset(0, 1), end: Offset(0, 0))
//                           .animate(anim1),
//                       child: child,
//                     );
//                   },
//                   pageBuilder: (context, anim1, anim2) {
//                     return Align(
//                       alignment: Alignment.center,
//                       child: Container(
//                         height: 500,
//                         width: 350,
//                         padding:
//                             EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         child: Material(
//                           child: Container(
//                             color: Colors.white,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     SizedBox.shrink(),
//                                     IconButton(
//                                         icon: Icon(Icons.cancel),
//                                         onPressed: () {
//                                           Navigator.pop(context);
//                                           setState(() {
//                                             //_success = !_success;
//                                           });
//                                         })
//                                   ],
//                                 ),
//                                 Image.asset(
//                                   true
//                                       ? 'assets/image/pink.png'
//                                       : 'assets/fail.JPG',
//                                   height: 200,
//                                 ),
//                                 const Text(
//                                   true ? 'Success' : 'Oh-ooh',
//                                   style: TextStyle(
//                                     color: true
//                                         ? Color(0xff81cffc)
//                                         : Colors.red,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 25,
//                                   ),
//                                 ),
//                                 const Text(
//                                   true
//                                       ? 'Your guitar is tuned and now you are ready to hit the stage and rock!'
//                                       : 'It seems that you are out of tune...\ntry again or you will be thrown tomatoes!',
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                     color: Colors.black54,
//                                     fontSize: 15,
//                                   ),
//                                 ),
//                                 Container(
//                                   height: 50,
//                                   width: 235,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(30),
//                                   ),
//                                   child: Material(
//                                     borderRadius: BorderRadius.circular(30),
//                                     color: true
//                                         ? Color(0xff81cffc)
//                                         : Colors.red,
//                                     child: MaterialButton(
//                                       onPressed: () {},
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         // ignore: prefer_const_literals_to_create_immutables
//                                         children: [
//                                           const Expanded(
//                                               child: Text(
//                                             true
//                                                 ? 'Let\'s Rock!'
//                                                 : 'Tune Guitar',
//                                             textAlign: TextAlign.center,
//                                             style: TextStyle(
//                                               fontSize: 20,
//                                               color: Colors.white,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ))
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   }),
//     );
//   }
// }