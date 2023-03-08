import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:web_page/constants.dart';

import '../../screens/dashCoach.dart';
import '../../screens/dashboard_screen.dart';
import '../../service/AuthService.dart';
import '../../service/keyboard.dart';
var userEmail="";
class LoginPageLeftSide extends StatefulWidget {
  @override
  _LoginPageLeftSideState createState() => _LoginPageLeftSideState();
}

class _LoginPageLeftSideState extends State<LoginPageLeftSide> {
    bool isChecked = false;
  final _formKey = GlobalKey<FormState>();

  var name;
  bool h1 = false;
  var newValue;
  var password;
  var token;
  bool? remember = false;
  final List<String?> errors = [];

  get getEmail {
    var eml = name;
  }

  get getPassword {
    var pass = password;
  }

  void _updateemail(val) {
    setState(() {
      name = val;
    });
    print(name);
  }

  void _updatepasswode(val) {
    setState(() {
      password = val;
    });
  }

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {

      Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Color.fromARGB(255, 142, 75, 99);
      }
      return Color.fromARGB(255, 206, 160, 176);
    }
    return Expanded(
        child: Center(
      child: Padding(
        padding: const EdgeInsets.all(120.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             const Text(
                    textAlign: TextAlign.center,
                            "Healthy Life Style",
                            style: TextStyle(
                              
                                color: Color.fromARGB(255, 142, 75, 99),
                                fontWeight: FontWeight.w600,
                                fontSize: 35.0,
                                fontFamily: 'Merriweather'),
                          ),
                          SizedBox(height: 30,),
            Row(
              children: [
                 isChecked?const Text(
                  
                  "Coach Login",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                ):const Text(
                  
                  "Admin Login",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                ),
                const SizedBox(width:30),
                Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    ),
     const SizedBox(width:5),
     const Text(
                  "Coach Login",
                  style: TextStyle(fontSize: 14,color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "please Enter your credentials",
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 24),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    buildEmailFormField(),
                    SizedBox(height: 30),
                    buildPasswordFormField(),
                    const SizedBox(height: 24),
                    Align(
                      alignment: Alignment.topRight,
                      //child: MaterialButton(child: const Text("Forget password?"), onPressed: (){},),
                    ),
                    const SizedBox(height: 24),
                  ],
                )),
            MaterialButton(
              child: Text("Login"),
              onPressed: () {
                userEmail=name;
                isChecked? AuthService().loginCoach(name, password).then((newValue) {
                  if (newValue.data['success']) {
                    token = newValue.data['token'];
                    h1 = true;

                    Fluttertoast.showToast(
                        msg: 'Authenticated',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                  if (_formKey.currentState!.validate() && h1) {
                    _formKey.currentState!.save();
                    // if all are valid then go to success screen
                    KeyboardUtil.hideKeyboard(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashboardScreen2()),
                    );
                  }
                }):AuthService().login(name, password).then((newValue) {
                  if (newValue.data['success']) {
                    token = newValue.data['token'];
                    h1 = true;

                    Fluttertoast.showToast(
                        msg: 'Authenticated',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                  if (_formKey.currentState!.validate() && h1) {
                    _formKey.currentState!.save();
                    // if all are valid then go to success screen
                    KeyboardUtil.hideKeyboard(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashboardScreen()),
                    );
                    //     Navigator.pushNamed(context, DashboardScreen.routeName);
                  }
                });
              },
              minWidth: double.infinity,
              height: 52,
              elevation: 24,
              color: Color.fromARGB(255, 217, 175, 175),
              textColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32)),
            )
          ],
        ),
      ),
    ));
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        _updatepasswode(value);
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        //suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => name = newValue,
      onChanged: (value) {
        _updateemail(value);
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        //suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
