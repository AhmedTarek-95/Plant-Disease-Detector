import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:plant_disease_detector/src/login_page/Loginpage.dart';



class SginupPage extends StatefulWidget {
  static const String sginupPage = 'Sginup_Page';

  @override
  State<SginupPage> createState() => _SginupPageState();
}
class _SginupPageState extends State<SginupPage> {
  GlobalKey<FormState> signKey =GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var nameController = TextEditingController();

  bool isPassword =true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/omar.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),

                  //#########################

                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0,sigmaY: 10.0,),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Form(
                          key: signKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontSize: 70,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                " To Continue ",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.name,
                                validator: (value)
                                {
                                  if (value == null ||value.isEmpty)
                                  {
                                    return 'Name must not be empty';
                                  }
                                  return null;
                                },
                                onFieldSubmitted: (String value) {
                                  print(value);
                                },
                                onChanged: (String value) {
                                  print(value);
                                },
                                decoration: InputDecoration(
                                  labelText: ' Full name ',
                                  fillColor: Colors.white,
                                  filled: true,
                                  prefixIcon: Icon(
                                    Icons.account_circle,
                                    color: Colors.black,
                                  ),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                validator: (value)
                                {
                                  if (value == null ||value.isEmpty)
                                  {
                                    return 'Email must not be empty';
                                  }
                                  return null;
                                },
                                onFieldSubmitted: (String value) {
                                  print(value);
                                },
                                onChanged: (String value) {
                                  print(value);
                                },
                                decoration: InputDecoration(
                                  labelText: 'Email Address',
                                  fillColor: Colors.white,
                                  filled: true,
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.black,
                                  ),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                validator: (value)
                                {
                                  if (value == null ||value.isEmpty)
                                  {
                                    return 'Password must not be empty';
                                  }
                                  return null;
                                },
                                obscureText: isPassword,
                                onFieldSubmitted: (String value) {
                                  print(value);
                                },
                                onChanged: (String value) {
                                  print(value);
                                },
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  fillColor: Colors.white,
                                  filled: true,
                                  prefixIcon: Icon(Icons.lock,
                                    color: Colors.black,),
                                  suffixIcon:IconButton(
                                    onPressed: (){
                                      setState(() {
                                        isPassword =!isPassword;
                                      });
                                    },
                                    icon: Icon( isPassword?Icons.visibility: Icons.visibility_off),
                                  ),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 3, left: 3),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    border: Border(
                                        bottom: BorderSide(color: Colors.black),
                                        top: BorderSide(color: Colors.black),
                                        right: BorderSide(color: Colors.black),
                                        left: BorderSide(color: Colors.black))),
                                child: MaterialButton(
                                  minWidth: double.infinity,
                                  height: 50,
                                  onPressed: () {
                                    if(signKey.currentState!.validate())
                                      { print("You are Sign Up");
                                      Navigator.pushNamed(
                                        context,
                                        LoginPage.loginPage,
                                      );}

                                  },
                                  color: Colors.lightGreen,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40)),
                                  child: Text(
                                    " Sign Up ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 25.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                  "Already have an account??",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                                  SizedBox(width: 5,),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginPage(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Login",
                                      style: TextStyle( fontWeight: FontWeight.w600,

                                        color: Colors.blue[800],
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),],
                              ),


                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                " or login with ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 20.0),
                                child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                          onTap: () => print(' sign up with Facebook '),
                                          child: Container(
                                            height: 50.0,
                                            width: 50.0,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black26,
                                                  offset: Offset(0, 2),
                                                  blurRadius: 6.0,
                                                ),
                                              ],
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/face.jpg'),
                                              ),
                                            ),
                                          )),
                                      GestureDetector(
                                          onTap: () => print(' sign up with google '),
                                          child: Container(
                                            height: 50.0,
                                            width: 50.0,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black26,
                                                  offset: Offset(0, 2),
                                                  blurRadius: 6.0,
                                                ),
                                              ],
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/download.png'),
                                              ),
                                            ),
                                          )),
                                      GestureDetector(
                                          onTap: () => print(' sign up with Icloud '),
                                          child: Container(
                                            height: 50.0,
                                            width: 50.0,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black26,
                                                  offset: Offset(0, 2),
                                                  blurRadius: 6.0,
                                                ),
                                              ],
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/Apple.jpg'),
                                              ),
                                            ),
                                          )),
                                    ]),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}